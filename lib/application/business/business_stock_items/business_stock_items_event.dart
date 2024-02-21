part of 'business_stock_items_bloc.dart';

@immutable
abstract class BusinessStockItemsEvent {}

class BusinessStockItemsInitialEvent extends BusinessStockItemsEvent {
  final int subCategoryId;
  final int businessId;
  final int shopId;

  BusinessStockItemsInitialEvent({
    required this.subCategoryId,
    required this.businessId,
    required this.shopId,
  });
}

class BusinessStockItemsTileClick extends BusinessStockItemsEvent {
  final StockItemsData itemsData;

  BusinessStockItemsTileClick(this.itemsData);
}

// class BusinessStockItemsChangeCategory extends BusinessStockItemsEvent {
//   final CategoryData categoryData;
//
//   BusinessStockItemsChangeCategory({required this.categoryData});
// }

class BusinessStockItemsSearch extends BusinessStockItemsEvent {
  final String searchText;

  BusinessStockItemsSearch(this.searchText);
}

class BusinessStockItemsAddItemClickEvent extends BusinessStockItemsEvent {
  final MyListItemInfoData? itemInfoModel;

  BusinessStockItemsAddItemClickEvent({this.itemInfoModel});
}

class BusinessStockItemMiniTileClick extends BusinessStockItemsEvent {
  final MiniTileType tileType;
  final StockItemsData stockItemsData;

  BusinessStockItemMiniTileClick({
    required this.tileType,
    required this.stockItemsData,
  });
}
