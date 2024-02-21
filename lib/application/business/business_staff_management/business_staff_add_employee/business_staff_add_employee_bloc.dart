import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:quickprism/core/utils/extensions.dart';
import 'package:quickprism/domain/user/i_user_repo.dart';
import 'package:quickprism/domain/user/user_constants.dart';

import '../../../../domain/user/models/sub_category_permissions/employee_sub_category_model.dart';
import 'dart:convert';

part 'business_staff_add_employee_event.dart';
part 'business_staff_add_employee_state.dart';

@injectable
class BusinessStaffAddEmployeeBloc
    extends Bloc<BusinessStaffAddEmployeeEvent, BusinessStaffAddEmployeeState> {
  final IUserRepo _iUserRepo;
  BusinessStaffAddEmployeeBloc(this._iUserRepo)
      : super(BusinessStaffAddEmployeeInitialState()) {
    on<BusinessStaffAddEmployeeVerifyQPIDEvent>(_checkIsEmployeeVerified);
    on<BusinessStaffAddEmployeeAddDetailsInitialEvent>(_getPermissions);
    on<BusinessStaffAddEmployeeAddDetailsEvent>(_addEmployee);
  }

  Future<void> _addEmployee(BusinessStaffAddEmployeeAddDetailsEvent event,
      Emitter<BusinessStaffAddEmployeeState> emit) async {
    emit(BusinessStaffAddEmployeeLoadingState());
    var data = CreateEmployeeModel(
        businessId: UserConstants.currentBusiness?.businessProfile?.businessId,
        empRole: event.empRole,
        empSite: event.empSite,
        permissions: event.permissions,
        qpid: event.qpid,
        shopId: UserConstants.currentShop?.shopId);

    var res = await _iUserRepo.createEmployeeBusiness(data: data.toJson());
    res.fold((l) {
      emit(BusinessStaffAddEmployeeErrorState());
    }, (r) {
      emit(BusinessStaffAddEmployeeCreatedState());
    });
  }

  Future<void> _getPermissions(
      BusinessStaffAddEmployeeAddDetailsInitialEvent event,
      Emitter<BusinessStaffAddEmployeeState> emit) async {
    List<String> permissionCatList = [];
    List<EmployeeSubCategoryData>? subCategories = [];
    var res = await Future.wait([
      _iUserRepo.getCategoryPermissions(),
      _iUserRepo.getSubCategoryPermissions()
    ]);
    res[0].fold((l) {
      emit(BusinessStaffAddEmployeeErrorState());
    }, (r) {
      for (var element in r as List) {
        permissionCatList.add(element.toString());
      }
    });
    res[1].fold((l) {}, (r) {
      EmployeeSubCategoryModel d = r as EmployeeSubCategoryModel;
      subCategories = d.data;
    });
    emit(BusinessStaffAddEmployeeDetailsState(
        categoryPermissions: permissionCatList,
        subCategoryData: subCategories));
  }

  Future<void> _checkIsEmployeeVerified(
      BusinessStaffAddEmployeeVerifyQPIDEvent event,
      Emitter<BusinessStaffAddEmployeeState> emit) async {
    emit(BusinessStaffAddEmployeeLoadingState());
    int QPID = int.parse(event.qpid);
    var res = await _iUserRepo.getEmployeeStatus(qpid: QPID);
    res.fold((l) {
      emit(BusinessStaffAddEmployeeErrorState());
    }, (r) {
      if (r.toLowerCase().contains("not")) {
        emit(BusinessStaffAddEmployeeNotVerifiedState());
      } else if (r.toLowerCase().contains("verified")) {
        emit(BusinessStaffAddEmployeeVerifiedState());
      } else {
        emit(BusinessStaffAddEmployeeNotRegisteredState());
      }
    });
  }
}

// remove this and add in models

// To parse this JSON data, do
//
//     final createEmployeeModel = createEmployeeModelFromJson(jsonString);

CreateEmployeeModel createEmployeeModelFromJson(String str) =>
    CreateEmployeeModel.fromJson(json.decode(str));

String createEmployeeModelToJson(CreateEmployeeModel data) =>
    json.encode(data.toJson());

class CreateEmployeeModel {
  int? shopId;
  int? qpid;
  int? businessId;
  String? empSite;
  List<int>? permissions;
  String? empRole;

  CreateEmployeeModel({
    this.shopId,
    this.qpid,
    this.businessId,
    this.empSite,
    this.permissions,
    this.empRole,
  });

  factory CreateEmployeeModel.fromJson(Map<String, dynamic> json) =>
      CreateEmployeeModel(
        shopId: json["shop_id"],
        qpid: json["qpid"],
        businessId: json["business_id"],
        empSite: json["emp_site"],
        permissions: json["permissions"] == null
            ? []
            : List<int>.from(json["permissions"]!.map((x) => x)),
        empRole: json["emp_role"],
      );

  Map<String, dynamic> toJson() => {
        "shop_id": shopId,
        "qpid": qpid,
        "business_id": businessId,
        "emp_site": empSite,
        "permissions": permissions == null
            ? []
            : List<dynamic>.from(permissions!.map((x) => x)),
        "emp_role": empRole,
      };
}
