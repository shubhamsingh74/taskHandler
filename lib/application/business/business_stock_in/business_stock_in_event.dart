part of 'business_stock_in_bloc.dart';

@immutable
abstract class BusinessStockInEvent {}

class BusinessStockInInitialEvent extends BusinessStockInEvent {}

class BusinessStockInMainButtonClickEvent extends BusinessStockInEvent {
  final int itemId;
  final int shopId;
  final int quantity;
  final int supplierId;
  final String date;
  final String remarks;
  final int invoiceNumber;
  final double gstPercentage;
  final double purchasePrice;
  final double totalAmount;
  final double cashAmount;
  final double onlineAmount;
  final int dueAmount;

  BusinessStockInMainButtonClickEvent(
      {required this.itemId,
      required this.shopId,
      required this.quantity,
      required this.supplierId,
      required this.date,
      required this.remarks,
      required this.invoiceNumber,
      required this.gstPercentage,
      required this.purchasePrice,
      required this.totalAmount,
      required this.cashAmount,
      required this.onlineAmount,
      required this.dueAmount});
}

class BusinessStockInSupplierClickEvent extends BusinessStockInEvent {
  final List<SuppliersDatum>? suppliers;

  BusinessStockInSupplierClickEvent({required this.suppliers});
}

class BusinessStockInAfterSupplierSelectionEvent extends BusinessStockInEvent {
  final SuppliersDatum? supplier;
  final List<SuppliersDatum>? suppliers;

  BusinessStockInAfterSupplierSelectionEvent({this.suppliers, this.supplier});
}
