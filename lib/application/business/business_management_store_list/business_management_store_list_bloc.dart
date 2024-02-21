import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:quickprism/domain/stocks/i_stock_repo.dart';
import 'package:quickprism/domain/stocks/models/shops_all_model/get_all_shops_model.dart';
import 'package:quickprism/domain/user/user_constants.dart';

part 'business_management_store_list_event.dart';
part 'business_management_store_list_state.dart';

@injectable
class BusinessManagementStoreListBloc extends Bloc<
    BusinessManagementStoreListEvent, BusinessManagementStoreListState> {
  final IStockRepo _stockRepo;

  BusinessManagementStoreListBloc(this._stockRepo)
      : super(const BusinessManagementStoreListInitialState(shops: [])) {
    on<BusinessManagementStoreListInitialEvent>((event, emit) async {
      emit(BusinessManagementStoreListLoadingState(shops: state.shops));

      var bID = UserConstants.currentBusiness?.businessProfile?.businessId;
      if (bID == null) {
        emit(BusinessManagementStoreListNoBusinessState(shops: state.shops));
      } else {
        var response = await _stockRepo.getAllShops(businessId: bID);

        emit(response.fold((l) {
          return BusinessManagementStoreListErrorState(shops: state.shops);
        }, (r) {
          return BusinessManagementStoreListMainState(shops: r.data ?? []);
        }));
      }
    });
  }
}
