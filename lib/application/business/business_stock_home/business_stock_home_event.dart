part of 'business_stock_home_bloc.dart';

@immutable
abstract class BusinessStockHomeEvent {}

class BusinessStockHomeInitialEvent extends BusinessStockHomeEvent {}

class BusinessStockHomeChangeShopEvent extends BusinessStockHomeEvent {}

class BusinessStockHomeChangeBusinessEvent extends BusinessStockHomeEvent {}

class BusinessStockHomeChangeCategoryEvent extends BusinessStockHomeEvent {
  final CategoryData categoryData;

  final int businessId;

  BusinessStockHomeChangeCategoryEvent({
    required this.categoryData,
    required this.businessId,
  });
}

class BusinessStockHomeSignOutEvent extends BusinessStockHomeEvent {}

class BusinessStockHomeStockTypeTileTapEvent extends BusinessStockHomeEvent {
  final StockTypeData stockTypeData;

  BusinessStockHomeStockTypeTileTapEvent(this.stockTypeData);
}
