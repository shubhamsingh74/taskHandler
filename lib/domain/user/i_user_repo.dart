import 'package:dartz/dartz.dart';
import 'package:quickprism/domain/core/failures/main_failures.dart';
import 'package:quickprism/domain/stocks/models/add_customer/add_customer_model.dart';
import 'package:quickprism/domain/stocks/models/customers/customers_model.dart';
import 'package:quickprism/domain/stocks/models/get_business_type/get_business_type_model.dart';
import 'package:quickprism/domain/stocks/models/suppliers/suppliers_model.dart';
import 'package:quickprism/domain/user/models/create_business/create_business_model.dart';
import 'package:quickprism/domain/user/models/create_employee_user/employee_register_user_model.dart';
import 'package:quickprism/domain/user/models/employee_checkin_checkout/employee_checkin_checkout_model.dart';
import 'package:quickprism/domain/user/models/employee_day_attendance/employee_day_attendance_model.dart';
import 'package:quickprism/domain/user/models/employee_month_attendance/employee_month_attendance_model.dart';
import 'package:quickprism/domain/user/models/get_vendors/vendors_data_model.dart';
import 'package:quickprism/domain/user/models/staff/staff_attendance_by_day_model.dart';
import 'package:quickprism/domain/user/models/staff/staff_attendance_by_month_model.dart';
import 'package:quickprism/domain/user/models/staff/staff_model.dart';
import 'package:quickprism/domain/user/models/sub_category_permissions/employee_sub_category_model.dart';
import 'package:quickprism/domain/user/models/supplier/create_supplier_model.dart';
import 'package:quickprism/domain/user/models/user_model.dart';

import '../../presentation/screens/business/transactions/screen_transactions_purchase.dart';
import 'models/parties/parties_model.dart';

abstract class IUserRepo {
  Future<Either<MainFailures, UserModel>> getUserDetails({required int userId});
  Future<Either<MainFailures, CustomersModel>> getCustomers();
  Future<Either<MainFailures, SuppliersModel>> getSuppliers();
  Future<Either<MainFailures, CreateSupplierModel>> createSupplier(
      {required int createdBy,
      required int categoryID,
      required String name,
      required String number,
      required String email,
      required String pan,
      required String gst,
      required String street,
      required String pin,
      required String city,
      required String state,
      required String remarks,
      required String status});
  Future<Either<MainFailures, AddCustomerModel>> createCustomer(
      {required int createdBy,
      required int categoryID,
      required String name,
      required String number,
      required String email,
      required String street,
      required String pin,
      required String city,
      required String state,
      required String type,
      required String dob,
      required String companyName,
      required String pan,
      required String gst});

  Future<Either<MainFailures, CreateBusinessModel>> createBusiness(
      {required int userId,
      required String type,
      required String businessName,
      required String cin,
      required String pan,
      required String gst});

  Future<Either<MainFailures, String>> updateBusiness(
      {required int userId,
      required int businessId,
      required String type,
      required String businessName,
      required String cin,
      required String pan,
      required String gst});

  Future<Either<MainFailures, GetBusinessTypeModel>> getBusinessTypes();
  Future<Either<MainFailures, StaffModel>> getAllStaff(
      {required String businessId});
  Future<Either<MainFailures, dynamic>> addNewStaff({
    required String businessId,
    required String qpId,
    required String name,
    required String mobileNo,
    required String role,
    required bool isAttendanceAndSalary,
    required String? salaryStartedDate,
    required String? salaryInterval,
    required String? salaryAmount,
  });

  Future<Either<MainFailures, StaffAttendanceByMonthModel>>
      getStaffAttendanceByMonth({
    required String staffId,
    required String year,
    required String month,
  });
  Future<Either<MainFailures, StaffAttendanceByDayModel>>
      getStaffAttendanceByDay({
    required String staffId,
    required String year,
    required String month,
    required String day,
  });
  Future<Either<MainFailures, dynamic>> updateStaffAttendanceData({
    required String checkInTime,
    required String checkOutTime,
    required String attendanceStatus,
    required String checkInState,
    required String checkInCity,
    required String checkInPinCode,
    required String checkInStreetAddress,
    required String checkOutState,
    required String checkOutCity,
    required String checkOutPinCode,
    required String checkOutStreetAddress,
    required DateTime date,
    required String staffId,
  });

  Future<Either<MainFailures, PartiesModel>> getAllParties();
  Future<Either<MainFailures, String>> createNewParty({
    required int createdBy,
    required String name,
    required String businessType,
    required String mobileNo,
    required String streetAddress,
    required String pinCode,
    required String city,
    required String state,
    required String gstNo,
  });

  Future<Either<MainFailures, EmployeeRegisterUserModel>> createEmployeeUser(
      {required EmployeeRegisterUserModel body});

  Future<Either<MainFailures, EmployeeCheckInCheckOutModel>>
      updateCheckInCheckOutEmployee(
          {required int staffId,
          required Date date,
          required EmployeeCheckInCheckOutModel body});

  Future<Either<MainFailures, EmployeeMonthAttendanceModel>>
      getEmployeeAttendanceByMonth({
    required String staffId,
    required String year,
    required String month,
  });

  Future<Either<MainFailures, EmployeeDayAttendanceModel>>
      getEmployeeAttendanceByDay({
    required String staffId,
    required String year,
    required String month,
    required String day,
  });
// getEmployeeStatus
  Future<Either<MainFailures, String>> getEmployeeStatus({required int qpid});
  Future<Either<MainFailures, List>> getCategoryPermissions();
  Future<Either<MainFailures, EmployeeSubCategoryModel>> getSubCategoryPermissions();
  Future<Either<MainFailures, String>> createEmployeeBusiness({required Map<String, dynamic> data});

  Future<Either<MainFailures, VendorsModel>> getVendorsData();

}
