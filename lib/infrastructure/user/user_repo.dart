import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:quickprism/core/utils/extensions.dart';
import 'package:quickprism/domain/core/api_endpoints.dart';
import 'package:quickprism/domain/core/failures/main_failures.dart';
import 'package:quickprism/domain/stocks/models/add_customer/add_customer_model.dart';
import 'package:quickprism/domain/stocks/models/customers/customers_model.dart';
import 'package:quickprism/domain/stocks/models/get_business_type/get_business_type_model.dart';
import 'package:quickprism/domain/stocks/models/suppliers/suppliers_model.dart';
import 'package:quickprism/domain/user/i_user_repo.dart';
import 'package:quickprism/domain/user/models/create_business/create_business_model.dart';
import 'package:quickprism/domain/user/models/create_employee_user/employee_register_user_model.dart';
import 'package:quickprism/domain/user/models/employee_checkin_checkout/employee_checkin_checkout_model.dart';
import 'package:quickprism/domain/user/models/employee_day_attendance/employee_day_attendance_model.dart';
import 'package:quickprism/domain/user/models/employee_month_attendance/employee_month_attendance_model.dart';
import 'package:quickprism/domain/user/models/get_vendors/vendors_data_model.dart';
import 'package:quickprism/domain/user/models/parties/parties_model.dart';
import 'package:quickprism/domain/user/models/staff/staff_attendance_by_day_model.dart';
import 'package:quickprism/domain/user/models/staff/staff_attendance_by_month_model.dart';
import 'package:quickprism/domain/user/models/staff/staff_model.dart';
import 'package:quickprism/domain/user/models/sub_category_permissions/employee_sub_category_model.dart';
import 'package:quickprism/domain/user/models/supplier/create_supplier_model.dart';
import 'package:quickprism/domain/user/models/user_model.dart';
import 'package:quickprism/infrastructure/network_client.dart';
import 'package:quickprism/presentation/screens/business/transactions/screen_transactions_purchase.dart';

@LazySingleton(as: IUserRepo)
class UserRepo extends IUserRepo {
  final _netServices = NetworkClient();

