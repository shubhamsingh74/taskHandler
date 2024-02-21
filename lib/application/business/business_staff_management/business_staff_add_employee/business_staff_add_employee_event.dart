// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'business_staff_add_employee_bloc.dart';

@immutable
abstract class BusinessStaffAddEmployeeEvent {}

class BusinessStaffAddEmployeeVerifyQPIDEvent
    extends BusinessStaffAddEmployeeEvent {
  final String qpid;
  BusinessStaffAddEmployeeVerifyQPIDEvent({
    required this.qpid,
  });
}

class BusinessStaffAddEmployeeAddDetailsInitialEvent
    extends BusinessStaffAddEmployeeEvent {}

class BusinessStaffAddEmployeeAddDetailsEvent
    extends BusinessStaffAddEmployeeEvent {
  final String empSite;
  final List<int> permissions;
  final String empRole;
  final int qpid;
  BusinessStaffAddEmployeeAddDetailsEvent({
    required this.empSite,
    required this.permissions,
    required this.empRole,
    required this.qpid,
  });
}
