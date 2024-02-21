part of 'business_invoice_create_sales_bloc.dart';

@immutable
abstract class BusinessInvoiceCreateSalesState {
  final List<CustomersDatum>? customers;
  final CustomersDatum? currentCustomer;

  BusinessInvoiceCreateSalesState({this.customers, this.currentCustomer});
}

@immutable
abstract class BusinessInvoiceCreateSalesActionState
    extends BusinessInvoiceCreateSalesState {
  BusinessInvoiceCreateSalesActionState(
      {super.customers, super.currentCustomer});
}

class BusinessInvoiceCreateSalesInitial
    extends BusinessInvoiceCreateSalesState {}

class BusinessInvoiceCreateSalesLoadingState
    extends BusinessInvoiceCreateSalesState {}

class BusinessInvoiceCreateSalesErrorState
    extends BusinessInvoiceCreateSalesState {}

class BusinessInvoiceCreateSalesSuccessState
    extends BusinessInvoiceCreateSalesState {
  BusinessInvoiceCreateSalesSuccessState(
      {required super.customers, super.currentCustomer});
}

class BusinessInvoiceCreateSalesNavigateToAddItemState
    extends BusinessInvoiceCreateSalesActionState {}

class BusinessInvoiceCreateSalesNavigateToCustomersState
    extends BusinessInvoiceCreateSalesActionState {}

class BusinessInvoiceCreateSalesNavigateToInvoiceState
    extends BusinessInvoiceCreateSalesActionState {
  BusinessInvoiceCreateSalesNavigateToInvoiceState(
      {super.customers, super.currentCustomer});
}
