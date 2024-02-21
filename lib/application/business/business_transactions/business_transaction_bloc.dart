import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:quickprism/domain/invoice/i_invoice_repo.dart';
import 'package:quickprism/domain/invoice/models/transactions/transactions_model.dart';
import 'package:quickprism/domain/invoice/models/transactions_purchases/transactions_purchase_model.dart';
import 'package:quickprism/domain/invoice/models/transactions_sales/transactions_sales_model.dart';

part 'business_transaction_event.dart';
part 'business_transaction_state.dart';

@injectable
class BusinessTransactionBloc
    extends Bloc<BusinessTransactionEvent, BusinessTransactionState> {
  final IInvoiceRepo _invoiceRepo;

  BusinessTransactionBloc(this._invoiceRepo)
      : super(BusinessTransactionInitialState(
          isSalesLoading: true,
          isPurchaseLoading: true,
          isReturnsLoading: true,
          isExpanseLoading: true,
          mainData: TransactionsData(
              monthlyPurchases: 0.0,
              monthlySales: 0.0,
              todaysIn: 0.0,
              todaysOut: 0.0),
          sales: const [],
          purchases: const [],
        )) {
    on<BusinessTransactionNoStoreEvent>((event, emit) {
      emit(BusinessTransactionNoBusinessState());
    });
    on<BusinessTransactionInitialEvent>((event, emit) async {
      emit(BusinessTransactionLoadingState());
      var resp =
          await _invoiceRepo.getTransactionPageData(shopId: event.shopId);
 
      resp.fold((l) {
        emit(BusinessTransactionErrorState());
      }, (r) {
        emit(BusinessTransactionMainState(
          isSalesLoading: true,
          isPurchaseLoading: true,
          isReturnsLoading: true,
          isExpanseLoading: true,
          mainData: r.data!,
          sales: const [],
          purchases: const [],
        ));
      });

      /////--------------

      var respSales =
          await _invoiceRepo.getTransactionSales(shopId: event.shopId);
      emit(respSales.fold((l) {
        return state;
      }, (r) {
        return BusinessTransactionMainState(
          isSalesLoading: false,
          isPurchaseLoading: true,
          isReturnsLoading: true,
          isExpanseLoading: true,
          mainData: state.mainData, 
          sales: r.data !=null ? r.data!.reversed.toList()  : r.data,
          purchases: state.purchases,
        );
      }));

      /////--------------

      var respPurchase =
          await _invoiceRepo.getTransactionPurchase(shopId: event.shopId);
      emit(respPurchase.fold((l) {
        return state;
      }, (r) {
        return BusinessTransactionMainState(
          isSalesLoading: false,
          isPurchaseLoading: false,
          isReturnsLoading: true,
          isExpanseLoading: true,
          mainData: state.mainData,
          sales: state.sales,
          purchases: r.data !=null ? r.data!.reversed.toList()  : r.data,
        );
      }));
    });
  }
}
