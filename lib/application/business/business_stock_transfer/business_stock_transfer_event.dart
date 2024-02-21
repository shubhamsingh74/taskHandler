part of 'business_stock_transfer_bloc.dart';

@immutable
abstract class BusinessStockTransferEvent {}

class BusinessStockTransferInitialEvent extends BusinessStockTransferEvent {
  final int itemId;
  final int businessId;

  BusinessStockTransferInitialEvent(
      {required this.itemId, required this.businessId});
}

class BusinessStockTransferMainButtonClickEvent
    extends BusinessStockTransferEvent {
  final int itemId;
  final int toShopId;
  final int fromShopId;
  final int quantity;
  final String date;

  BusinessStockTransferMainButtonClickEvent(
      {required this.itemId,
      required this.toShopId,
      required this.fromShopId,
      required this.quantity,
      required this.date});
}
