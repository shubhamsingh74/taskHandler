import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:quickprism/domain/stocks/i_stock_repo.dart';
import 'package:quickprism/domain/stocks/models/business_management/business_management_req_model.dart';

part 'business_management_event.dart';
part 'business_management_state.dart';

@injectable
class BusinessManagementBloc
    extends Bloc<BusinessManagementEvent, BusinessManagementState> {
  final IStockRepo _stockRepo;

  BusinessManagementBloc(this._stockRepo)
      : super(BusinessManagementInitialState()) {
    on<BusinessManagementSaveEvent>((event, emit) async {
      emit(BusinessManagementLoadingState());

      var response = await _stockRepo.addShop(
        businessId: event.reqModel.businessId,
        shopName: event.reqModel.shopName,
        shopColor: event.reqModel.shopColor,
        isWareHouse: event.reqModel.isWareHouse,
        gstIN: event.reqModel.gstIN,
        state: event.reqModel.state,
        city: event.reqModel.city,
        street: event.reqModel.street,
        pin: event.reqModel.pin,
      );
      emit(response.fold((l) {
        return BusinessManagementErrorSnackBarState();
      }, (r) {
        return BusinessManagementNavigateBackState();
      }));
    });
    on<BusinessManagementUpdateEvent>((event, emit) async {
      emit(BusinessManagementLoadingState());

      var response = await _stockRepo.updateShop(
        businessId: event.reqModel.businessId,
        shopName: event.reqModel.shopName,
        shopColor: event.reqModel.shopColor,
        isWareHouse: event.reqModel.isWareHouse,
        gstIN: event.reqModel.gstIN,
        state: event.reqModel.state,
        city: event.reqModel.city,
        street: event.reqModel.street,
        pin: event.reqModel.pin,
        storeId: event.reqModel.storeId!,
      );

      emit(response.fold((l) {
        return BusinessManagementErrorSnackBarState();
      }, (r) {
        return BusinessManagementNavigateBackState();
      }));
    });
  }
}
