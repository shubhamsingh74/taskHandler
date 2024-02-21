import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickprism/application/auth/business_signup/business_sign_up_bloc.dart';
import 'package:quickprism/application/auth/category_selection/auth_category_bloc.dart';
import 'package:quickprism/application/business/business_create_item/business_create_item_bloc.dart';
import 'package:quickprism/application/business/business_create_supplier/business_create_supplier_bloc.dart';
import 'package:quickprism/application/business/business_invoice_create_sales/business_invoice_create_sales_bloc.dart';
import 'package:quickprism/application/business/business_management/business_management_bloc.dart';
import 'package:quickprism/application/business/business_management_store_list/business_management_store_list_bloc.dart';
import 'package:quickprism/application/business/business_my_list/business_my_list_bloc.dart';
import 'package:quickprism/application/business/business_my_list_info/business_my_list_info_bloc.dart';
import 'package:quickprism/application/business/business_parties_home/business_parties_home_bloc.dart';
import 'package:quickprism/application/business/business_staff_management/business_staff_management_bloc.dart';
import 'package:quickprism/application/business/business_stock_create_edit/business_stock_item_create_edit_bloc.dart';
import 'package:quickprism/application/business/business_stock_home/business_stock_home_bloc.dart';
import 'package:quickprism/application/business/business_stock_in/business_stock_in_bloc.dart';
import 'package:quickprism/application/business/business_stock_items/business_stock_items_bloc.dart';
import 'package:quickprism/application/business/business_stock_out/business_stock_out_bloc.dart';
import 'package:quickprism/application/business/business_stock_transfer/business_stock_transfer_bloc.dart';
import 'package:quickprism/application/business/business_transactions/business_transaction_bloc.dart';
import 'package:quickprism/application/business/business_transactions/requisition/transaction_requisition_bloc.dart';
import 'package:quickprism/application/business/home/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:quickprism/application/business/home/business_home/business_home_bloc.dart';
import 'package:quickprism/application/business/transactions_purchase_invoice/transaction_purchase_invoice_bloc.dart';
import 'package:quickprism/application/employee/employee_attendance/employee_attendance_bloc.dart';
import 'package:quickprism/application/employee/employee_dashboard_tasks/employee_dashboard_bloc.dart';
import 'package:quickprism/application/employee/employee_profile/employee_profile_bloc.dart';
import 'package:quickprism/application/employee/employee_register_user/employee_register_user_bloc.dart';
import 'package:quickprism/application/employee/employee_upcoming_tasks/employee_upcoming_tasks_bloc.dart';
import 'package:quickprism/domain/core/di/injectable.dart';

import 'auth/send_otp/send_otp_bloc.dart';
import 'auth/user_selection/user_selection_bloc.dart';
import 'auth/verify_otp/verify_otp_bloc.dart';
import 'business/business_create_customer/business_create_customer_bloc.dart';
import 'business/business_invoice_add_item/business_invoice_add_item_bloc.dart';
import 'business/business_invoice_create_invoice/business_invoice_create_bloc.dart';
import 'business/business_invoice_home/business_invoice_home_bloc.dart';
import 'business/business_my_profile/my_business_profile_bloc.dart';
import 'business/business_profile_home/business_profile_home_bloc.dart';
import 'business/business_staff_management/business_staff_add_employee/business_staff_add_employee_bloc.dart';
import 'business/business_stock_item_info/business_stock_item_info_bloc.dart';

class AppBlocProviders {
  static List<BlocProvider> providers = [
    //authentication
    BlocProvider(create: (ctx) => getIt<SendOtpBloc>()),
    BlocProvider(create: (ctx) => getIt<VerifyOtpBloc>()),
    BlocProvider(create: (ctx) => getIt<UserSelectionBloc>()),
    BlocProvider(create: (ctx) => getIt<BusinessSignUpBloc>()),
    BlocProvider(create: (ctx) => getIt<AuthCategoryBloc>()),
    BlocProvider(create: (ctx) => getIt<BusinessHomeBloc>()),
    BlocProvider(create: (ctx) => getIt<BusinessMyListBloc>()),
    BlocProvider(create: (ctx) => getIt<BusinessMyListInfoBloc>()),
    BlocProvider(create: (ctx) => getIt<BusinessStockHomeBloc>()),
    BlocProvider(create: (ctx) => getIt<BusinessStockItemCreateEditBloc>()),

    BlocProvider(create: (ctx) => getIt<BusinessStockItemsBloc>()),
    BlocProvider(create: (ctx) => getIt<BusinessStockItemInfoBloc>()),
    BlocProvider(create: (ctx) => getIt<BusinessStockInBloc>()),
    BlocProvider(create: (ctx) => getIt<BusinessStockOutBloc>()),
    BlocProvider(create: (ctx) => getIt<BusinessStockTransferBloc>()),
    BlocProvider(create: (ctx) => getIt<BusinessCreateCustomerBloc>()),
    BlocProvider(create: (ctx) => getIt<BusinessCreateSupplierBloc>()),
    BlocProvider(create: (ctx) => getIt<BusinessInvoiceCreatePurchaseBloc>()),
    BlocProvider(create: (ctx) => getIt<BusinessInvoiceCreateSalesBloc>()),
    BlocProvider(create: (ctx) => getIt<BusinessInvoiceAddItemBloc>()),
    BlocProvider(create: (ctx) => getIt<BusinessPartiesHomeBloc>()),
    BlocProvider(create: (ctx) => getIt<BusinessInvoiceHomeBloc>()),
    BlocProvider(create: (ctx) => getIt<MyBusinessProfileBloc>()),
    BlocProvider(create: (ctx) => getIt<BusinessProfileHomeBloc>()),
    BlocProvider(create: (ctx) => getIt<BusinessManagementStoreListBloc>()),
    BlocProvider(create: (ctx) => getIt<BusinessManagementBloc>()),
    BlocProvider(create: (ctx) => BusinessBottomNavigationCubit()),
    BlocProvider(create: (ctx) => getIt<BusinessStaffManagementBloc>()),
    BlocProvider(create: (ctx) => getIt<BusinessTransactionBloc>()),
    BlocProvider(create: (ctx) => getIt<BusinessCreateItemBloc>()),
    BlocProvider(create: (ctx) => getIt<TransactionPurchaseInvoiceBloc>()),
    BlocProvider(create: (ctx) => getIt<TransactionPurchaseInvoiceBloc>()),
    BlocProvider(create: (ctx) => getIt<BusinessTransactionRequisitionBloc>()),

    //employee
    BlocProvider(create: (ctx) => getIt<EmployeeDashboardBloc>()),
    BlocProvider(create: (ctx) => getIt<EmployeeRegisterUserBloc>()),
    BlocProvider(create: (ctx) => getIt<EmployeeTasksBloc>()),
    BlocProvider(create: (ctx) => getIt<EmployeeAttendanceBloc>()),
    BlocProvider(create: (ctx) => getIt<EmployeeProfileBloc>()),
    BlocProvider(create: (ctx) => getIt<BusinessStaffAddEmployeeBloc>()),
  ];
}
