import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quickprism/domain/auth/models/auth/signup_req_model.dart';
import 'package:quickprism/domain/stocks/models/customers/customers_model.dart';
import 'package:quickprism/domain/stocks/models/item_info/stock_item_info_model.dart';
import 'package:quickprism/domain/stocks/models/items/stock_items_model.dart';
import 'package:quickprism/domain/stocks/models/mylist_details/mylist_details_model.dart';
import 'package:quickprism/domain/stocks/models/shops_all_model/get_all_shops_model.dart';
import 'package:quickprism/domain/stocks/models/stock_type_etails/stock_type_details_model.dart';
import 'package:quickprism/domain/stocks/models/suppliers/suppliers_model.dart';
import 'package:quickprism/presentation/screens/auth/screen_business_signup.dart';
import 'package:quickprism/presentation/screens/auth/screen_category_selection.dart';
import 'package:quickprism/presentation/screens/auth/screen_customer_signup.dart';
import 'package:quickprism/presentation/screens/auth/screen_employee_signup.dart';
import 'package:quickprism/presentation/screens/auth/screen_otp_new.dart';
import 'package:quickprism/presentation/screens/auth/screen_otp_old.dart';
import 'package:quickprism/presentation/screens/auth/screen_sign_up_new.dart';
import 'package:quickprism/presentation/screens/auth/screen_sign_up_old.dart';
import 'package:quickprism/presentation/screens/auth/screen_signup_or_login.dart';
import 'package:quickprism/presentation/screens/auth/screen_user_selection_new.dart';
 import 'package:quickprism/presentation/screens/business/create_item/screen_create_item_new.dart';
import 'package:quickprism/presentation/screens/business/home/screen_business_home.dart';
 import 'package:quickprism/presentation/screens/business/home_old/invoice/screen_invoice_add_item.dart';
import 'package:quickprism/presentation/screens/business/home_old/invoice/screen_invoice_new_sale.dart';
import 'package:quickprism/presentation/screens/business/home_old/invoice/screen_invoice_select_supplier.dart';
import 'package:quickprism/presentation/screens/business/home_old/invoice/screen_new_purchase.dart';
import 'package:quickprism/presentation/screens/business/home_old/parties/screen_business_add_customer.dart';
import 'package:quickprism/presentation/screens/business/home_old/parties/screen_business_add_supplier.dart';
import 'package:quickprism/presentation/screens/business/home_old/screen_business_home.dart';
import 'package:quickprism/presentation/screens/business/home_old/stock/screen_add_edit_stock.dart';
import 'package:quickprism/presentation/screens/business/home_old/stock/screen_business_item_list.dart';
import 'package:quickprism/presentation/screens/business/home_old/stock/screen_business_stock_in.dart';
import 'package:quickprism/presentation/screens/business/home_old/stock/screen_business_stock_out.dart';
import 'package:quickprism/presentation/screens/business/home_old/stock/screen_business_stock_transfer.dart';
import 'package:quickprism/presentation/screens/business/home_old/stock/screen_stock_in_select_supplier.dart';
import 'package:quickprism/presentation/screens/business/home_old/stock/screen_stock_invoice.dart';
import 'package:quickprism/presentation/screens/business/home_old/stock/screen_stock_item_info.dart';
import 'package:quickprism/presentation/screens/business/home_old/stock/screen_stock_out_select_customers.dart';
import 'package:quickprism/presentation/screens/business/my_lists_info/screen_my_lists_info.dart';
import 'package:quickprism/presentation/screens/business/transactions/screen_transactions_purchase.dart';
import 'package:quickprism/presentation/screens/customer/screen_customer_home.dart';
import 'package:quickprism/presentation/screens/employee/screen_employee_home.dart';
import 'package:quickprism/presentation/screens/employee/screen_emplyoee_payment.dart';
import 'package:quickprism/presentation/screens/employee/screen_emplyoee_register.dart';
import 'package:quickprism/presentation/screens/profile/screen_business_mangement_store_list.dart';
import 'package:quickprism/presentation/screens/splash/screen_splash_new.dart';
import 'package:quickprism/presentation/screens/splash/screen_splash_old.dart';

