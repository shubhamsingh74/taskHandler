import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:quickprism/domain/stocks/i_stock_repo.dart';
import 'package:quickprism/domain/stocks/models/customers/customers_model.dart';
import 'package:quickprism/domain/user/i_user_repo.dart';

part 'business_stock_out_event.dart';
part 'business_stock_out_state.dart';

@injectable
class BusinessStockOutBloc
    extends Bloc<BusinessStockOutEvent, BusinessStockOutState> {
  final IStockRepo _iStockRepo;
  final IUserRepo _iUserRepo;

  BusinessStockOutBloc(this._iStockRepo, this._iUserRepo)
      : super(BusinessStockOutInitialState()) {
    on<BusinessStockOutInitialEvent>((event, emit) async {
      emit(BusinessStockOutLoadingState());

      var resp = await _iUserRepo.getCustomers();

      emit(resp.fold((l) {
        return BusinessStockOutErrorState();
      }, (r) {
        var current = r.data!.isNotEmpty ? r.data!.first : null;

        return BusinessStockOutSuccessState(
            customers: r.data, currentCustomer: current);
      }));
    });
    on<BusinessStockOutMainButtonClickEvent>((event, emit) async {
      emit(BusinessStockOutLoadingState());

      var response = await _iStockRepo.stockOut(
        itemId: event.itemId,
        shopId: event.shopId,
        quantity: event.quantity,
        customerId: event.customerId,
        date: event.date,
        remarks: event.remarks,
        invoiceNumber: event.invoiceNumber,
        gstPercentage: event.gstPercentage,
        salesPrice: event.salesPrice,
        // salesPrice: event.purchasePrice,
        totalAmount: event.totalAmount,
        cashAmount: event.cashAmount,
        onlineAmount: event.onlineAmount,
        dueAmount: event.dueAmount,
      );

      emit(response.fold((l) {
        log('response stockout failed');
        return BusinessStockOutErrorState();
      }, (r) {
        log('response stockout success');

        return BusinessStockOutNavigateToInvoiceState();
      }));
    });

    on<BusinessStockOutCustomerClickEvent>((event, emit) {
      emit(
          BusinessStockOutNavigateToCustomersState(customers: event.customers));
    });

    on<BusinessStockOutAfterCustomerSelectionEvent>((event, emit) {
      emit(BusinessStockOutSuccessState(
        customers: event.customers,
        currentCustomer: event.customer,
      ));
    });
  }
}
