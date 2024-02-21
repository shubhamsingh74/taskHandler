part of 'transaction_sales_invoice_bloc.dart';

@immutable
abstract class TransactionSalesInvoiceEvent {}

class TransactionSalesInvoiceInitialEvent
    extends TransactionSalesInvoiceEvent {}

class TransactionSalesInvoiceQuantityEnterEvent
    extends TransactionSalesInvoiceEvent {
      final int quantityEnteredByUser;

  TransactionSalesInvoiceQuantityEnterEvent({required this.quantityEnteredByUser});
    }

class TransactionSalesInvoiceSelectPartyEvent
    extends TransactionSalesInvoiceEvent {
  final PartiesListDatum? partyDetail;
  TransactionSalesInvoiceSelectPartyEvent({required this.partyDetail});
}

class TransactionSalesInvoiceCreateEvent extends TransactionSalesInvoiceEvent {
  final InvoiceBodyModel bodyModel;

  TransactionSalesInvoiceCreateEvent({required this.bodyModel});
}

class TransactionSalesInvoiceAddItemEvent extends TransactionSalesInvoiceEvent {
  final InvoiceBodyModelSaleItem item;

  TransactionSalesInvoiceAddItemEvent({required this.item});
}

class TransactionSalesInvoiceGetQuantityAndLotsOfItemEvent
    extends TransactionSalesInvoiceEvent {
  int itemId;
  String unit;
  TransactionSalesInvoiceGetQuantityAndLotsOfItemEvent({
    required this.itemId,
    required this.unit,
  });
}
