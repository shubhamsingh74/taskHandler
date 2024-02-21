import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quickprism/core/utils/extensions.dart';
import 'package:quickprism/domain/stocks/i_stock_repo.dart';
import 'package:quickprism/domain/stocks/models/item_category/item_categories_model.dart';
import 'package:quickprism/domain/user/user_constants.dart';

import '../../../presentation/screens/business/create_item/widgets/add_lots_widget.dart';

part 'business_create_item_event.dart';
part 'business_create_item_state.dart';

@injectable
class BusinessCreateItemBloc
    extends Bloc<BusinessCreateItemEvent, BusinessCreateItemState> {
  final IStockRepo _iStockRepo;
  BusinessCreateItemBloc(this._iStockRepo)
      : super(BusinessCreateItemMainState(
          stepNo: 1,
          code: 0,
          brand: "",
          categoriesList: [],
          category: "",
          categoryId: 0,
          conversionUnitList: [],
          hsnSecCode: 0,
          levelOfAddUnits: 1,
          lotDetailsList: [],
          smallestUnit: "",
          name: "",
          purchasingUnits: [],
          sellingUnits: [],
          conversionFactorList: [],
        )) {
    on<BusinessCreateItemEvent>(
      (event, emit) {},
    );
    on<BusinessCreateNewItemInitialEvent>(_getItemCategoriesNew);
    on<BusinessCreateItemInitialEvent>(_createItem);
    on<BusinessCreateItemUpdateInitialEvent>(_updateItem);
    on<BusinessCreateItemGetItemCategoriesEvent>(_getItemCategories);
    on<BusinessCreateItemSaveItemDetailsEvent>(_saveItemDetails);
    on<BusinessCreateItemAddSellingAndDealingUnitEvent>(_saveSellingAndPurchasingUnit);
    on<BusinessCreateItemAddConversionFactorsListEvent>(_saveConversionFactor);
    on<BusinessCreateItemEditUnitEvent>(_editUnits);
    on<BusinessCreateItemAddLotDataEvent>(_saveLotsData);
  }

  Future<void> _saveLotsData(BusinessCreateItemAddLotDataEvent event,
      Emitter<BusinessCreateItemState> emit) async {
    emit(BusinessCreateItemMainState(
        stepNo: state.stepNo,
        code: state.code,
        category: state.category,
        categoryId: state.categoryId,
        brand: state.brand,
        hsnSecCode: state.hsnSecCode,
        name: state.name,
        levelOfAddUnits: state.levelOfAddUnits,
        sellingUnits: state.sellingUnits,
        smallestUnit: state.smallestUnit,
        purchasingUnits: state.purchasingUnits,
        conversionUnitList: state.conversionUnitList,
        lotDetailsList: event.lotData,
        categoriesList: state.categoriesList,
        conversionFactorList: state.conversionFactorList));
    // create item
    // emit(BusinessCreateItemLoadingState(
    //   stepNo: state.stepNo,
    //   code: state.code,
    //   category: state.category,
    //   categoryId: state.categoryId,
    //   brand: state.brand,
    //   hsnSecCode: state.hsnSecCode,
    //   name: state.name,
    //   levelOfAddUnits: state.levelOfAddUnits,
    //   sellingUnits: state.sellingUnits,
    //   purchasingUnits: state.purchasingUnits,
    //   smallestUnit: state.smallestUnit,
    //   conversionUnitList: state.conversionUnitList,
    //   lotDetailsList: state.lotDetailsList,
    //   categoriesList: state.categoriesList,
    //   conversionFactorList: state.conversionFactorList,
    // ));

    // ======================
    List<Map<String, dynamic>> openingStockData = [];
    for (var element in event.lotData as List<LotDetailsModel>) {
      openingStockData.add(element.toJson());
    }
    var itemDetails = {
      "item_name": state.name,
      "item_code": state.code,
      "category_id": state.categoryId,
      "brand": state.brand,
      "hsn_sac_code": state.hsnSecCode,
      "shop_id": UserConstants.currentShop!.shopId,
      "units": state.conversionUnitList,
      "purchasing_unit": state.purchasingUnits,
      "selling_units": state.sellingUnits,
      "unit_conversion_data": state.conversionFactorList,
      "opening_stock_data": openingStockData,
    };
    itemDetails.toString().log("create item data");
    // try {
    //   final res = await _iStockRepo.createItem(
    //     itemData: itemDetails,
    //   ); // list
    //   res.fold((l) {
    //     emit(BusinessCreateItemErrorState(
    //       stepNo: 1,
    //       code: state.code,
    //       category: state.category,
    //       categoryId: state.categoryId,
    //       brand: state.brand,
    //       hsnSecCode: state.hsnSecCode,
    //       name: state.name,
    //       levelOfAddUnits: state.levelOfAddUnits,
    //       sellingUnits: state.sellingUnits,
    //       purchasingUnits: state.purchasingUnits,
    //       smallestUnit: state.smallestUnit,
    //       conversionUnitList: state.conversionUnitList,
    //       lotDetailsList: state.lotDetailsList,
    //       categoriesList: state.categoriesList,
    //       conversionFactorList: state.conversionFactorList,
    //     ));
    //   }, (r) {
    //     emit(BusinessCreateItemSuccessState(
    //       stepNo: state.stepNo,
    //       code: state.code,
    //       category: state.category,
    //       categoryId: state.categoryId,
    //       brand: state.brand,
    //       hsnSecCode: state.hsnSecCode,
    //       name: state.name,
    //       levelOfAddUnits: state.levelOfAddUnits,
    //       sellingUnits: state.sellingUnits,
    //       purchasingUnits: state.purchasingUnits,
    //       smallestUnit: state.smallestUnit,
    //       conversionUnitList: state.conversionUnitList,
    //       lotDetailsList: state.lotDetailsList,
    //       categoriesList: state.categoriesList,
    //       conversionFactorList: state.conversionFactorList,
    //     ));
    //   });
    // } catch (e) {
    //   emit(BusinessCreateItemErrorState(
    //     stepNo: 1,
    //     code: state.code,
    //     category: state.category,
    //     categoryId: state.categoryId,
    //     brand: state.brand,
    //     hsnSecCode: state.hsnSecCode,
    //     name: state.name,
    //     levelOfAddUnits: state.levelOfAddUnits,
    //     sellingUnits: state.sellingUnits,
    //     purchasingUnits: state.purchasingUnits,
    //     smallestUnit: state.smallestUnit,
    //     conversionUnitList: state.conversionUnitList,
    //     lotDetailsList: state.lotDetailsList,
    //     categoriesList: state.categoriesList,
    //     conversionFactorList: state.conversionFactorList,
    //   ));
    // }
    // =======================
          emit(BusinessCreateItemSuccessState(
          stepNo: state.stepNo,
          code: state.code,
          category: state.category,
          categoryId: state.categoryId,
          brand: state.brand,
          hsnSecCode: state.hsnSecCode,
          name: state.name,
          levelOfAddUnits: state.levelOfAddUnits,
          sellingUnits: state.sellingUnits,
          purchasingUnits: state.purchasingUnits,
          smallestUnit: state.smallestUnit,
          conversionUnitList: state.conversionUnitList,
          lotDetailsList: state.lotDetailsList,
          categoriesList: state.categoriesList,
          conversionFactorList: state.conversionFactorList,
        ));
  }

  // BusinessCreateItemEditUnitEvent
  void _editUnits(BusinessCreateItemEditUnitEvent event,
      Emitter<BusinessCreateItemState> emit) {
    emit(BusinessCreateItemMainState(
      stepNo: state.stepNo,
      category: state.category,
      categoryId: state.categoryId,
      brand: state.brand,
      hsnSecCode: state.hsnSecCode,
      name: state.name,
      levelOfAddUnits: 1,
      sellingUnits: state.sellingUnits,
      smallestUnit: state.smallestUnit,
      purchasingUnits: state.purchasingUnits,
      conversionUnitList: state.conversionUnitList,
      lotDetailsList: state.lotDetailsList,
      categoriesList: state.categoriesList,
      code: state.code,
      conversionFactorList: state.conversionFactorList,
    ));
  }

  void _saveConversionFactor(
      BusinessCreateItemAddConversionFactorsListEvent event,
      Emitter<BusinessCreateItemState> emit) {
    List<Map<String, dynamic>> conversionFactorList = [];

    //
    for (var i = 0; i < event.sellingQuantity.length; i++) {
      /**
       mp ={
        "from_unit":"unit", 
        "to_unit" : "unit", 
        "factor" : 
       }
       */
      Map<String, dynamic> mp = {};
    }

    event.sellingQuantity.toString().log("selling quant");
    event.purchasingQuantity.toString().log("purchasing quant");
    emit(BusinessCreateItemMainState(
      stepNo: 3,
      category: state.category,
      categoryId: state.categoryId,
      brand: state.brand,
      hsnSecCode: state.hsnSecCode,
      name: state.name,
      levelOfAddUnits: state.levelOfAddUnits,
      sellingUnits: state.sellingUnits,
      smallestUnit: state.smallestUnit,
      purchasingUnits: state.purchasingUnits,
      conversionUnitList: state.conversionUnitList,
      lotDetailsList: state.lotDetailsList,
      categoriesList: state.categoriesList,
      code: state.code,
      conversionFactorList: conversionFactorList,
    ));
  }

  void _saveSellingAndPurchasingUnit(
      BusinessCreateItemAddSellingAndDealingUnitEvent event,
      Emitter<BusinessCreateItemState> emit) {
    void generateAllConversions(
        {required List<String> units,
        required List<double> conversionFactors}) {
      for (int i = 0; i < units.length; i++) {
        String fromUnit = units[i];
        Map<String, double> conversionMap = {};
        double cumulativeFactor = 1;
        for (int j = i + 1; j < units.length; j++) {
          Map<String, dynamic> conversionMap2 = {};
          String toUnit = units[j];
          cumulativeFactor *= conversionFactors[j - 1];
          conversionMap[toUnit] = cumulativeFactor;
          conversionMap2["unit_name"] = fromUnit;
          conversionMap2["to_unit_name"] = toUnit;
          conversionMap2["conversion_quantity"] = cumulativeFactor;
          // unitConversionData.add(conversionMap2);
        }
      }
    }

    // generateAllConversions(
    //     units: event.dealingUnits, conversionFactors: event.quantityList);

    emit(
      BusinessCreateItemMainState(
        stepNo: 2,
        code: state.code,
        category: state.category,
        categoryId: state.categoryId,
        brand: state.brand,
        hsnSecCode: state.hsnSecCode,
        name: state.name,
        levelOfAddUnits: 2,
        sellingUnits: [...event.sellingUnitList],
        purchasingUnits: [...event.purchasingUnitList],
        smallestUnit: state.smallestUnit,
        conversionUnitList: [
          ...event.purchasingUnitList,
          ...event.sellingUnitList
        ],
        // conversionUnitList: conversionUnitList,
        lotDetailsList: state.lotDetailsList,
        categoriesList: state.categoriesList,
        conversionFactorList: state.conversionFactorList,
      ),
    );
  }

  void _saveItemDetails(BusinessCreateItemSaveItemDetailsEvent event,
      Emitter<BusinessCreateItemState> emit) {
    emit(
      BusinessCreateItemMainState(
        stepNo: 2,
        code: event.code,
        category: event.category,
        categoryId: event.categoryId,
        brand: event.brand,
        hsnSecCode: event.hsnSecCode,
        name: event.name,
        levelOfAddUnits: state.levelOfAddUnits,
        sellingUnits: state.sellingUnits,
        purchasingUnits: state.purchasingUnits,
        smallestUnit: state.smallestUnit,
        conversionUnitList: state.conversionUnitList,
        lotDetailsList: state.lotDetailsList,
        categoriesList: state.categoriesList,
        conversionFactorList: [],
      ),
    );
  }

  Future<void> _getItemCategoriesNew(BusinessCreateNewItemInitialEvent event,
      Emitter<BusinessCreateItemState> emit) async {
    emit(BusinessCreateItemLoadingState(
      stepNo: state.stepNo,
      code: state.code,
      category: state.category,
      categoryId: state.categoryId,
      brand: state.brand,
      hsnSecCode: state.hsnSecCode,
      name: state.name,
      levelOfAddUnits: state.levelOfAddUnits,
      sellingUnits: state.sellingUnits,
      purchasingUnits: state.purchasingUnits,
      smallestUnit: "",
      conversionUnitList: state.conversionUnitList,
      lotDetailsList: state.lotDetailsList,
      categoriesList: state.categoriesList,
      conversionFactorList: [],
    ));
    await _iStockRepo.getItemCategories().then((response) {
      response.fold((l) {
        emit(BusinessCreateItemErrorState(
          stepNo: state.stepNo,
          code: state.code,
          category: state.category,
          categoryId: state.categoryId,
          brand: state.brand,
          hsnSecCode: state.hsnSecCode,
          name: state.name,
          levelOfAddUnits: state.levelOfAddUnits,
          sellingUnits: state.sellingUnits,
          purchasingUnits: state.purchasingUnits,
          smallestUnit: "",
          conversionUnitList: state.conversionUnitList,
          lotDetailsList: state.lotDetailsList,
          categoriesList: state.categoriesList,
          conversionFactorList: [],
        ));
      }, (r) {
        emit(BusinessCreateItemMainState(
          stepNo: state.stepNo,
          code: state.code,
          category: state.category,
          categoryId: state.categoryId,
          brand: state.brand,
          hsnSecCode: state.hsnSecCode,
          name: state.name,
          levelOfAddUnits: state.levelOfAddUnits,
          sellingUnits: state.sellingUnits,
          purchasingUnits: state.purchasingUnits,
          conversionUnitList: state.conversionUnitList,
          smallestUnit: state.smallestUnit,
          lotDetailsList: state.lotDetailsList,
          categoriesList: r.data ?? [],
          conversionFactorList: [],
        ));
      });
    }).onError((error, stackTrace) {});
  }

  Future<void> _createItem(BusinessCreateItemInitialEvent event,
      Emitter<BusinessCreateItemState> emit) async {
    // emit(BusinessCreateItemLoadingState());
    try {
      // =================
      // =====================
      // emit(BusinessCreateItemSuccessState(
      //   stepNo: null,
      //   brand: "",
      //   code: state.code,
      //   categoriesList: [],
      //   category: "",
      //   categoryId: 0,
      //   conversionUnitList: [],
      //   hsnSecCode: 0,
      //   levelOfAddUnits: 1,
      //   lotDetailsList: [],
      //   smallestUnit: "",
      //   name: "",
      //   purchasingUnits: [],
      //   sellingUnits: [],
      //   conversionFactorList: [],
      // ));
      // ======
      // final res = await _iStockRepo.createItem(
      //     itemName: event.itemName,
      //     itemCode: event.itemCode,
      //     // categoryId: "1",
      //     categoryId: event.categoryId,
      //     hsnSacCode: event.hsnSacCode,
      //     shopId: UserConstants.currentShop!.shopId.toString(),
      //     // shopId: "3",
      //     lowStockQty: event.lowStockQty,
      //     imageUrl: event.imageUrl,
      //     openingStockData: openingStockData); // list

      // res.fold((l) {
      //   emit(BusinessCreateItemErrorState(
      //     stepNo: null,
      //     code: state.code,
      //     brand: "",
      //     categoriesList: [],
      //     category: "",
      //     categoryId: 0,
      //     conversionUnitList: [],
      //     hsnSecCode: 0,
      //     smallestUnit: "",
      //     levelOfAddUnits: 1,
      //     lotDetailsList: [],
      //     name: "",
      //     purchasingUnits: [],
      //     sellingUnits: [],
      //     conversionFactorList: [],
      //   ));
      // }, (r) {
      //   // emit(BusinessCreateItemSuccessState(
      //   //   stepNo: null,
      //   //   code: state.code,
      //   //   brand: "",
      //   //   categoriesList: [],
      //   //   category: "",
      //   //   categoryId: 0,
      //   //   conversionUnitList: [],
      //   //   hsnSecCode: 0,
      //   //   smallestUnit: "",
      //   //   levelOfAddUnits: 1,
      //   //   lotDetailsList: [],
      //   //   name: "",
      //   //   purchasingUnits: [],
      //   //   sellingUnits: [],
      //   //   conversionFactorList: [],
      //   // ));
      // });
    } catch (e) {
      emit(BusinessCreateItemErrorState(
        stepNo: state.stepNo,
        code: state.code,
        brand: "",
        categoriesList: [],
        category: "",
        categoryId: 0,
        conversionUnitList: [],
        hsnSecCode: 0,
        levelOfAddUnits: 1,
        smallestUnit: "",
        lotDetailsList: [],
        name: "",
        purchasingUnits: [],
        sellingUnits: [],
        conversionFactorList: [],
      ));
    }
  }

  Future<void> _updateItem(BusinessCreateItemUpdateInitialEvent event,
      Emitter<BusinessCreateItemState> emit) async {
    emit(BusinessUpdateItemLoadingState(
      stepNo: state.stepNo,
      code: state.code,
      brand: "",
      categoriesList: [],
      category: "",
      categoryId: 0,
      conversionUnitList: [],
      hsnSecCode: 0,
      levelOfAddUnits: 1,
      lotDetailsList: [],
      name: "",
      smallestUnit: "",
      purchasingUnits: [],
      sellingUnits: [],
      conversionFactorList: [],
    ));
    try {
      final res = await _iStockRepo.updateItem(
        itemName: event.itemName,
        itemCode: event.itemCode,
        categoryId: event.categoryId,
        hsnSacCode: event.hsnSacCode,
        shopId: UserConstants.currentShop?.shopId.toString() ?? "null",
        lowStockQty: event.lowStockQty,
        imageUrl: event.imageUrl,
        itemId: event.itemId,
      );
      res.fold((l) {
        emit(BusinessUpdateItemErrorState(
          stepNo: state.stepNo,
          code: 0,
          brand: "",
          categoriesList: [],
          category: "",
          categoryId: 0,
          conversionUnitList: [],
          hsnSecCode: 0,
          levelOfAddUnits: 1,
          lotDetailsList: [],
          smallestUnit: "",
          name: "",
          purchasingUnits: [],
          sellingUnits: [],
          conversionFactorList: [],
        ));
      }, (r) {
        emit(BusinessUpdateItemSuccessState(
          stepNo: state.stepNo,
          code: 0,
          brand: "",
          categoriesList: [],
          category: "",
          categoryId: 0,
          conversionUnitList: [],
          hsnSecCode: 0,
          levelOfAddUnits: 1,
          lotDetailsList: [],
          name: "",
          smallestUnit: "",
          purchasingUnits: [],
          sellingUnits: [],
          conversionFactorList: [],
        ));
      });
    } catch (e) {
      emit(BusinessUpdateItemErrorState(
        stepNo: state.stepNo,
        code: 0,
        brand: "",
        categoriesList: [],
        category: "",
        categoryId: 0,
        conversionUnitList: [],
        hsnSecCode: 0,
        levelOfAddUnits: 1,
        smallestUnit: "",
        lotDetailsList: [],
        name: "",
        purchasingUnits: [],
        sellingUnits: [],
        conversionFactorList: [],
      ));
    }
  }

  Future<void> _getItemCategories(
      BusinessCreateItemGetItemCategoriesEvent event,
      Emitter<BusinessCreateItemState> emit) async {
    try {
      emit(BusinessCreateItemGetItemCategoriesLoadingState(
        stepNo: state.stepNo,
        code: 0,
        brand: "",
        categoriesList: [],
        category: "",
        categoryId: 0,
        conversionUnitList: [],
        hsnSecCode: 0,
        levelOfAddUnits: 1,
        lotDetailsList: [],
        smallestUnit: "",
        name: "",
        purchasingUnits: [],
        sellingUnits: [],
        conversionFactorList: [],
      ));
      final res = await _iStockRepo.getItemCategories();
      res.fold((l) {
        emit(BusinessCreateItemErrorState(
          stepNo: state.stepNo,
          code: 0,
          brand: "",
          categoriesList: [],
          category: "",
          categoryId: 0,
          conversionUnitList: [],
          hsnSecCode: 0,
          levelOfAddUnits: 1,
          smallestUnit: "",
          lotDetailsList: [],
          name: "",
          purchasingUnits: [],
          sellingUnits: [],
          conversionFactorList: [],
        ));
      }, (r) {
        emit(BusinessCreateItemGetItemCategoriesState(
          categoriesList: r.data ?? [],
          //
          stepNo: state.stepNo, code: 0,
          brand: "",
          category: "",
          categoryId: 0,
          conversionUnitList: [],
          hsnSecCode: 0,
          levelOfAddUnits: 1, smallestUnit: "",
          lotDetailsList: [],
          name: "",
          purchasingUnits: [],
          sellingUnits: [], conversionFactorList: [],
        ));
        //emit(BusinessCreateItemInitialState());
      });
    } catch (e) {
      emit(BusinessCreateItemErrorState(
        stepNo: state.stepNo,
        code: 0,
        brand: "",
        categoriesList: [],
        category: "",
        categoryId: 0,
        conversionUnitList: [],
        smallestUnit: "",
        hsnSecCode: 0,
        levelOfAddUnits: 1,
        lotDetailsList: [],
        name: "",
        purchasingUnits: [],
        sellingUnits: [],
        conversionFactorList: [],
      ));
    }
  }

//
}

/**
 BusinessCreateItemAddSellingAndPurchasingUnitEvent
 */
