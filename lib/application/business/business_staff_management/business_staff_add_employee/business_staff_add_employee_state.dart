// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'business_staff_add_employee_bloc.dart';

@immutable
abstract class BusinessStaffAddEmployeeState {}

class BusinessStaffAddEmployeeInitialState
    extends BusinessStaffAddEmployeeState {}

class BusinessStaffAddEmployeeLoadingState
    extends BusinessStaffAddEmployeeState {}

class BusinessStaffAddEmployeeErrorState
    extends BusinessStaffAddEmployeeState {}

class BusinessStaffAddEmployeeVerifiedState
    extends BusinessStaffAddEmployeeState {}

class BusinessStaffAddEmployeeNotVerifiedState
    extends BusinessStaffAddEmployeeState {}
class BusinessStaffAddEmployeeCreatedState
    extends BusinessStaffAddEmployeeState {}

class BusinessStaffAddEmployeeNotRegisteredState
    extends BusinessStaffAddEmployeeState {}

class BusinessStaffAddEmployeeDetailsState extends BusinessStaffAddEmployeeState {
 final List<String> ?  categoryPermissions;
 final List<EmployeeSubCategoryData>? subCategoryData;
  BusinessStaffAddEmployeeDetailsState({
    required this.categoryPermissions,
    this.subCategoryData,
  });
  
}

 // verified not verfied


    
