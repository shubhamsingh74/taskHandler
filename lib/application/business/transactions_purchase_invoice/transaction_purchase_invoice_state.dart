part of 'transaction_purchase_invoice_bloc.dart';

@immutable
abstract class TransactionPurchaseInvoiceState {
  final List<MyListDetailsData> items;
  final List<InvoiceBodyModelPurchaseItem> selectedItems;

  const TransactionPurchaseInvoiceState({
    required this.selectedItems,
    required this.items,
  });
}

class TransactionPurchaseInvoiceInitial
    extends TransactionPurchaseInvoiceState {
  const TransactionPurchaseInvoiceInitial({
    required super.items,
    required super.selectedItems,
  });
}

class TransactionPurchaseInvoicePartySelected
    extends TransactionPurchaseInvoiceState {
  final PartiesListDatum? partyDetail;
  const TransactionPurchaseInvoicePartySelected({
    required super.items,
    required super.selectedItems,
    required this.partyDetail,
  });
}

class TransactionPurchaseInvoiceMainState
    extends TransactionPurchaseInvoiceState {
  const TransactionPurchaseInvoiceMainState({
    required super.items,
    required super.selectedItems,
  });
}

class TransactionPurchaseInvoiceErrorState
    extends TransactionPurchaseInvoiceState {
  const TransactionPurchaseInvoiceErrorState({
    required super.items,
    required super.selectedItems,
  });
}

class TransactionPurchaseInvoiceSuccessState
    extends TransactionPurchaseInvoiceState {
  CreatedInvoiceResponseModel createPurchaseResponseModel;
  TransactionPurchaseInvoiceSuccessState({
    required super.items,
    required super.selectedItems,
    required this.createPurchaseResponseModel,
  });
}

class TransactionPurchaseInvoiceLoadingState
    extends TransactionPurchaseInvoiceState {
  const TransactionPurchaseInvoiceLoadingState({
    required super.items,
    required super.selectedItems,
  });
}
