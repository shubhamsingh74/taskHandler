part of 'business_invoice_create_bloc.dart';

@immutable
abstract class BusinessInvoiceCreatePurchaseState {
  final List<SuppliersDatum>? suppliers;
  final SuppliersDatum? currentSupplier;

  BusinessInvoiceCreatePurchaseState({this.suppliers, this.currentSupplier});
}

@immutable
abstract class BusinessInvoiceCreateActionState
    extends BusinessInvoiceCreatePurchaseState {
  BusinessInvoiceCreateActionState({super.suppliers, super.currentSupplier});
}

class BusinessInvoiceCreateInitialState
    extends BusinessInvoiceCreatePurchaseState {}

class BusinessInvoiceCreateLoadingState
    extends BusinessInvoiceCreatePurchaseState {}

class BusinessInvoiceCreateErrorState
    extends BusinessInvoiceCreatePurchaseState {}

class BusinessInvoiceCreateSuccessState
    extends BusinessInvoiceCreatePurchaseState {
  BusinessInvoiceCreateSuccessState(
      {required super.suppliers, super.currentSupplier});
}

class BusinessInvoiceCreateNavigateToAddItemState
    extends BusinessInvoiceCreateActionState {}

class BusinessInvoiceCreateNavigateToSupplierState
    extends BusinessInvoiceCreateActionState {}

class BusinessInvoiceCreateNavigateToInvoiceState
    extends BusinessInvoiceCreateActionState {
  BusinessInvoiceCreateNavigateToInvoiceState(
      {super.suppliers, super.currentSupplier});
}
