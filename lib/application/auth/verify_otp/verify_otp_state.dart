part of 'verify_otp_bloc.dart';

@immutable
abstract class VerifyOtpState {}

@immutable
abstract class VerifyOtpActionState extends VerifyOtpState {}

class VerifyOtpInitial extends VerifyOtpState {}

class VerifyOtpLoadingState extends VerifyOtpState {}

class VerifyOtpErrorState extends VerifyOtpState {}

class VerifyOtpErrorSnackBarState extends VerifyOtpActionState {
  final String error;

  VerifyOtpErrorSnackBarState(this.error);
}

class VerifyOtpNavigateToRegisterState extends VerifyOtpActionState {}

class VerifyOtpNavigateToBusinessHomeState extends VerifyOtpActionState {}

class VerifyOtpNavigateToCustomerHomeState extends VerifyOtpActionState {}

class VerifyOtpNavigateToEmployeeHomeState extends VerifyOtpActionState {}
