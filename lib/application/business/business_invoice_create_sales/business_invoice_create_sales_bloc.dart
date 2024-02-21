import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:quickprism/domain/invoice/create_sales_body/create_sales_body_model.dart';
import 'package:quickprism/domain/invoice/i_invoice_repo.dart';
import 'package:quickprism/domain/stocks/models/customers/customers_model.dart';
import 'package:quickprism/domain/user/i_user_repo.dart';

part 'business_invoice_create_sales_event.dart';
part 'business_invoice_create_sales_state.dart';

@injectable
class BusinessInvoiceCreateSalesBloc extends Bloc<
    BusinessInvoiceCreateSalesEvent, BusinessInvoiceCreateSalesState> {
  final IUserRepo _userRepo;
  final IInvoiceRepo _invoiceRepo;
  BusinessInvoiceCreateSalesBloc(this._userRepo, this._invoiceRepo)
      : super(BusinessInvoiceCreateSalesInitial()) {
    on<BusinessInvoiceCreateSalesInitialEvent>((event, emit) async {
      emit(BusinessInvoiceCreateSalesLoadingState());
      var response = await _userRepo.getCustomers();

      emit(
        response.fold((l) {
          return BusinessInvoiceCreateSalesErrorState();
        }, (r) {
          return BusinessInvoiceCreateSalesSuccessState(
            customers: r.data,
          );
        }),
      );
    });

    on<BusinessInvoiceCreateSalesSelectCustomersEvent>((event, emit) {
      emit(BusinessInvoiceCreateSalesNavigateToCustomersState());
    });
    on<BusinessInvoiceCreateSalesAddItemsEvent>((event, emit) {
      emit(BusinessInvoiceCreateSalesNavigateToAddItemState());
    });

    on<BusinessInvoiceCreateSalesCreateEvent>((event, emit) async {
      emit(BusinessInvoiceCreateSalesLoadingState());

      // var response = await _invoiceRepo.createSales(request: event.request);

      // emit(
      //   response.fold((l) {
      //     return BusinessInvoiceCreateSalesErrorState();
      //   }, (r) {
      //     return BusinessInvoiceCreateSalesNavigateToInvoiceState();
      //   }),
      // );
    });
  }
}
