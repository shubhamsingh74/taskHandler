part of 'business_stock_item_create_edit_bloc.dart';

@immutable
abstract class BusinessStockItemCreateEditState {
  final List<SubCategoryData> subCategories;

  BusinessStockItemCreateEditState({required this.subCategories});
}

@immutable
abstract class BusinessStockItemCreateEditActionState
    extends BusinessStockItemCreateEditState {
  BusinessStockItemCreateEditActionState({required super.subCategories});
}

class BusinessStockItemCreateEditInitialState
    extends BusinessStockItemCreateEditState {
  BusinessStockItemCreateEditInitialState({required super.subCategories});
}

class BusinessStockItemCreateEditLoadingState
    extends BusinessStockItemCreateEditState {
  BusinessStockItemCreateEditLoadingState({required super.subCategories});
}

class BusinessStockItemCreateEditErrorState
    extends BusinessStockItemCreateEditState {
  BusinessStockItemCreateEditErrorState({required super.subCategories});
}

class BusinessStockItemCreateEditNavigateBackState
    extends BusinessStockItemCreateEditActionState {
  BusinessStockItemCreateEditNavigateBackState({required super.subCategories});
}
