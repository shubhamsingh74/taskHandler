
part of 'employee_register_user_bloc.dart';

@immutable
abstract class EmployeeRegisterUserEvent {}

class EmployeeRegisterUserButtonEvent extends EmployeeRegisterUserEvent {
  final String name;
  final String email;
  final String address;

  EmployeeRegisterUserButtonEvent({
    required this.name,
    required this.email,
    required this.address,
  });
}
