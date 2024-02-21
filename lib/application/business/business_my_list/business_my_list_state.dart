part of 'business_my_list_bloc.dart';

@immutable
abstract class BusinessMyListState {
  final List<MyListDetailsData> itemList;
  final bool isLoading;

  const BusinessMyListState({
    required this.itemList,
    required this.isLoading,
  });
}

class BusinessMyListInitialState extends BusinessMyListState {
  const BusinessMyListInitialState(
      {required super.itemList, required super.isLoading});
}

class BusinessMyListLoadingState extends BusinessMyListState {
  const BusinessMyListLoadingState(
      {required super.itemList, required super.isLoading});
}

class BusinessNoShopState extends BusinessMyListState {
  const BusinessNoShopState(
      {required super.itemList, required super.isLoading});
}

class BusinessMyListErrorState extends BusinessMyListState {
  const BusinessMyListErrorState(
      {required super.itemList, required super.isLoading});
}

class BusinessMyListSuccessState extends BusinessMyListState {
  const BusinessMyListSuccessState(
      {required super.itemList, required super.isLoading});
}
