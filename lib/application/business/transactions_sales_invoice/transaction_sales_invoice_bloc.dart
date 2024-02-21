import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:quickprism/core/utils/extensions.dart';
import 'package:quickprism/domain/invoice/i_invoice_repo.dart';
import 'package:quickprism/domain/invoice/models/item_lots/item_lots_model.dart';
import 'package:quickprism/domain/invoice/models/item_units_with_quantity/units_with_quantity_of_item_model.dart';

import '../../../domain/invoice/create_purchase_response_model/created_invoice_response_model.dart';
import '../../../domain/invoice/create_purchase_response_model/purchaseBodyModel/invoice_body_model.dart';
import '../../../domain/stocks/i_stock_repo.dart';
import '../../../domain/stocks/models/mylist_details/mylist_details_model.dart';
import '../../../domain/user/models/parties/parties_model.dart';
import '../../../domain/user/user_constants.dart';

part 'transaction_sales_invoice_event.dart';
part 'transaction_sales_invoice_state.dart';

@injectable
class TransactionSalesInvoiceBloc
    extends Bloc<TransactionSalesInvoiceEvent, TransactionSalesInvoiceState> {
  List<MyListDetailsData> allItems = [];
  List<InvoiceBodyModelSaleItem> selectedItems = [];
  List<UnitAndQuantityList> unitAndQuantityList = [];
  final IStockRepo _stockRepo;
  final IInvoiceRepo _invoiceRepo;

  TransactionSalesInvoiceBloc(this._stockRepo, this._invoiceRepo)
      : super(const TransactionSalesInvoiceInitial(
            items: [], selectedItems: [], lotsData: [])) {
    on<TransactionSalesInvoiceInitialEvent>(_getAllListedItems);
    on<TransactionSalesInvoiceAddItemEvent>(_addItem);
    on<TransactionSalesInvoiceCreateEvent>(_createInvoice);
    on<TransactionSalesInvoiceSelectPartyEvent>(_selectParty);
    on<TransactionSalesInvoiceGetQuantityAndLotsOfItemEvent>(
        _getLotsAndQuantity);
    on<TransactionSalesInvoiceQuantityEnterEvent>(
        _getNoOfLotsFulfillingQuantity);
  }

  Future<void> _getAllListedItems(TransactionSalesInvoiceInitialEvent event,
      Emitter<TransactionSalesInvoiceState> emit) async {
    emit(TransactionSalesInvoiceLoadingState(
        items: [], selectedItems: [], lotsData: []));
    var resp =
        await _stockRepo.getMyLists(shopId: UserConstants.currentShop!.shopId!);
    resp.fold((l) {
      emit(TransactionSalesInvoiceErrorState(
          items: [], selectedItems: [], lotsData: []));
    }, (r) {
      allItems = r.data as List<MyListDetailsData>;
      emit(TransactionSalesInvoiceMainState(
          items: r.data!, selectedItems: [], lotsData: []));
    });
  }

  Future<void> _addItem(TransactionSalesInvoiceAddItemEvent event,
      Emitter<TransactionSalesInvoiceState> emit) async {
    selectedItems = state.selectedItems;

    if (!selectedItems.contains(event.item)) {
      selectedItems.add(event.item);
    }
    emit(TransactionSalesInvoiceMainState(
        items: state.items, selectedItems: selectedItems, lotsData: []));
  }

  Future<void> _createInvoice(TransactionSalesInvoiceCreateEvent event,
      Emitter<TransactionSalesInvoiceState> emit) async {
    emit(TransactionSalesInvoiceLoadingState(
        items: [], selectedItems: state.selectedItems, lotsData: []));
    final res = await _invoiceRepo.createInvoice(
        request: event.bodyModel, isPurchaseInvoice: false);
    res.fold((l) {
      emit(TransactionSalesInvoiceErrorState(
          items: [], selectedItems: [], lotsData: []));
    }, (r) {
      emit(TransactionSalesInvoiceSuccessState(
          items: allItems,
          selectedItems: event.bodyModel.invoiceBodyModelSaleItem,
          createSalesResponseModel: r,
          lotsData: []));
    });
    // event.bodyModel.toJson().toString().log("salee body");
  }

  Future<void> _selectParty(TransactionSalesInvoiceSelectPartyEvent event,
      Emitter<TransactionSalesInvoiceState> emit) async {
    emit(TransactionSalesInvoicePartySelected(
        items: state.items,
        partyDetail: event.partyDetail,
        selectedItems: state.selectedItems,
        lotsData: []));
  }

  Future<void> _getLotsAndQuantity(
      TransactionSalesInvoiceGetQuantityAndLotsOfItemEvent event,
      Emitter<TransactionSalesInvoiceState> emit) async {
    emit(
      TransactionSalesInvoiceGettingQuantityAndLotsLoadingState(
          items: allItems, selectedItems: selectedItems, lotsData: []),
    );
    if (event.unit.isEmpty) {
      var res2 = await _invoiceRepo.getUnitsWithQuantity(itemId: event.itemId);
      res2.fold((l) {
        emit(TransactionSalesInvoiceGettingQuantityAndLotsErrorState(
            items: allItems, selectedItems: selectedItems, lotsData: []));
      }, (r) {
        unitAndQuantityList = r.unitAndQuantityList;
        emit(TransactionSalesInvoiceGettingQuantityAndLotsSuccessState(
            items: allItems,
            selectedItems: selectedItems,
            noOfLotsAsPerQuantityEnteredByUser: 0,
            lotsData: [],
            unitAndQuantityList: [...r.unitAndQuantityList]));
      });
    } else {
      var res1 = await _invoiceRepo.getItemLots(
          itemId: event.itemId, unit: event.unit);
      var res2 = await _invoiceRepo.getUnitsWithQuantity(itemId: event.itemId);

      var lotsDataData;
      res1.fold((l) {
        emit(TransactionSalesInvoiceGettingQuantityAndLotsErrorState(
            items: allItems, selectedItems: selectedItems, lotsData: []));
      }, (r) {
        lotsDataData = r.lotsDataDatum;
      });
      res2.fold((l) {
        emit(TransactionSalesInvoiceGettingQuantityAndLotsErrorState(
            items: allItems, selectedItems: selectedItems, lotsData: []));
      }, (r) {
        emit(TransactionSalesInvoiceGettingQuantityAndLotsSuccessState(
            items: allItems,
            selectedItems: selectedItems,
            lotsData: lotsDataData,
            noOfLotsAsPerQuantityEnteredByUser: 0,
            unitAndQuantityList: r.unitAndQuantityList));
      });
    }
  }

  Future<void> _getNoOfLotsFulfillingQuantity(
      TransactionSalesInvoiceQuantityEnterEvent event,
      Emitter<TransactionSalesInvoiceState> emit) async {
    int addedQuantity = 0;
    int count = 0;
    for (var element in state.lotsData) {
       addedQuantity += (element.initialQuantity - element.consumedQuantity);
      count++;
      if (addedQuantity >= event.quantityEnteredByUser) {
        emit(TransactionSalesInvoiceGettingQuantityAndLotsSuccessState(
          items: allItems,
          selectedItems: selectedItems,
          lotsData: state.lotsData,
          noOfLotsAsPerQuantityEnteredByUser: count,
          unitAndQuantityList: unitAndQuantityList,
        ));
        break;
      }
    }
  }
  //
}
