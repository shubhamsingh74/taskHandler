// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/auth/business_signup/business_sign_up_bloc.dart'
    as _i33;
import '../../../application/auth/category_selection/auth_category_bloc.dart'
    as _i18;
import '../../../application/auth/send_otp/send_otp_bloc.dart' as _i13;
import '../../../application/auth/user_selection/user_selection_bloc.dart'
    as _i16;
import '../../../application/auth/verify_otp/verify_otp_bloc.dart' as _i17;
import '../../../application/business/business_create_customer/business_create_customer_bloc.dart'
    as _i19;
import '../../../application/business/business_create_item/business_create_item_bloc.dart'
    as _i20;
import '../../../application/business/business_create_supplier/business_create_supplier_bloc.dart'
    as _i21;
import '../../../application/business/business_create_task/business_create_task_bloc.dart'
    as _i22;
import '../../../application/business/business_invoice_add_item/business_invoice_add_item_bloc.dart'
    as _i24;
import '../../../application/business/business_invoice_create_invoice/business_invoice_create_bloc.dart'
    as _i25;
import '../../../application/business/business_invoice_create_sales/business_invoice_create_sales_bloc.dart'
    as _i26;
import '../../../application/business/business_invoice_home/business_invoice_home_bloc.dart'
    as _i27;
import '../../../application/business/business_management/business_management_bloc.dart'
    as _i28;
import '../../../application/business/business_management_store_list/business_management_store_list_bloc.dart'
    as _i29;
import '../../../application/business/business_my_list/business_my_list_bloc.dart'
    as _i30;
import '../../../application/business/business_my_list_info/business_my_list_info_bloc.dart'
    as _i31;
import '../../../application/business/business_my_profile/my_business_profile_bloc.dart'
    as _i12;
import '../../../application/business/business_parties_home/business_parties_home_bloc.dart'
    as _i32;
import '../../../application/business/business_profile_home/business_profile_home_bloc.dart'
    as _i3;
import '../../../application/business/business_staff_management/business_staff_add_employee/business_staff_add_employee_bloc.dart'
    as _i34;
import '../../../application/business/business_staff_management/business_staff_management_bloc.dart'
    as _i35;
import '../../../application/business/business_stock_create_edit/business_stock_item_create_edit_bloc.dart'
    as _i38;
import '../../../application/business/business_stock_home/business_stock_home_bloc.dart'
    as _i36;
import '../../../application/business/business_stock_in/business_stock_in_bloc.dart'
    as _i37;
import '../../../application/business/business_stock_item_info/business_stock_item_info_bloc.dart'
    as _i39;
import '../../../application/business/business_stock_items/business_stock_items_bloc.dart'
    as _i40;
import '../../../application/business/business_stock_out/business_stock_out_bloc.dart'
    as _i41;
import '../../../application/business/business_stock_transfer/business_stock_transfer_bloc.dart'
    as _i42;
import '../../../application/business/business_transactions/business_transaction_bloc.dart'
    as _i43;
import '../../../application/business/home/business_home/business_home_bloc.dart'
    as _i23;
import '../../../application/business/transactions_purchase_invoice/transaction_purchase_invoice_bloc.dart'
    as _i14;
import '../../../application/business/transactions_sales_invoice/transaction_sales_invoice_bloc.dart'
    as _i15;
import '../../../application/employee/employee_attendance/employee_attendance_bloc.dart'
    as _i44;
import '../../../application/employee/employee_dashboard_tasks/employee_dashboard_bloc.dart'
    as _i45;
import '../../../application/employee/employee_profile/employee_profile_bloc.dart'
    as _i46;
import '../../../application/employee/employee_register_user/employee_register_user_bloc.dart'
    as _i47;
import '../../../application/employee/employee_upcoming_tasks/employee_upcoming_tasks_bloc.dart'
    as _i48;
