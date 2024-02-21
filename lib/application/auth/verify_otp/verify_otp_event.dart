part of 'verify_otp_bloc.dart';

@immutable
abstract class VerifyOtpEvent {}

class VerifyOtpStartEvent extends VerifyOtpEvent {}

class VerifyOtpButtonClickEventSignUp extends VerifyOtpEvent {
  final String otp;
  final String phone;

  VerifyOtpButtonClickEventSignUp({
    required this.otp,
    required this.phone,
  });
}

class VerifyOtpButtonClickEventLogin extends VerifyOtpEvent {
  final String otp;
  final String phone;

  VerifyOtpButtonClickEventLogin({
    required this.otp,
    required this.phone,
  });
}

class VerifyOtpNavigateEvent extends VerifyOtpEvent {}
