part of 'business_invoice_add_item_bloc.dart';

@immutable
abstract class BusinessInvoiceAddItemEvent {}

class BusinessInvoiceAddItemInitialEvent extends BusinessInvoiceAddItemEvent {
  final int businessId;

  BusinessInvoiceAddItemInitialEvent({required this.businessId});
}

class BusinessInvoiceAddItemSearchEvent extends BusinessInvoiceAddItemEvent {
  final String searchText;

  BusinessInvoiceAddItemSearchEvent({required this.searchText});
}

class BusinessInvoiceAddItemAddButtonClickEvent
    extends BusinessInvoiceAddItemEvent {
  final InvoiceAllItemData itemData;

  BusinessInvoiceAddItemAddButtonClickEvent({
    required this.itemData,
  });
}

class BusinessInvoiceAddItemSaveButtonClickEvent
    extends BusinessInvoiceAddItemEvent {}
