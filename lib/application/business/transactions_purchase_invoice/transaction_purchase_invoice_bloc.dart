import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:quickprism/core/utils/extensions.dart';
import 'package:quickprism/domain/invoice/i_invoice_repo.dart';
import 'package:quickprism/domain/stocks/i_stock_repo.dart';
import 'package:quickprism/domain/stocks/models/mylist_details/mylist_details_model.dart';
import 'package:quickprism/domain/user/models/parties/parties_model.dart';
import 'package:quickprism/domain/user/user_constants.dart';
 
import '../../../domain/invoice/create_purchase_response_model/created_invoice_response_model.dart';
import '../../../domain/invoice/create_purchase_response_model/purchaseBodyModel/invoice_body_model.dart';

part 'transaction_purchase_invoice_event.dart';
part 'transaction_purchase_invoice_state.dart';

@injectable
class TransactionPurchaseInvoiceBloc extends Bloc<
    TransactionPurchaseInvoiceEvent, TransactionPurchaseInvoiceState> {
  final IInvoiceRepo _invoiceRepo;
  final IStockRepo _stockRepo;
  TransactionPurchaseInvoiceBloc(this._invoiceRepo, this._stockRepo)
      : super(const TransactionPurchaseInvoiceInitial(
          items: [],
          selectedItems: [],
        )) {
    var allItems;
    on<TransactionPurchaseInvoiceInitialEvent>((event, emit) async {
      emit(
          TransactionPurchaseInvoiceLoadingState(items: [], selectedItems: []));
      var resp = await _stockRepo.getMyLists(
          shopId: UserConstants.currentShop!.shopId!);
      resp.fold((l) {
        emit(
            TransactionPurchaseInvoiceErrorState(items: [], selectedItems: []));
      }, (r) {
        allItems = r.data;
        emit(TransactionPurchaseInvoiceMainState(
          items: r.data!,
          selectedItems: [],
        ));
      });
    });
    on<TransactionPurchaseInvoiceAddItemEvent>((event, emit) {
      var selectedItems = state.selectedItems;

      if (!selectedItems.contains(event.item)) {
        selectedItems.add(event.item);
      }
      emit(TransactionPurchaseInvoiceMainState(
          items: state.items, selectedItems: selectedItems));
    });

    on<TransactionPurchaseInvoiceCreateEvent>((event, emit) async {
      emit(TransactionPurchaseInvoiceLoadingState(
          items: [], selectedItems: state.selectedItems));
      final res = await _invoiceRepo.createInvoice(
          request: event.bodyModel, isPurchaseInvoice: true);
      res.fold((l) {
        emit(
            TransactionPurchaseInvoiceErrorState(items: [], selectedItems: []));
      }, (r) {
        emit(TransactionPurchaseInvoiceSuccessState(
            items: allItems,
            selectedItems: event.bodyModel.invoiceBodyModelPurchaseItem,
            createPurchaseResponseModel: r));
      });
      
      // event.bodyModel.toJson().log("purchasee ");
      // event.bodyModel.invoiceBodyModelPurchaseItem.forEach((element) {
      //   element.toJson().toString().log("purchasee items");
      // });
    });
    on<TransactionPurchaseInvoiceSelectPartyEvent>((event, emit) {
      emit(TransactionPurchaseInvoicePartySelected(
        items: state.items,
        partyDetail: event.partyDetail,
        selectedItems: state.selectedItems,
      ));
    });
  }
}
