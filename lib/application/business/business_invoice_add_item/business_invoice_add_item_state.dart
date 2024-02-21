part of 'business_invoice_add_item_bloc.dart';

@immutable
abstract class BusinessInvoiceAddItemState {
  final List<InvoiceAllItemData>? allItems;
  final List<InvoiceAllItemData>? searchResults;
  final List<InvoiceAllItemData>? selectedItems;
  final List<AddedItemModel>? selectedFUllItems;

  BusinessInvoiceAddItemState({
    this.searchResults,
    this.allItems,
    this.selectedItems,
    this.selectedFUllItems,
  });
}

@immutable
abstract class BusinessInvoiceAddItemActionState
    extends BusinessInvoiceAddItemState {
  BusinessInvoiceAddItemActionState({
    required super.searchResults,
    required super.allItems,
    required super.selectedItems,
    required super.selectedFUllItems,
  });
}

class BusinessInvoiceAddItemInitialState extends BusinessInvoiceAddItemState {
  BusinessInvoiceAddItemInitialState({
    super.searchResults,
    super.allItems,
    super.selectedItems,
    super.selectedFUllItems,
  });
}

class BusinessInvoiceAddItemLoadingState extends BusinessInvoiceAddItemState {
  BusinessInvoiceAddItemLoadingState({
    super.searchResults,
    super.allItems,
    super.selectedItems,
    super.selectedFUllItems,
  });
}

class BusinessInvoiceAddItemErrorState extends BusinessInvoiceAddItemState {}

class BusinessInvoiceAddItemSuccessState extends BusinessInvoiceAddItemState {
  BusinessInvoiceAddItemSuccessState({
    required super.searchResults,
    required super.allItems,
    required super.selectedItems,
    required super.selectedFUllItems,
  });
}

class BusinessInvoiceAddItemNavigateBackState
    extends BusinessInvoiceAddItemActionState {
  BusinessInvoiceAddItemNavigateBackState({
    super.searchResults,
    super.allItems,
    required super.selectedItems,
    required super.selectedFUllItems,
  });
}
