part of 'my_business_profile_bloc.dart';

@immutable
abstract class MyBusinessProfileState {
  final bool? isCINvisible;
  final bool? newUser;
  final List<BusinessTypeData> businessTypes;
  const MyBusinessProfileState(
      {required this.businessTypes, this.isCINvisible, this.newUser});
}

@immutable
abstract class MyBusinessProfileActionState extends MyBusinessProfileState {
  const MyBusinessProfileActionState(
      {required super.isCINvisible,
      required super.newUser,
      required super.businessTypes});
}

class MyBusinessProfileMainState extends MyBusinessProfileState {
  const MyBusinessProfileMainState(
      {required super.isCINvisible,
      required super.newUser,
      required super.businessTypes});
}

class MyBusinessProfileLoadingState extends MyBusinessProfileState {
  const MyBusinessProfileLoadingState(
      {required super.isCINvisible,
      required super.newUser,
      required super.businessTypes});
}

class MyBusinessProfileErrorState extends MyBusinessProfileState {
  const MyBusinessProfileErrorState(
      {required super.isCINvisible,
      required super.newUser,
      required super.businessTypes});
}

class MyBusinessProfileNavigateBackState extends MyBusinessProfileActionState {
  const MyBusinessProfileNavigateBackState(
      {required super.isCINvisible,
      required super.newUser,
      required super.businessTypes});
}

class MyBusinessProfileErrorSnackBarState extends MyBusinessProfileActionState {
  const MyBusinessProfileErrorSnackBarState(
      {required super.isCINvisible,
      required super.newUser,
      required super.businessTypes});
}
