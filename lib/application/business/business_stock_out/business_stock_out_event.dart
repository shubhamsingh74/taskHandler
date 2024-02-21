part of 'business_stock_out_bloc.dart';

@immutable
abstract class BusinessStockOutEvent {}

class BusinessStockOutInitialEvent extends BusinessStockOutEvent {}

class BusinessStockOutMainButtonClickEvent extends BusinessStockOutEvent {
  final int itemId;
  final int shopId;
  final int quantity;
  final int customerId;
  final String date;
  final String remarks;
  final int invoiceNumber;
  final double gstPercentage;
  final double salesPrice;

  final double totalAmount;
  final double cashAmount;
  final double onlineAmount;
  final int dueAmount;

  BusinessStockOutMainButtonClickEvent(
      {required this.itemId,
      required this.shopId,
      required this.quantity,
      required this.customerId,
      required this.date,
      required this.remarks,
      required this.invoiceNumber,
      required this.gstPercentage,
      required this.salesPrice,
      required this.totalAmount,
      required this.cashAmount,
      required this.onlineAmount,
      required this.dueAmount});
}

class BusinessStockOutCustomerClickEvent extends BusinessStockOutEvent {
  final List<CustomersDatum>? customers;

  BusinessStockOutCustomerClickEvent({required this.customers});
}

class BusinessStockOutAfterCustomerSelectionEvent
    extends BusinessStockOutEvent {
  final CustomersDatum? customer;
  final List<CustomersDatum>? customers;

  BusinessStockOutAfterCustomerSelectionEvent({this.customers, this.customer});
}
