// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'business_create_item_bloc.dart';

abstract class BusinessCreateItemEvent {}

class BusinessCreateItemGetItemCategoriesEvent
    extends BusinessCreateItemEvent {}

// new

class BusinessCreateNewItemInitialEvent extends BusinessCreateItemEvent {}

class BusinessCreateItemSaveItemDetailsEvent extends BusinessCreateItemEvent {
  int code;
  String category;
  int categoryId;
  String brand;
  int hsnSecCode;
  String name;
  BusinessCreateItemSaveItemDetailsEvent({
    required this.code,
    required this.category,
    required this.categoryId,
    required this.brand,
    required this.hsnSecCode,
    required this.name,
  });
}

class BusinessCreateItemEditUnitEvent extends BusinessCreateItemEvent {}

class BusinessCreateItemAddSellingAndDealingUnitEvent
    extends BusinessCreateItemEvent {
  List<String> sellingUnitList;
  List<String> purchasingUnitList;
  BusinessCreateItemAddSellingAndDealingUnitEvent({
    required this.sellingUnitList,
    required this.purchasingUnitList,
  });
}

class BusinessCreateItemAddConversionFactorsListEvent
    extends BusinessCreateItemEvent {
  List<double> purchasingQuantity;
  List<double> sellingQuantity;
  BusinessCreateItemAddConversionFactorsListEvent({
    required this.purchasingQuantity,
    required this.sellingQuantity,
  });
}

class BusinessCreateItemAddLotDataEvent extends BusinessCreateItemEvent {
  List lotData;
  BusinessCreateItemAddLotDataEvent({
    required this.lotData,
  });
}

// old

class BusinessCreateItemInitialEvent extends BusinessCreateItemEvent {
  String itemName;
  String itemCode;
  String categoryId;
  String hsnSacCode;
  String imageUrl;
  String lowStockQty;
  List<TextEditingController> quantityTextEditingControllerList;
  List<TextEditingController> dateTextEditingControllerList;
  List<TextEditingController> purchasePriceTextEditingControllerList;
  List<TextEditingController> mrpTextEditingControllerList;
  List<TextEditingController> unitTextEditingControllerList;
  BusinessCreateItemInitialEvent({
    required this.itemName,
    required this.itemCode,
    required this.categoryId,
    required this.hsnSacCode,
    required this.imageUrl,
    required this.lowStockQty,
    required this.quantityTextEditingControllerList,
    required this.dateTextEditingControllerList,
    required this.purchasePriceTextEditingControllerList,
    required this.mrpTextEditingControllerList,
    required this.unitTextEditingControllerList,
  });
}

class BusinessCreateItemUpdateInitialEvent extends BusinessCreateItemEvent {
  String itemName;
  String itemCode;
  String categoryId;
  String hsnSacCode;
  String imageUrl;
  String lowStockQty;
  String itemId;
  BusinessCreateItemUpdateInitialEvent({
    required this.itemName,
    required this.itemCode,
    required this.categoryId,
    required this.hsnSacCode,
    required this.imageUrl,
    required this.lowStockQty,
    required this.itemId,
  });
}
