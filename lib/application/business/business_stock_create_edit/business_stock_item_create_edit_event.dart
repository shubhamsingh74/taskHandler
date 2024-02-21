part of 'business_stock_item_create_edit_bloc.dart';

@immutable
abstract class BusinessStockItemCreateEditEvent {}

class BusinessStockItemCreateEditInitialEvent
    extends BusinessStockItemCreateEditEvent {
  final int categoryId;

  BusinessStockItemCreateEditInitialEvent({required this.categoryId});
}

class BusinessStockItemCreateEditCreateEvent
    extends BusinessStockItemCreateEditEvent {
  BusinessStockItemCreateEditCreateEvent({
    required this.subCategoryId,
    required this.categoryId,
    required this.businessId,
    required this.brand,
    required this.itemName,
    required this.unit,
    required this.hsn,
    required this.skuCode,
    required this.gstPercentage,
    required this.salesPrice,
    required this.purchasePrice,
    required this.shopId,
    required this.availableStock,
    required this.lowAlertUnits,
    required this.lowAlertStatus,
  });
  final int subCategoryId;
  final int categoryId;
  final int businessId;
  final String brand;
  final String itemName;
  final String unit;
  final String hsn;
  final int skuCode;
  final int gstPercentage;
  final double salesPrice;
  final double purchasePrice;
  final int shopId;
  final int availableStock;
  final int lowAlertUnits;
  final bool lowAlertStatus;
}

class BusinessStockItemCreateEditEditEvent
    extends BusinessStockItemCreateEditEvent {
  BusinessStockItemCreateEditEditEvent({
    required this.subCategoryId,
    required this.categoryId,
    required this.businessId,
    required this.itemId,
    required this.brand,
    required this.itemName,
    required this.unit,
    required this.hsn,
    required this.skuCode,
    required this.gstPercentage,
    required this.salesPrice,
    required this.purchasePrice,
    required this.shopId,
    required this.availableStock,
    required this.lowAlertUnits,
    required this.lowAlertStatus,
  });
  final int itemId;
  final int subCategoryId;
  final int categoryId;
  final int businessId;
  final String brand;
  final String itemName;
  final String unit;
  final String hsn;
  final int skuCode;
  final int gstPercentage;
  final double salesPrice;
  final double purchasePrice;
  final int shopId;
  final int availableStock;
  final int lowAlertUnits;
  final bool lowAlertStatus;
}
