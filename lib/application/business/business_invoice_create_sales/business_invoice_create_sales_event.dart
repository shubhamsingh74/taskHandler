part of 'business_invoice_create_sales_bloc.dart';

@immutable
abstract class BusinessInvoiceCreateSalesEvent {}

class BusinessInvoiceCreateSalesInitialEvent
    extends BusinessInvoiceCreateSalesEvent {}

class BusinessInvoiceCreateSalesSelectCustomersEvent
    extends BusinessInvoiceCreateSalesEvent {}

class BusinessInvoiceCreateSalesAddItemsEvent
    extends BusinessInvoiceCreateSalesEvent {}

class BusinessInvoiceCreateSalesCreateEvent
    extends BusinessInvoiceCreateSalesEvent {
  // final CreateSalesBodyModel request;

  // BusinessInvoiceCreateSalesCreateEvent({
  //   // required this.request,
  // });
}
