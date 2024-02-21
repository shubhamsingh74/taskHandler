import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:quickprism/domain/invoice/i_invoice_repo.dart';
import 'package:quickprism/domain/invoice/models/create_purchase_body_model.dart';
import 'package:quickprism/domain/stocks/models/suppliers/suppliers_model.dart';
import 'package:quickprism/domain/user/i_user_repo.dart';

import '../../../domain/invoice/create_purchase_response_model/purchaseBodyModel/invoice_body_model.dart';
 
part 'business_invoice_create_event.dart';
part 'business_invoice_create_state.dart';

@injectable
class BusinessInvoiceCreatePurchaseBloc extends Bloc<
    BusinessInvoiceCreatePurchaseEvent, BusinessInvoiceCreatePurchaseState> {
  final IUserRepo _userRepo;
  final IInvoiceRepo _invoiceRepo;

  BusinessInvoiceCreatePurchaseBloc(this._invoiceRepo, this._userRepo)
      : super(BusinessInvoiceCreateInitialState()) {
    on<BusinessInvoiceCreateInitialEvent>((event, emit) async {
      emit(BusinessInvoiceCreateLoadingState());
      var response = await _userRepo.getSuppliers();

      emit(
        response.fold((l) {
          return BusinessInvoiceCreateErrorState();
        }, (r) {
          return BusinessInvoiceCreateSuccessState(
            suppliers: r.data,
          );
        }),
      );
    });
    on<BusinessInvoiceCreateSelectSupplierEvent>((event, emit) {
      emit(BusinessInvoiceCreateNavigateToSupplierState());
    });
    on<BusinessInvoiceCreateAddItemsEvent>((event, emit) {
      emit(BusinessInvoiceCreateNavigateToAddItemState());
    });

    // on<BusinessInvoiceCreatePurchaseCreateEvent>((event, emit) async {
    //   emit(BusinessInvoiceCreateLoadingState());
    //
    //   var response = await _invoiceRepo.createPurchase(request: event.request);
    //
    //   emit(
    //     response.fold((l) {
    //       return BusinessInvoiceCreateErrorState();
    //     }, (r) {
    //       return BusinessInvoiceCreateNavigateToInvoiceState();
    //     }),
    //   );
    // });
  }
}
