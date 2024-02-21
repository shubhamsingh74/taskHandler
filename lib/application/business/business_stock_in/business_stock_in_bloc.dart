import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:quickprism/domain/stocks/i_stock_repo.dart';
import 'package:quickprism/domain/stocks/models/suppliers/suppliers_model.dart';

import '../../../domain/user/i_user_repo.dart';

part 'business_stock_in_event.dart';
part 'business_stock_in_state.dart';

@injectable
class BusinessStockInBloc
    extends Bloc<BusinessStockInEvent, BusinessStockInState> {
  final IStockRepo _iStockRepo;
  final IUserRepo _iUserRepo;

  BusinessStockInBloc(this._iStockRepo, this._iUserRepo)
      : super(BusinessStockInInitialState()) {
    on<BusinessStockInInitialEvent>((event, emit) async {
      emit(BusinessStockInLoadingState());
      log('Stock in initial started');
      var suppliers = await _iUserRepo.getSuppliers();
      // log(suppliers.toString());

      emit(suppliers.fold((l) {
        return BusinessStockInErrorState();
      }, (r) {
        var current = r.data!.isNotEmpty ? r.data!.first : null;

        return BusinessStockInSuccessState(
            suppliers: r.data, currentSupplier: null);
      }));
    });
    on<BusinessStockInMainButtonClickEvent>((event, emit) async {
      emit(BusinessStockInLoadingState());

      var response = await _iStockRepo.stockIn(
          itemId: event.itemId,
          shopId: event.shopId,
          quantity: event.quantity,
          supplierId: event.supplierId,
          date: event.date,
          remarks: event.remarks,
          invoiceNumber: event.invoiceNumber,
          gstPercentage: event.gstPercentage,
          purchasePrice: event.purchasePrice,
          totalAmount: event.totalAmount,
          cashAmount: event.cashAmount,
          onlineAmount: event.onlineAmount,
          dueAmount: event.dueAmount);

      emit(response.fold((l) {
        return BusinessStockInErrorState();
      }, (r) {
        return BusinessStockInNavigateToInvoiceState();
      }));
    });

    on<BusinessStockInSupplierClickEvent>((event, emit) {
      emit(BusinessStockInNavigateToSuppliersState(suppliers: event.suppliers));
    });

    on<BusinessStockInAfterSupplierSelectionEvent>((event, emit) {
      emit(BusinessStockInSuccessState(
        suppliers: event.suppliers,
        currentSupplier: event.supplier,
      ));
    });
  }
}
