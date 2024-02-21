part of 'business_my_list_info_bloc.dart';

@immutable
abstract class BusinessMyListInfoState {
  final bool? itemLoading;
  final bool? itemTimeLineLoading;
  final bool? itemStoresLoading;
  final MyListItemInfoData? itemInfoData;

  const BusinessMyListInfoState({
    this.itemLoading,
    this.itemTimeLineLoading,
    this.itemStoresLoading,
    this.itemInfoData,
  });
}

abstract class BusinessMyListInfoActionState extends BusinessMyListInfoState {}

class BusinessMyListInfoInitialState extends BusinessMyListInfoState {
  const BusinessMyListInfoInitialState({
    required super.itemLoading,
    required super.itemTimeLineLoading,
    required super.itemStoresLoading,
  });
}

class BusinessMyListInfoSuccessState extends BusinessMyListInfoState {
  final List<ItemTimeLineData> timeLines;
  final List<ItemShopData> shops;

  const BusinessMyListInfoSuccessState({
    required super.itemLoading,
    required super.itemTimeLineLoading,
    required super.itemStoresLoading,
    required super.itemInfoData,
    required this.timeLines,
    required this.shops,
  });
}

class BusinessMyListInfoErrorState extends BusinessMyListInfoState {
  const BusinessMyListInfoErrorState(
      {required super.itemLoading,
      required super.itemTimeLineLoading,
      required super.itemStoresLoading});
}

class BusinessMyListInfoLoadingState extends BusinessMyListInfoState {
  const BusinessMyListInfoLoadingState(
      {required super.itemLoading,
      required super.itemTimeLineLoading,
      required super.itemStoresLoading});
}

class BusinessMyListInfoTransferSnackBarState
    extends BusinessMyListInfoActionState {}

class BusinessMyListInfoActionConfirmState extends BusinessMyListInfoState {
  final List<ItemTimeLineData> timeLines;
  final List<ItemShopData> shops;
  final bool isDeleteActive;

  const BusinessMyListInfoActionConfirmState({
    required super.itemLoading,
    required super.itemTimeLineLoading,
    required super.itemStoresLoading,
    required super.itemInfoData,
    required this.timeLines,
    required this.shops,
    required this.isDeleteActive,
  });
}
