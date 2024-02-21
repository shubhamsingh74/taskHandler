import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:quickprism/domain/stocks/models/transfer_info_model/transfer_info_model.dart';

import '../../../domain/stocks/i_stock_repo.dart';

part 'business_stock_transfer_event.dart';
part 'business_stock_transfer_state.dart';

@injectable
class BusinessStockTransferBloc
    extends Bloc<BusinessStockTransferEvent, BusinessStockTransferState> {
  final IStockRepo iStockRepo;

  BusinessStockTransferBloc(this.iStockRepo)
      : super(BusinessStockTransferInitialState()) {
    on<BusinessStockTransferMainButtonClickEvent>((event, emit) async {
      log('stock transfer started');

      emit(BusinessStockTransferLoadingState(
        transferData: state.transferData,
      ));

      var response = await iStockRepo.stockTransfer(
          itemId: event.itemId,
          toShopId: event.toShopId,
          fromShopId: event.fromShopId,
          quantity: 10,
          date: event.date);

      emit(response.fold((l) {
        log('stock transfer failed');

        return BusinessStockTransferErrorState();
      }, (r) {
        log('stock transfer success');

        return BusinessStockTransferNavigateBackState();
      }));
    });

    on<BusinessStockTransferInitialEvent>((event, emit) async {
      log('stock transfer started');

      emit(BusinessStockTransferLoadingState());

      log('get transfer => ${event.itemId} : ${event.businessId}');

      var res = await iStockRepo.getTransferDetails(
        itemId: event.itemId,
        businessId: event.businessId,
      );

      emit(res.fold((l) {
        return BusinessStockTransferErrorState();
      }, (r) {
        return BusinessStockTransferSuccessState(transferData: r.data);
      }));
    });
  }
}
