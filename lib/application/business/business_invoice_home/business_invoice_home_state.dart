part of 'business_invoice_home_bloc.dart';

@immutable
abstract class BusinessInvoiceHomeState {
  final List<InvoicePurchaseListData>? purchaseList;
  final List<InvoiceSalesListData>? salesList;

  BusinessInvoiceHomeState({this.purchaseList, this.salesList});
}

class BusinessInvoiceHomeInitial extends BusinessInvoiceHomeState {
  BusinessInvoiceHomeInitial(
      {required super.purchaseList, required super.salesList});
}

class BusinessInvoiceHomeErrorState extends BusinessInvoiceHomeState {
  BusinessInvoiceHomeErrorState({super.purchaseList, super.salesList});
}

class BusinessInvoiceHomeSuccessState extends BusinessInvoiceHomeState {
  BusinessInvoiceHomeSuccessState(
      {required super.purchaseList, required super.salesList});
}

class BusinessInvoiceHomeLoadingState extends BusinessInvoiceHomeState {
  BusinessInvoiceHomeLoadingState(
      {required super.purchaseList, required super.salesList});
}
