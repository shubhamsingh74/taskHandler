part of 'business_invoice_create_bloc.dart';

@immutable
abstract class BusinessInvoiceCreatePurchaseEvent {}

class BusinessInvoiceCreateInitialEvent
    extends BusinessInvoiceCreatePurchaseEvent {}

class BusinessInvoiceCreateSelectSupplierEvent
    extends BusinessInvoiceCreatePurchaseEvent {}

class BusinessInvoiceCreateAddItemsEvent
    extends BusinessInvoiceCreatePurchaseEvent {}

class BusinessInvoiceCreatePurchaseCreateEvent
    extends BusinessInvoiceCreatePurchaseEvent {
  final InvoiceBodyModel request;

  BusinessInvoiceCreatePurchaseCreateEvent({required this.request});
}
