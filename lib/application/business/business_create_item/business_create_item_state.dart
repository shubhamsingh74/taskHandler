// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'business_create_item_bloc.dart';

abstract class BusinessCreateItemState {
  int stepNo;
  int code;
  String category;
  int categoryId;
  String brand;
  int hsnSecCode;
  String name;
  // units
  int levelOfAddUnits; // means user is on purchasing and selling unit or user is defining units relation
  List<String> sellingUnits;
  List<String> purchasingUnits;
  String smallestUnit;
  List<String> conversionUnitList;
  List<Map<String, dynamic>> conversionFactorList;
  // lots
  List lotDetailsList;
  List<CategoriesInfoDatum> categoriesList;

  BusinessCreateItemState({
    required this.stepNo,
    required this.code,
    required this.category,
    required this.categoryId,
    required this.brand,
    required this.hsnSecCode,
    required this.name,
    required this.levelOfAddUnits,
    required this.sellingUnits,
    required this.purchasingUnits,
    required this.smallestUnit,
    required this.conversionUnitList,
    required this.conversionFactorList,
    required this.lotDetailsList,
    required this.categoriesList,
  });
}

//
class BusinessCreateItemMainState extends BusinessCreateItemState {
  BusinessCreateItemMainState(
      {required super.stepNo,
      required super.category,
      required super.categoryId,
      required super.brand,
      required super.hsnSecCode,
      required super.name,
      required super.levelOfAddUnits,
      required super.sellingUnits,
      required super.purchasingUnits,
      required super.conversionUnitList,
      required super.lotDetailsList,
      required super.categoriesList,
      required super.code,
      required super.conversionFactorList,
      required super.smallestUnit});
}

class BusinessCreateItemGetItemCategoriesState extends BusinessCreateItemState {
  BusinessCreateItemGetItemCategoriesState({
    required super.stepNo,
    required super.category,
    required super.categoryId,
    required super.brand,
    required super.hsnSecCode,
    required super.name,
    required super.levelOfAddUnits,
    required super.sellingUnits,
    required super.purchasingUnits,
    required super.conversionUnitList,
    required super.lotDetailsList,
    required super.categoriesList,
    required super.code,
    required super.conversionFactorList,
    required super.smallestUnit,
  });
}

class BusinessCreateItemGetItemCategoriesLoadingState
    extends BusinessCreateItemState {
  BusinessCreateItemGetItemCategoriesLoadingState(
      {required super.stepNo,
      required super.category,
      required super.categoryId,
      required super.brand,
      required super.hsnSecCode,
      required super.name,
      required super.levelOfAddUnits,
      required super.sellingUnits,
      required super.purchasingUnits,
      required super.conversionUnitList,
      required super.lotDetailsList,
      required super.categoriesList,
      required super.code,
      required super.conversionFactorList,
      required super.smallestUnit});
}

class BusinessCreateItemSuccessState extends BusinessCreateItemState {
  BusinessCreateItemSuccessState(
      {required super.stepNo,
      required super.category,
      required super.categoryId,
      required super.brand,
      required super.hsnSecCode,
      required super.name,
      required super.levelOfAddUnits,
      required super.sellingUnits,
      required super.purchasingUnits,
      required super.conversionUnitList,
      required super.lotDetailsList,
      required super.categoriesList,
      required super.code,
      required super.conversionFactorList,
      required super.smallestUnit});
}

class BusinessCreateItemLoadingState extends BusinessCreateItemState {
  BusinessCreateItemLoadingState(
      {required super.stepNo,
      required super.category,
      required super.categoryId,
      required super.brand,
      required super.hsnSecCode,
      required super.name,
      required super.levelOfAddUnits,
      required super.sellingUnits,
      required super.purchasingUnits,
      required super.conversionUnitList,
      required super.lotDetailsList,
      required super.categoriesList,
      required super.code,
      required super.conversionFactorList,
      required super.smallestUnit});
}

class BusinessCreateItemErrorState extends BusinessCreateItemState {
  BusinessCreateItemErrorState(
      {required super.stepNo,
      required super.category,
      required super.categoryId,
      required super.brand,
      required super.hsnSecCode,
      required super.name,
      required super.levelOfAddUnits,
      required super.sellingUnits,
      required super.purchasingUnits,
      required super.conversionUnitList,
      required super.lotDetailsList,
      required super.categoriesList,
      required super.code,
      required super.conversionFactorList,
      required super.smallestUnit});
}

// update item
class BusinessUpdateItemLoadingState extends BusinessCreateItemState {
  BusinessUpdateItemLoadingState(
      {required super.stepNo,
      required super.category,
      required super.categoryId,
      required super.brand,
      required super.hsnSecCode,
      required super.name,
      required super.levelOfAddUnits,
      required super.sellingUnits,
      required super.purchasingUnits,
      required super.conversionUnitList,
      required super.lotDetailsList,
      required super.categoriesList,
      required super.code,
      required super.conversionFactorList,
      required super.smallestUnit});
}

class BusinessUpdateItemSuccessState extends BusinessCreateItemState {
  BusinessUpdateItemSuccessState(
      {required super.stepNo,
      required super.category,
      required super.categoryId,
      required super.brand,
      required super.hsnSecCode,
      required super.name,
      required super.levelOfAddUnits,
      required super.sellingUnits,
      required super.purchasingUnits,
      required super.conversionUnitList,
      required super.lotDetailsList,
      required super.categoriesList,
      required super.code,
      required super.conversionFactorList,
      required super.smallestUnit});
}

class BusinessUpdateItemErrorState extends BusinessCreateItemState {
  BusinessUpdateItemErrorState(
      {required super.stepNo,
      required super.category,
      required super.categoryId,
      required super.brand,
      required super.hsnSecCode,
      required super.name,
      required super.levelOfAddUnits,
      required super.sellingUnits,
      required super.purchasingUnits,
      required super.conversionUnitList,
      required super.lotDetailsList,
      required super.categoriesList,
      required super.code,
      required super.conversionFactorList,
      required super.smallestUnit});
}
