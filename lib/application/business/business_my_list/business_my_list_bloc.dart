import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:quickprism/core/utils/extensions.dart';
import 'package:quickprism/domain/stocks/i_stock_repo.dart';
import 'package:quickprism/domain/stocks/models/mylist_details/mylist_details_model.dart';
import 'package:quickprism/domain/user/user_constants.dart';

part 'business_my_list_event.dart';
part 'business_my_list_state.dart';

@injectable
class BusinessMyListBloc
    extends Bloc<BusinessMyListEvent, BusinessMyListState> {
  final IStockRepo _stockRepo;

  BusinessMyListBloc(this._stockRepo)
      : super(const BusinessMyListInitialState(itemList: [], isLoading: true)) {
    on<BusinessMyListInitialEvent>((event, emit) async {
      emit(const BusinessMyListLoadingState(itemList: [], isLoading: false));

      var resp = await _stockRepo.getMyLists(shopId: event.shopId);
     
      emit(resp.fold((l) {
        return const BusinessMyListErrorState(itemList: [], isLoading: false);
      }, (r) {
        return BusinessMyListSuccessState(itemList: r.data!, isLoading: false);
      }));
    });
    on<BusinessMyListNoShopEvent>((event, emit) async {
      emit(const BusinessNoShopState(itemList: [], isLoading: false));
    });
  }
}