import '../../application/business/business_create_item/business_create_item_bloc.dart';
import '../../application/business/business_staff_management/business_staff_management_bloc.dart';
import '../../presentation/screens/business/create_item/screen_create_item.dart';
import '../../presentation/screens/business/create_item/screen_create_item_success.dart';
import '../../presentation/screens/business/edit_item/screen_edit_item.dart';
import '../../presentation/screens/business/home_old/invoice/screen_invoice_select_customer.dart';
import '../../presentation/screens/business/parties/screen_business_add_party.dart';
import '../../presentation/screens/business/transactions/screen_transactions_sales_invoice.dart';
import '../../presentation/screens/profile/screen_add_bank_account.dart';
import '../../presentation/screens/profile/screen_add_new_staff.dart';
import '../../presentation/screens/profile/screen_bank_account.dart';
import '../../presentation/screens/profile/screen_business_management.dart';
import '../../presentation/screens/profile/screen_payment_staff_member.dart';
import '../../presentation/screens/profile/screen_my_business_profile.dart';
import '../../presentation/screens/profile/screen_profile.dart';
import '../../presentation/screens/profile/screen_staff_management.dart';
import '../../presentation/screens/profile/screen_staff_member_day_attendence.dart';
import '../../presentation/screens/profile/screen_staff_member_profile.dart';
import '../../presentation/screens/profile/staff/screen_employee_add_details.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        // AutoRoute(
        //   page: RouteSplash.page,
        //   initial: true,
        // ),

        AutoRoute(
          page: RouteSplashNew.page,
          initial: true,
        ),
        // AutoRoute(
        //   page: RouteBusinessHome.page,
        //   initial: true,
        // ),
        generateRoute(page: RouteSignupOrLogin.page),
        generateRoute(page: RouteSignUp.page),
        generateRoute(page: RouteOtp.page),
        generateRoute(page: RouteBusinessSignup.page),
        generateRoute(page: RouteAuthCategorySelection.page),
        generateRoute(page: RouteCustomerSignup.page),
        generateRoute(page: RouteEmployeeSignup.page),
        generateRoute(page: RouteBusinessHome.page),
        generateRoute(page: RouteMyListsInfo.page),
        generateRoute(page: RouteBusinessStockItemList.page),
        generateRoute(page: RouteStockItemInfo.page),
        generateRoute(page: RouteBusinessStockIn.page),
        generateRoute(page: RouteBusinessStockOut.page),
        generateRoute(page: RouteBusinessStockTransfer.page),
        generateRoute(page: RouteBusinessStockTransfer.page),
        generateRoute(page: RouteStockInSelectSupplier.page),
        generateRoute(page: RouteStockSelectCustomers.page),
        generateRoute(page: RouteBusinessAddCustomer.page),
        generateRoute(page: RouteBusinessAddSupplier.page),
        generateRoute(page: RouteStockInvoice.page),
        generateRoute(page: RouteBusinessAddAndEditStock.page),
        generateRoute(page: RouteInvoiceNewPurchase.page),
        generateRoute(page: RouteInvoiceNewSale.page),
        generateRoute(page: RouteInvoiceSelectSupplier.page),
        generateRoute(page: RouteInvoiceSelectCustomer.page),
        generateRoute(page: RouteInvoiceAddItem.page),
        generateRoute(page: RouteTransactionSalesInvoice.page),
        generateRoute(page: RouteProfile.page),
        generateRoute(page: RouteMyBusinessProfile.page),
        generateRoute(page: RouteBankAccount.page),
        generateRoute(page: RouteAddBankAccount.page),
        generateRoute(page: RouteStaffManagement.page),
        generateRoute(page: RouteAddNewStaff.page),
        generateRoute(page: RouteStaffMemberProfile.page),
        generateRoute(page: RoutePaymentStaffMember.page),
        generateRoute(page: RouteBusinessManagement.page),
        generateRoute(page: RouteBusinessManagementStoreList.page),
        generateRoute(page: RouteStaffMemberDayAttendance.page),
        generateRoute(page: RouteCreateItem.page),
        generateRoute(page: RouteEditItem.page),
        generateRoute(page: RouteTransactionsPurchase.page),
        generateRoute(page: RouteBusinessAddNewParty.page),
        generateRoute(page: RouteCreateItemNew.page),
        generateRoute(page: RouteSignUpNew.page),
        generateRoute(page: RouteOtpNew.page),
        generateRoute(page: RouteUserSelectionNew.page),
        generateRoute(page: RouteCreateItemSuccess.page),
        generateRoute(page: RouteEmployeeRegister.page),
        generateRoute(page: RouteEmployeePayment.page),
        generateRoute(page: RouteEmployeeRegister.page),
        generateRoute(page: RouteEmployeeAddDetails.page),

      ];

  CustomRoute generateRoute({required PageInfo<dynamic> page}) => CustomRoute(
        page: page,
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
        durationInMilliseconds: 300,
      );
}