  @override
  Future<Either<MainFailures, UserModel>> getUserDetails(
      {required int userId}) async {
    var endPoint = "${ApiEndPoints.getUser}$userId";
    try {
      // final Response response = await Dio(BaseOptions()).get(
      //   endPoint,
      // );
      final Response response =
          await _netServices.createGetRequest(url: endPoint);
      if (response.statusCode == 200 || response.statusCode == 201) {
        // log("User details=>   ${response.data.toString()}");
        final user = UserModel.fromJson(response.data);
        return right(user);
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, CustomersModel>> getCustomers() async {
    try {
      // final Response response = await Dio(BaseOptions()).get(
      //   ApiEndPoints.getCustomers,
      // );
      final Response response = await _netServices.createGetRequest(
        url: ApiEndPoints.getCustomers,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());

        final customer = CustomersModel.fromJson(response.data);

        return right(customer);
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

//  _netServices.createGetRequest
  @override
  Future<Either<MainFailures, SuppliersModel>> getSuppliers() async {
    try {
      final Response response = await _netServices.createGetRequest(
        url: ApiEndPoints.getSuppliers,
      );

      log(response.data.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        final supplier = SuppliersModel.fromJson(response.data);

        return right(supplier);
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      log(e.toString());

      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
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
      required String gst}) async {
    try {
      log('Stock transfer stock repo');
      final Response response =
          // await Dio(BaseOptions()).post(ApiEndPoints.createCustomers, data: {
          await _netServices
              .createPostRequest(url: ApiEndPoints.createCustomers, data: {
        "created_by": createdBy,
        "name": name,
        "mobile_number": number,
        "category_id": "2",
        "email": email,
        "pan": pan,
        "gst_no": gst,
        "address": {
          "street_address": street,
          "pincode": pin,
          "city": city,
          "state": state
        },
        "remarks": "This is a supplier with name $name"
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.toString());

        var res = AddCustomerModel.fromJson(response.data);
        return right(res);
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      log(e.toString());

      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
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
      required String status}) async {
    try {
      log('Stock transfer stock repo');
      final Response response = await _netServices
          .createPostRequest(url: ApiEndPoints.createSupplier, data: {
        "created_by": createdBy,
        "category_id": categoryID,
        "name": name,
        "mobile_number": number,
        "email": email,
        "pan": pan,
        "gst_no": gst,
        "address": {
          "street_address": street,
          "pincode": pin,
          "city": city,
          "state": state
        },
        "remarks": remarks,
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('Supplier repo error');

        var res = CreateSupplierModel.fromJson(response.data);
        return right(res);
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      log('Supplier repo error');

      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, CreateBusinessModel>> createBusiness(
      {required int userId,
      required String type,
      required String businessName,
      required String cin,
      required String pan,
      required String gst}) async {
    try {
      final Response response = await _netServices
          .createPostRequest(url: ApiEndPoints.createBusiness, data: {
        "user_id": userId,
        "business_name": businessName,
        "business_type": type,
        "cid": cin,
        "pan": pan,
        "gst_in": gst
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        var res = CreateBusinessModel.fromJson(response.data);
        return right(res);
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      log('Create business repo error => ${e.toString()}');

      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, String>> updateBusiness(
      {required int userId,
      required int businessId,
      required String type,
      required String businessName,
      required String cin,
      required String pan,
      required String gst}) async {
    try {
      final Response response = await _netServices.createPutRequest(
          url: "${ApiEndPoints.updateBusiness}$businessId",
          data: {
            "user_id": userId,
            "business_name": businessName,
            "business_type": type,
            "cid": cin,
            "pan": pan,
            "gst_in": gst
          });

      if (response.statusCode == 200 || response.statusCode == 201) {
        return right(response.data["message"]);
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      log('Update business repo error => ${e.toString()}');

      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, GetBusinessTypeModel>> getBusinessTypes() async {
    try {
      final Response response = await _netServices.createGetRequest(
        url: ApiEndPoints.getBusinessType,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = GetBusinessTypeModel.fromJson(response.data);

        return Right(res);
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      log('Update business repo error');
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, StaffModel>> getAllStaff(
      {required String businessId}) async {
    var endPoint = "${ApiEndPoints.getAllStaff}$businessId";
    // var endPoint = "${ApiEndPoints.getAllStaff}2";
    try {
      final Response response =
          await _netServices.createGetRequest(url: endPoint);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final staff = StaffModel.fromJson(response.data);

        return right(staff);
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
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
  }) async {
    // TODO: implement createNewStaff

    var endPoint = ApiEndPoints.createNewStaff;
    try {
      final Response res =
          await _netServices.createPostRequest(url: endPoint, data: {
        "business_id": businessId,
        "qpid": qpId,
        "name": name,
        "mobile_number": mobileNo,
        "role": role,
        "is_attendance_and_salary": isAttendanceAndSalary,
        "salary_start_date": salaryStartedDate,
        "salary_interval": salaryInterval,
        "salary_amount": salaryAmount
      });
      if (res.statusCode == 200 || res.statusCode == 201) {
        return right(res);
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: res.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }

    // throw UnimplementedError();
  }

  @override
  Future<Either<MainFailures, StaffAttendanceByMonthModel>>
      getStaffAttendanceByMonth(
          {required String staffId,
          required String year,
          required String month}) async {
    var endPoint =
        "${ApiEndPoints.getStaffAttendanceByMonth}$year/$month/$staffId";
    // var endPoint = "${ApiEndPoints.getAllStaff}2";

    try {
      final Response response =
          await _netServices.createGetRequest(url: endPoint);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final attendance = StaffAttendanceByMonthModel.fromJson(response.data);
        return right(attendance);
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, StaffAttendanceByDayModel>>
      getStaffAttendanceByDay({
    required String staffId,
    required String year,
    required String month,
    required String day,
  }) async {
    // TODO: implement getStaffAttendanceByDay
    if (month.length == 1) {
      month = "0$month";
    }
    if (day.length == 1) {
      day = "0$day";
    }
    var endPoint =
        // "${ApiEndPoints.getStaffAttendanceByDate}2024-01-16/$staffId";
        "${ApiEndPoints.getStaffAttendanceByDate}$year-$month-$day/$staffId";
    // var endPoint = "${ApiEndPoints.getAllStaff}2";

    try {
      final Response response =
          await _netServices.createGetRequest(url: endPoint);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final attendance = StaffAttendanceByDayModel.fromJson(response.data);
        return right(attendance);
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
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
  }) async {
    String year = date.year.toString();
    String month = date.month.toString();
    String day = date.day.toString();
    if (date.month.toString().length == 1) {
      month = "0${date.month}";
    }
    if (date.day.toString().length == 1) {
      day = "0${date.day}";
    }
    // TODO: implement updateStaffAttendanceData
    var endPoint =
        "${ApiEndPoints.updateStaffAttendance}$year-$month-$day/$staffId";
    try {
      final Response res =
          await _netServices.createPutRequest(url: endPoint, data: {
        "check_in": checkInTime,
        "check_out": checkOutTime,
        "attendance_status": attendanceStatus,
        "check_in_address": {
          "state": checkInState,
          "city": checkInCity,
          "pincode": checkInPinCode,
          "street_address": checkInStreetAddress
        },
        "check_out_address": {
          "state": checkOutState,
          "city": checkOutCity,
          "pincode": checkOutPinCode,
          "street_address": checkOutStreetAddress
        }
      });

      if (res.statusCode == 200 || res.statusCode == 201) {
        return right(res);
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: res.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, PartiesModel>> getAllParties() async {
    try {
      final res =
          await _netServices.createGetRequest(url: ApiEndPoints.getAllParties);
      if (res.statusCode == 200 || res.statusCode == 201) {
        final allParties = PartiesModel.fromJson(res.data);
        return Right(allParties);
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: res.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
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
  }) async {
    try {
      final res = await _netServices
          .createPostRequest(url: ApiEndPoints.createNewParty, data: {
        "created_by": createdBy, //user_id of current user here
        "name": name,
        "mobile_number": mobileNo,
        "type": businessType, //business/regular
        "gst_no": gstNo,
        "address": {
          "street_address": streetAddress,
          "pincode": pinCode,
          "city": city,
          "state": state
        }
      });

      if (res.statusCode == 200 || res.statusCode == 201) {
        return Right(res.data.toString());
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: res.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, EmployeeRegisterUserModel>> createEmployeeUser(
      {required EmployeeRegisterUserModel body}) async {
    try {
      var response = await _netServices.createPostRequest(
          url: ApiEndPoints.createEmployeeUser, data: body.toJson());
      response.data.toString().log("The employee user created");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(EmployeeRegisterUserModel());
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? "Something went wrong"));
      }
    } catch (e) {
      e.toString().log("createe error");
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, EmployeeCheckInCheckOutModel>>
      updateCheckInCheckOutEmployee(
          {required int staffId,
          required Date date,
          required EmployeeCheckInCheckOutModel body}) async {
    body.toJson().toString().log("updated employee");
    try {
      String endPoint =
          "${ApiEndPoints.updateEmployeeAttendance}$date/$staffId";
      final response = await _netServices.createPutRequest(
        url: endPoint,
        data: body.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final employeeCheckInCheckOutModel =
            EmployeeCheckInCheckOutModel.fromJson(response.data);
        response.data.toString().log("The user has be check-in");
        return Right(employeeCheckInCheckOutModel);
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? "Something went wrong"));
      }
    } catch (e) {
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, EmployeeMonthAttendanceModel>>
      getEmployeeAttendanceByMonth(
          {required String staffId,
          required String year,
          required String month}) async {
    var endPoint =
        "${ApiEndPoints.getStaffAttendanceByMonth}$year/$month/$staffId";
    try {
      final Response response =
          await _netServices.createGetRequest(url: endPoint);
      response.data.toString().log("getStaffAttendancee");
      if (response.statusCode == 200 || response.statusCode == 201) {
        final attendance = EmployeeMonthAttendanceModel.fromJson(response.data);
        return right(attendance);
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, EmployeeDayAttendanceModel>>
      getEmployeeAttendanceByDay(
          {required String staffId,
          required String year,
          required String month,
          required String day}) async {
    if (month.length == 1) {
      month = "0$month";
    }
    if (day.length == 1) {
      day = "0$day";
    }
    var endPoint =
        "${ApiEndPoints.getStaffAttendanceByDate}$year-$month-$day/$staffId";
    try {
      final Response response =
          await _netServices.createGetRequest(url: endPoint);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final attendance = EmployeeDayAttendanceModel.fromJson(response.data);
        return right(attendance);
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, String>> getEmployeeStatus(
      {required int qpid}) async {
    // TODO: implement getEmployeeStatus
    //
    var endPoint = "${ApiEndPoints.getEmployeeStatusVerifiedOrNot}$qpid";
    try {
      final Response response =
          await _netServices.createGetRequest(url: endPoint);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return right(response.data["data"]);
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, List>> getCategoryPermissions() async {
    // TODO: implement getCategoryPermissions
    var endPoint = ApiEndPoints.getEmployeeCategoryPermission;
    try {
      final Response response =
          await _netServices.createGetRequest(url: endPoint);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return right(response.data["data"]);
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, EmployeeSubCategoryModel>>
      getSubCategoryPermissions() async {
    // TODO: implement getSubCategoryPermissions
    var endPoint = ApiEndPoints.getEmployeeSubCategoryPermission;
    try {
      final Response response =
          await _netServices.createGetRequest(url: endPoint);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var d = EmployeeSubCategoryModel.fromJson(response.data);
        return right(d);
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, String>> createEmployeeBusiness(
      {required Map<String, dynamic> data}) async {
    // TODO: implement createEmployeeBusiness
    try {
      data.toString().log("create empp businesss");
      // var response = await _netServices.createPostRequest(
      //     url: ApiEndPoints.createBusinessEmployee, data: data);

      // if (response.statusCode == 200 || response.statusCode == 201) {
      //   return Right(response.data.toString());
      // } else {
      //   return Left(MainFailures.serverFailure(
      //       errorMessage: response.statusMessage ?? "Something went wrong"));
      // }
      return Right("done");
    } catch (e) {
      e.toString().log("createe error");
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }



  @override
  Future<Either<MainFailures, VendorsModel>> getVendorsData() async {
    var endPoint = ApiEndPoints.getVendors;
    try {
      final Response response = await _netServices.createGetRequest(url: endPoint);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var d = VendorsModel.fromJson(response.data);
        return right(d);
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }


}
