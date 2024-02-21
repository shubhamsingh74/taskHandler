import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:quickprism/domain/invoice/models/invoice_all_item_model.dart';
import 'package:quickprism/domain/stocks/i_stock_repo.dart';
import 'package:quickprism/presentation/screens/business/home_old/invoice/screen_invoice_add_item.dart';

part 'business_invoice_add_item_event.dart';
part 'business_invoice_add_item_state.dart';

@injectable
class BusinessInvoiceAddItemBloc
    extends Bloc<BusinessInvoiceAddItemEvent, BusinessInvoiceAddItemState> {
  final IStockRepo _stockRepo;

  BusinessInvoiceAddItemBloc(this._stockRepo)
      : super(BusinessInvoiceAddItemInitialState(
          allItems: [],
          selectedItems: [],
          searchResults: [],
          selectedFUllItems: [],
        )) {
    on<BusinessInvoiceAddItemInitialEvent>((event, emit) async {
      emit(BusinessInvoiceAddItemLoadingState());

      var response = await _stockRepo.getAllStockItems(
        businessId: event.businessId,
      );

      emit(response.fold((l) {
        return BusinessInvoiceAddItemErrorState();
      }, (r) {
        return BusinessInvoiceAddItemSuccessState(
          allItems: r.data,
          selectedItems: [],
          searchResults: [],
          selectedFUllItems: [],
        );
      }));
    });
    on<BusinessInvoiceAddItemSearchEvent>((event, emit) async {
      if (state.allItems != null) {
        if (event.searchText.isEmpty) {
          emit(BusinessInvoiceAddItemSuccessState(
            searchResults: [],
            allItems: state.allItems,
            selectedItems: state.selectedItems,
            selectedFUllItems: state.selectedFUllItems,
          ));
        } else {
          var resultList = state.allItems!
              .where((e) => e.itemName!
                  .toLowerCase()
                  .contains(event.searchText.toLowerCase()))
              .toList();

          emit(BusinessInvoiceAddItemSuccessState(
            searchResults: resultList,
            allItems: state.allItems,
            selectedItems: state.selectedItems,
            selectedFUllItems: state.selectedFUllItems,
          ));
        }
      }
    });
    on<BusinessInvoiceAddItemAddButtonClickEvent>((event, emit) async {
      if (state.allItems != null) {
        if (!state.selectedItems!.contains(event.itemData)) {
          var selectedList = state.selectedItems;
          var selectedFullList = state.selectedFUllItems;

          var newFullItem = AddedItemModel(
              itemId: event.itemData.itemId!,
              itemName: event.itemData.itemName!,
              date: DateTime.now().toString().split(' ')[0],
              quantity: '10',
              purchasePrice: '100');
          selectedList!.add(event.itemData);
          selectedFullList!.add(newFullItem);

          emit(BusinessInvoiceAddItemSuccessState(
            searchResults: state.searchResults,
            allItems: state.allItems,
            selectedItems: selectedList,
            selectedFUllItems: selectedFullList,
          ));
        } else {
          var selectedList = state.selectedItems;
          var selectedFullList = state.selectedFUllItems;

          selectedList!.remove(event.itemData);
          selectedFullList!.removeWhere(
              (element) => element.itemId == event.itemData.itemId);
          emit(BusinessInvoiceAddItemSuccessState(
            searchResults: state.searchResults,
            allItems: state.allItems,
            selectedItems: selectedList,
            selectedFUllItems: selectedFullList,
          ));
        }
      }
    });

    on<BusinessInvoiceAddItemSaveButtonClickEvent>((event, emit) {
      emit(BusinessInvoiceAddItemNavigateBackState(
        selectedItems: state.selectedItems,
        selectedFUllItems: state.selectedFUllItems,
      ));
    });
  }
}
