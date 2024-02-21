part of 'transaction_purchase_invoice_bloc.dart';

@immutable
abstract class TransactionPurchaseInvoiceEvent {}

class TransactionPurchaseInvoiceInitialEvent
    extends TransactionPurchaseInvoiceEvent {}

class TransactionPurchaseInvoiceSelectPartyEvent
    extends TransactionPurchaseInvoiceEvent {
  final PartiesListDatum? partyDetail;
  TransactionPurchaseInvoiceSelectPartyEvent({required this.partyDetail});
}

class TransactionPurchaseInvoiceCreateEvent
    extends TransactionPurchaseInvoiceEvent {
  final InvoiceBodyModel bodyModel;

  TransactionPurchaseInvoiceCreateEvent({required this.bodyModel});
}

class TransactionPurchaseInvoiceAddItemEvent
    extends TransactionPurchaseInvoiceEvent {
  final InvoiceBodyModelPurchaseItem item;

  TransactionPurchaseInvoiceAddItemEvent({required this.item});
}
 
