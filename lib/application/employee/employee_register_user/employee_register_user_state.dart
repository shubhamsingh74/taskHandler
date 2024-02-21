

part of 'employee_register_user_bloc.dart';


@immutable
abstract class EmployeeRegisterUserState {}

class EmployeeRegisterUserInitialState extends EmployeeRegisterUserState {}

class EmployeeRegisterUserLoadingState extends EmployeeRegisterUserState {}

class EmployeeRegisterUserSuccessState extends EmployeeRegisterUserState {}

class EmployeeRegisterUserErrorState extends EmployeeRegisterUserState {}
