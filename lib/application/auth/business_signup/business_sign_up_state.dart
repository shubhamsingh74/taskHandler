part of 'business_sign_up_bloc.dart';

@immutable
abstract class BusinessSignUpState {}

@immutable
abstract class BusinessSignUpActionState extends BusinessSignUpState {}

class BusinessSignUpInitialState extends BusinessSignUpState {}

class BusinessSignUpLoadingState extends BusinessSignUpState {}

class BusinessSignUpErrorState extends BusinessSignUpState {
  final String error;

  BusinessSignUpErrorState({required this.error});
}

class BusinessSignUpErrorSnackBarState extends BusinessSignUpState {}

class BusinessSignupNavigateToHome extends BusinessSignUpActionState {}

class BusinessSignupNavigateToCategorySelection
    extends BusinessSignUpActionState {}
