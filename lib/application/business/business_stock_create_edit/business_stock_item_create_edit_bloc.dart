import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:quickprism/domain/stocks/models/sub_category/sub_category_model.dart';

import '../../../domain/stocks/i_stock_repo.dart';

part 'business_stock_item_create_edit_event.dart';
part 'business_stock_item_create_edit_state.dart';

@injectable
class BusinessStockItemCreateEditBloc extends Bloc<
    BusinessStockItemCreateEditEvent, BusinessStockItemCreateEditState> {
  final IStockRepo _stockRepo;

  BusinessStockItemCreateEditBloc(this._stockRepo)
      : super(
            BusinessStockItemCreateEditInitialState(subCategories: const [])) {
    on<BusinessStockItemCreateEditInitialEvent>((event, emit) async {
      emit(BusinessStockItemCreateEditLoadingState(subCategories: const []));

      var categories =
          await _stockRepo.getSubCategories(categoryId: event.categoryId);

      emit(categories.fold((l) {
        return BusinessStockItemCreateEditErrorState(subCategories: const []);
      }, (r) {
        return BusinessStockItemCreateEditInitialState(subCategories: r.data!);
      }));
    });

    on<BusinessStockItemCreateEditCreateEvent>((event, emit) async {
      emit(BusinessStockItemCreateEditLoadingState(
          subCategories: state.subCategories));

      var stockDetails = await _stockRepo.createStock(
        subCategoryId: event.subCategoryId,
        categoryId: event.categoryId,
        businessId: event.businessId,
        brand: event.brand,
        itemName: event.itemName,
        unit: event.unit,
        hsn: event.hsn,
        skuCode: event.skuCode,
        gstPercentage: event.gstPercentage,
        salesPrice: event.salesPrice,
        shopId: event.shopId,
        purchasePrice: event.purchasePrice,
        availableStock: event.availableStock,
        lowAlertUnits: event.lowAlertUnits,
        lowAlertStatus: event.lowAlertStatus,
      );

      emit(stockDetails.fold((l) {
        return BusinessStockItemCreateEditErrorState(
            subCategories: state.subCategories);
      }, (r) {
        return BusinessStockItemCreateEditNavigateBackState(
            subCategories: state.subCategories);
      }));
    });
    on<BusinessStockItemCreateEditEditEvent>((event, emit) async {
      emit(BusinessStockItemCreateEditLoadingState(
          subCategories: state.subCategories));

      var stockDetails = await _stockRepo.editStock(
        itemId: event.itemId,
        subCategoryId: event.subCategoryId,
        categoryId: event.categoryId,
        businessId: event.businessId,
        brand: event.brand,
        itemName: event.itemName,
        unit: event.unit,
        hsn: event.hsn,
        skuCode: event.skuCode,
        gstPercentage: event.gstPercentage,
        salesPrice: event.salesPrice,
        shopId: event.shopId,
        purchasePrice: event.purchasePrice,
        availableStock: event.availableStock,
        lowAlertUnits: event.lowAlertUnits,
        lowAlertStatus: event.lowAlertStatus,
      );

      emit(stockDetails.fold((l) {
        return BusinessStockItemCreateEditErrorState(
            subCategories: state.subCategories);
      }, (r) {
        return BusinessStockItemCreateEditNavigateBackState(
            subCategories: state.subCategories);
      }));
    });
  }
}
