part of 'business_management_bloc.dart';

@immutable
abstract class BusinessManagementState {}

@immutable
abstract class BusinessManagementActionState extends BusinessManagementState {}

class BusinessManagementInitialState extends BusinessManagementState {}

class BusinessManagementLoadingState extends BusinessManagementState {}

class BusinessManagementErrorState extends BusinessManagementState {}

class BusinessManagementNavigateBackState
    extends BusinessManagementActionState {}

class BusinessManagementErrorSnackBarState
    extends BusinessManagementActionState {}
