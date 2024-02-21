part of 'business_management_store_list_bloc.dart';

@immutable
abstract class BusinessManagementStoreListState {
  final List<GetAllShopsData> shops;

  const BusinessManagementStoreListState({required this.shops});
}

class BusinessManagementStoreListInitialState
    extends BusinessManagementStoreListState {
  const BusinessManagementStoreListInitialState({required super.shops});
}

class BusinessManagementStoreListMainState
    extends BusinessManagementStoreListState {
  const BusinessManagementStoreListMainState({required super.shops});
}

class BusinessManagementStoreListLoadingState
    extends BusinessManagementStoreListState {
  const BusinessManagementStoreListLoadingState({required super.shops});
}

class BusinessManagementStoreListNoBusinessState
    extends BusinessManagementStoreListState {
  const BusinessManagementStoreListNoBusinessState({required super.shops});
}

class BusinessManagementStoreListErrorState
    extends BusinessManagementStoreListState {
  const BusinessManagementStoreListErrorState({required super.shops});
}
