part of 'business_stock_item_info_bloc.dart';

@immutable
abstract class BusinessStockItemInfoEvent {}

class BusinessStockItemInfoInitialEvent extends BusinessStockItemInfoEvent {
  final int itemId;

  BusinessStockItemInfoInitialEvent({required this.itemId});
}

class BusinessStockItemInfoEditItemClickEvent
    extends BusinessStockItemInfoEvent {
  final MyListItemInfoData? itemInfoModel;

  BusinessStockItemInfoEditItemClickEvent({this.itemInfoModel});
}
