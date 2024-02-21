part of 'business_stock_item_info_bloc.dart';

@immutable
abstract class BusinessStockItemInfoState {
  final MyListItemInfoData? itemInfoModel;

  BusinessStockItemInfoState({this.itemInfoModel});
}

@immutable
abstract class BusinessStockItemInfoActionState
    extends BusinessStockItemInfoState {
  BusinessStockItemInfoActionState({required super.itemInfoModel});
}

class BusinessStockItemInfoInitialState extends BusinessStockItemInfoState {}

class BusinessStockItemInfoLoadingState extends BusinessStockItemInfoState {}

class BusinessStockItemInfoErrorState extends BusinessStockItemInfoState {}

class BusinessStockItemInfoSuccessState extends BusinessStockItemInfoState {
  BusinessStockItemInfoSuccessState({required super.itemInfoModel});
}

class BusinessStockItemInfoNavigateToEditItem
    extends BusinessStockItemInfoActionState {
  BusinessStockItemInfoNavigateToEditItem({required super.itemInfoModel});
}
