part of 'business_profile_home_bloc.dart';

@immutable
abstract class BusinessProfileHomeState {
  final UserModel? user;
  final bool? isProfilePending;
  final bool? isBManagementPending;
  final bool? isSManagementPending;

  const BusinessProfileHomeState({
    this.user,
    this.isProfilePending,
    this.isBManagementPending,
    this.isSManagementPending,
  });
}

abstract class BusinessProfileHomeActionState
    extends BusinessProfileHomeState {}

class BusinessProfileHomeMainState extends BusinessProfileHomeState {
  const BusinessProfileHomeMainState(
      {required super.user,
      required super.isProfilePending,
      required super.isBManagementPending,
      required super.isSManagementPending});
}

class BusinessProfileHomeLogOutState extends BusinessProfileHomeActionState {}
