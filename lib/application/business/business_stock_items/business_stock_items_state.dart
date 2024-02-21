part of 'business_stock_items_bloc.dart';

@immutable
abstract class BusinessStockItemsState {
  final List<StockItemsData> stockItems;

  BusinessStockItemsState({required this.stockItems});
}

@immutable
abstract class BusinessStockItemsActionState extends BusinessStockItemsState {
  BusinessStockItemsActionState({super.stockItems = const []});
}

class BusinessStockItemsInitialState extends BusinessStockItemsState {
  BusinessStockItemsInitialState({super.stockItems = const []});
}

class BusinessStockItemsLoadingState extends BusinessStockItemsState {
  BusinessStockItemsLoadingState({super.stockItems = const []});
}

class BusinessStockItemsErrorState extends BusinessStockItemsState {
  BusinessStockItemsErrorState({super.stockItems = const []});
}

class BusinessStockItemsSuccessState extends BusinessStockItemsState {
  BusinessStockItemsSuccessState({required super.stockItems});
}

class BusinessStockItemsNavigateToItemState
    extends BusinessStockItemsActionState {
  final StockItemsData itemsData;

  BusinessStockItemsNavigateToItemState(this.itemsData);
}

class BusinessStockItemsNavigateToAddItemState
    extends BusinessStockItemsActionState {}

class BusinessStockItemsNavigateToStockInState
    extends BusinessStockItemsActionState {
  final StockItemsData stockItemsData;

  BusinessStockItemsNavigateToStockInState(
      {super.stockItems, required this.stockItemsData});
}

class BusinessStockItemsNavigateToStockOutState
    extends BusinessStockItemsActionState {
  final StockItemsData stockItemsData;

  BusinessStockItemsNavigateToStockOutState(
      {super.stockItems, required this.stockItemsData});
}

class BusinessStockItemsNavigateToStockTransferState
    extends BusinessStockItemsActionState {
  final StockItemsData stockItemsData;

  BusinessStockItemsNavigateToStockTransferState(
      {super.stockItems, required this.stockItemsData});
}
