import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:quickprism/domain/invoice/i_invoice_repo.dart';
import 'package:quickprism/domain/invoice/models/purchase_list/invoice_purchase_list_model.dart';
import 'package:quickprism/domain/invoice/models/sales_list/invoice_sales_list_model.dart';
import 'package:quickprism/domain/user/user_constants.dart';

part 'business_invoice_home_event.dart';
part 'business_invoice_home_state.dart';

@injectable
class BusinessInvoiceHomeBloc
    extends Bloc<BusinessInvoiceHomeEvent, BusinessInvoiceHomeState> {
  final IInvoiceRepo invoiceRepo;

  BusinessInvoiceHomeBloc(this.invoiceRepo)
      : super(BusinessInvoiceHomeInitial(purchaseList: [], salesList: [])) {
    on<BusinessInvoiceHomeInitialEvent>((event, emit) async {
      emit(BusinessInvoiceHomeLoadingState(purchaseList: [], salesList: []));

      List<InvoicePurchaseListData> purchaseList = [];
      List<InvoiceSalesListData> salesList = [];
      var shopId = UserConstants.currentShop!.shopId!;
      log('get purchase and sales with => ${shopId}');
      var response = await invoiceRepo.getPurchase(shopId: shopId);
      var response2 = await invoiceRepo.getSales(shopId: shopId);

      response.fold((l) {
        emit(BusinessInvoiceHomeErrorState());
      }, (r) {
        purchaseList = r.data!;
      });
      response2.fold((l) {
        emit(BusinessInvoiceHomeErrorState());
      }, (r) {
        salesList = r.data!;

        emit(BusinessInvoiceHomeSuccessState(
          salesList: salesList,
          purchaseList: purchaseList,
        ));
      });
    });
  }
}
