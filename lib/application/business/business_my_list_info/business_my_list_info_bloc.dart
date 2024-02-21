import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:quickprism/domain/stocks/i_stock_repo.dart';
import 'package:quickprism/domain/stocks/models/item_info/stock_item_info_model.dart';
import 'package:quickprism/domain/stocks/models/item_shop/item_shop_model.dart';
import 'package:quickprism/domain/stocks/models/item_timeline/item_time_line_model.dart';

part 'business_my_list_info_event.dart';
part 'business_my_list_info_state.dart';

@injectable
class BusinessMyListInfoBloc
    extends Bloc<BusinessMyListInfoEvent, BusinessMyListInfoState> {
  final IStockRepo _stockRepo;

  BusinessMyListInfoBloc(this._stockRepo)
      : super(const BusinessMyListInfoInitialState(
          itemLoading: true,
          itemTimeLineLoading: true,
          itemStoresLoading: true,
        )) {
    on<BusinessMyListInfoInitialEvent>((event, emit) async {
      var response = await _stockRepo.getItemInfo(itemId: event.itemId);

      emit(response.fold((l) {
        return BusinessMyListInfoErrorState(
          itemLoading: false,
          itemTimeLineLoading: state.itemTimeLineLoading,
          itemStoresLoading: state.itemStoresLoading,
        );
      }, (r) {
        return BusinessMyListInfoSuccessState(
          itemLoading: false,
          itemTimeLineLoading: state.itemTimeLineLoading,
          itemStoresLoading: state.itemStoresLoading,
          itemInfoData: r.data!,
          timeLines: [],
          shops: [],
        );
      }));

      var timeLines = await _stockRepo.getItemTimeLine(itemId: event.itemId);
      var shopes = await _stockRepo.getItemStores(itemId: event.itemId);
      List<ItemTimeLineData> currentTimelines = [];
      List<ItemShopData> currentShopes = [];

      timeLines.fold((l) {
        return emit(BusinessMyListInfoErrorState(
          itemLoading: false,
          itemTimeLineLoading: state.itemTimeLineLoading,
          itemStoresLoading: state.itemStoresLoading,
        ));
      }, (r) {
        currentTimelines = r.data!;
      });

      emit(shopes.fold((l) {
        return BusinessMyListInfoErrorState(
          itemLoading: false,
          itemTimeLineLoading: state.itemTimeLineLoading,
          itemStoresLoading: state.itemStoresLoading,
        );
      }, (s) {
        return BusinessMyListInfoSuccessState(
          itemLoading: false,
          itemTimeLineLoading: false,
          itemStoresLoading: state.itemStoresLoading,
          itemInfoData: state.itemInfoData,
          timeLines: currentTimelines,
          shops: [s.itemShopData],
        );
      }));
    });
    on<BusinessMyListInfoTransferEvent>((event, emit) async {
      var response = await _stockRepo.stockTransfer(
          itemId: event.itemId,
          toShopId: event.toShopId,
          fromShopId: event.frmShopId,
          quantity: event.quantity,
          date: event.date);

      emit(response.fold((l) {
        return BusinessMyListInfoTransferSnackBarState();
      }, (r) {
        return BusinessMyListInfoTransferSnackBarState();
      }));
    });
    on<BusinessMyListInfoActionToggleEvent>((event, emit) {
      if (state is BusinessMyListInfoLoadingState) {
        emit(state);
      } else if (state is! BusinessMyListInfoActionState) {
        var isDelete = false;
        var isEdit = false;
        List<ItemTimeLineData> timeLines = [];
        List<ItemShopData> shops = [];

        if (state is BusinessMyListInfoSuccessState) {
          timeLines = (state as BusinessMyListInfoSuccessState).timeLines;
          shops = (state as BusinessMyListInfoSuccessState).shops;
          isDelete = true;
        } else if (state is BusinessMyListInfoActionConfirmState) {
          timeLines = (state as BusinessMyListInfoActionConfirmState).timeLines;
          shops = (state as BusinessMyListInfoActionConfirmState).shops;
          isDelete =
              !(state as BusinessMyListInfoActionConfirmState).isDeleteActive;
        }

        emit(BusinessMyListInfoActionConfirmState(
          itemLoading: state.itemLoading,
          itemTimeLineLoading: state.itemTimeLineLoading,
          itemStoresLoading: state.itemStoresLoading,
          itemInfoData: state.itemInfoData,
          timeLines: timeLines,
          shops: shops,
          isDeleteActive: isDelete,
        ));
      }
    });
  }
}