import '../../../infrastructure/auth/auth_repo.dart' as _i5;
import '../../../infrastructure/invoice/invoice_repo.dart' as _i7;
import '../../../infrastructure/stocks/stocks_repo.dart' as _i9;
import '../../../infrastructure/user/user_repo.dart' as _i11;
import '../../auth/i_auth_repo.dart' as _i4;
import '../../invoice/i_invoice_repo.dart' as _i6;
import '../../stocks/i_stock_repo.dart' as _i8;
import '../../user/i_user_repo.dart' as _i10;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt initGetIt({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.BusinessProfileHomeBloc>(
        () => _i3.BusinessProfileHomeBloc());
    gh.lazySingleton<_i4.IAuthRepo>(() => _i5.AuthRepo());
    gh.lazySingleton<_i6.IInvoiceRepo>(() => _i7.InvoiceRepo());
    gh.lazySingleton<_i8.IStockRepo>(() => _i9.StocksRepo());
    gh.lazySingleton<_i10.IUserRepo>(() => _i11.UserRepo());
    gh.factory<_i12.MyBusinessProfileBloc>(
        () => _i12.MyBusinessProfileBloc(gh<_i10.IUserRepo>()));
    gh.factory<_i13.SendOtpBloc>(() => _i13.SendOtpBloc(gh<_i4.IAuthRepo>()));
    gh.factory<_i14.TransactionPurchaseInvoiceBloc>(
        () => _i14.TransactionPurchaseInvoiceBloc(
              gh<_i6.IInvoiceRepo>(),
              gh<_i8.IStockRepo>(),
            ));
    gh.factory<_i15.TransactionSalesInvoiceBloc>(
        () => _i15.TransactionSalesInvoiceBloc(
              gh<_i8.IStockRepo>(),
              gh<_i6.IInvoiceRepo>(),
            ));
    gh.factory<_i16.UserSelectionBloc>(
        () => _i16.UserSelectionBloc(gh<_i10.IUserRepo>()));
    gh.factory<_i17.VerifyOtpBloc>(
        () => _i17.VerifyOtpBloc(gh<_i4.IAuthRepo>()));
    gh.factory<_i18.AuthCategoryBloc>(() => _i18.AuthCategoryBloc(
          gh<_i4.IAuthRepo>(),
          gh<_i8.IStockRepo>(),
        ));
    gh.factory<_i19.BusinessCreateCustomerBloc>(
        () => _i19.BusinessCreateCustomerBloc(
              gh<_i8.IStockRepo>(),
              gh<_i10.IUserRepo>(),
            ));
    gh.factory<_i20.BusinessCreateItemBloc>(
        () => _i20.BusinessCreateItemBloc(gh<_i8.IStockRepo>()));
    gh.factory<_i21.BusinessCreateSupplierBloc>(
        () => _i21.BusinessCreateSupplierBloc(
              gh<_i8.IStockRepo>(),
              gh<_i10.IUserRepo>(),
            ));
    gh.factory<_i22.BusinessCreateTaskBloc>(
        () => _i22.BusinessCreateTaskBloc(gh<_i8.IStockRepo>()));
    gh.factory<_i23.BusinessHomeBloc>(
        () => _i23.BusinessHomeBloc(gh<_i10.IUserRepo>()));
    gh.factory<_i24.BusinessInvoiceAddItemBloc>(
        () => _i24.BusinessInvoiceAddItemBloc(gh<_i8.IStockRepo>()));
    gh.factory<_i25.BusinessInvoiceCreatePurchaseBloc>(
        () => _i25.BusinessInvoiceCreatePurchaseBloc(
              gh<_i6.IInvoiceRepo>(),
              gh<_i10.IUserRepo>(),
            ));
    gh.factory<_i26.BusinessInvoiceCreateSalesBloc>(
        () => _i26.BusinessInvoiceCreateSalesBloc(
              gh<_i10.IUserRepo>(),
              gh<_i6.IInvoiceRepo>(),
            ));
    gh.factory<_i27.BusinessInvoiceHomeBloc>(
        () => _i27.BusinessInvoiceHomeBloc(gh<_i6.IInvoiceRepo>()));
    gh.factory<_i28.BusinessManagementBloc>(
        () => _i28.BusinessManagementBloc(gh<_i8.IStockRepo>()));
    gh.factory<_i29.BusinessManagementStoreListBloc>(
        () => _i29.BusinessManagementStoreListBloc(gh<_i8.IStockRepo>()));
    gh.factory<_i30.BusinessMyListBloc>(
        () => _i30.BusinessMyListBloc(gh<_i8.IStockRepo>()));
    gh.factory<_i31.BusinessMyListInfoBloc>(
        () => _i31.BusinessMyListInfoBloc(gh<_i8.IStockRepo>()));
    gh.factory<_i32.BusinessPartiesHomeBloc>(
        () => _i32.BusinessPartiesHomeBloc(gh<_i10.IUserRepo>()));
    gh.factory<_i33.BusinessSignUpBloc>(
        () => _i33.BusinessSignUpBloc(gh<_i4.IAuthRepo>()));
    gh.factory<_i34.BusinessStaffAddEmployeeBloc>(
        () => _i34.BusinessStaffAddEmployeeBloc(gh<_i10.IUserRepo>()));
    gh.factory<_i35.BusinessStaffManagementBloc>(
        () => _i35.BusinessStaffManagementBloc(gh<_i10.IUserRepo>()));
    gh.factory<_i36.BusinessStockHomeBloc>(() => _i36.BusinessStockHomeBloc(
          gh<_i10.IUserRepo>(),
          gh<_i8.IStockRepo>(),
        ));
    gh.factory<_i37.BusinessStockInBloc>(() => _i37.BusinessStockInBloc(
          gh<_i8.IStockRepo>(),
          gh<_i10.IUserRepo>(),
        ));
    gh.factory<_i38.BusinessStockItemCreateEditBloc>(
        () => _i38.BusinessStockItemCreateEditBloc(gh<_i8.IStockRepo>()));
    gh.factory<_i39.BusinessStockItemInfoBloc>(
        () => _i39.BusinessStockItemInfoBloc(gh<_i8.IStockRepo>()));
    gh.factory<_i40.BusinessStockItemsBloc>(
        () => _i40.BusinessStockItemsBloc(gh<_i8.IStockRepo>()));
    gh.factory<_i41.BusinessStockOutBloc>(() => _i41.BusinessStockOutBloc(
          gh<_i8.IStockRepo>(),
          gh<_i10.IUserRepo>(),
        ));
    gh.factory<_i42.BusinessStockTransferBloc>(
        () => _i42.BusinessStockTransferBloc(gh<_i8.IStockRepo>()));
    gh.factory<_i43.BusinessTransactionBloc>(
        () => _i43.BusinessTransactionBloc(gh<_i6.IInvoiceRepo>()));
    gh.factory<_i44.EmployeeAttendanceBloc>(
        () => _i44.EmployeeAttendanceBloc(gh<_i10.IUserRepo>()));
    gh.factory<_i45.EmployeeDashboardBloc>(() => _i45.EmployeeDashboardBloc(
          gh<_i8.IStockRepo>(),
          gh<_i10.IUserRepo>(),
        ));
    gh.factory<_i46.EmployeeProfileBloc>(
        () => _i46.EmployeeProfileBloc(gh<_i10.IUserRepo>()));
    gh.factory<_i47.EmployeeRegisterUserBloc>(
        () => _i47.EmployeeRegisterUserBloc(gh<_i10.IUserRepo>()));
    gh.factory<_i48.EmployeeTasksBloc>(
        () => _i48.EmployeeTasksBloc(gh<_i8.IStockRepo>()));
    return this;
  }
}
