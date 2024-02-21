part of 'business_stock_home_bloc.dart';

@immutable
abstract class BusinessStockHomeState {
  final List<CategoryData> subCategories;
  final List<StockTypeData> stockTypes;
  final List<BusinessProfile> businessDetails;

  const BusinessStockHomeState(
      {required this.businessDetails,
      required this.subCategories,
      required this.stockTypes});
}

@immutable
abstract class BusinessStockHomeActionState extends BusinessStockHomeState {
  const BusinessStockHomeActionState(
      {required super.businessDetails,
      required super.subCategories,
      required super.stockTypes});
}

class BusinessStockHomeInitialState extends BusinessStockHomeState {
  BusinessStockHomeInitialState(
      {required super.businessDetails,
      required super.subCategories,
      required super.stockTypes});
}

class BusinessStockHomeLoadingState extends BusinessStockHomeState {
  BusinessStockHomeLoadingState(
      {required super.businessDetails,
      required super.subCategories,
      required super.stockTypes});
}

class BusinessStockHomeStockLoadingState extends BusinessStockHomeState {
  BusinessStockHomeStockLoadingState(
      {required super.businessDetails,
      required super.subCategories,
      required super.stockTypes});
}

class BusinessStockHomeStockTypesLoadingState extends BusinessStockHomeState {
  BusinessStockHomeStockTypesLoadingState(
      {super.businessDetails = const [],
      super.subCategories = const [],
      super.stockTypes = const []});
}

class BusinessStockHomeStockSuccessState extends BusinessStockHomeState {
  BusinessStockHomeStockSuccessState(
      {required super.businessDetails,
      required super.subCategories,
      required super.stockTypes});
}

class BusinessStockHomeStockTypeLoading
    extends BusinessStockHomeStockSuccessState {
  BusinessStockHomeStockTypeLoading(
      {required super.businessDetails,
      required super.subCategories,
      required super.stockTypes});
}

class BusinessStockHomeErrorState extends BusinessStockHomeState {
  BusinessStockHomeErrorState(
      {super.businessDetails = const [],
      super.subCategories = const [],
      super.stockTypes = const []});
}

class BusinessStockHomeStockTypesErrorState extends BusinessStockHomeState {
  BusinessStockHomeStockTypesErrorState(
      {super.businessDetails = const [],
      super.subCategories = const [],
      super.stockTypes = const []});
}

class BusinessStockHomeSignOutState extends BusinessStockHomeActionState {
  BusinessStockHomeSignOutState(
      {super.businessDetails = const [],
      super.subCategories = const [],
      super.stockTypes = const []});
}

class BusinessStockHomeNavigateToItemListState
    extends BusinessStockHomeActionState {
  final StockTypeData stockTypeData;
  const BusinessStockHomeNavigateToItemListState(this.stockTypeData,
      {super.businessDetails = const [],
      super.subCategories = const [],
      super.stockTypes = const []});
}
