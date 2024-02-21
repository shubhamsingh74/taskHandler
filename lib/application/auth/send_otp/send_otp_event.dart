part of 'send_otp_bloc.dart';

// class SendOtpEvent with _$SendOtpEvent {
//   const factory SendOtpEvent.started() = _Started;
//   const factory SendOtpEvent.sendOtp({
//     required String phone,
//   }) = _SendOtp;
//
//   const factory SendOtpEvent.showSnackBar(String message) = _ShowSnackBarEvent;
//
//   const factory SendOtpEvent.navigateToScreen() = _NavigateToScreenEvent;
// }

@immutable
abstract class SendOtpEvent {}

class SendOtpStartEvent extends SendOtpEvent {}

class SendOtpButtonClickEvent extends SendOtpEvent {
  final String phone;

  SendOtpButtonClickEvent({required this.phone});
}

class SendOtpNavigateEvent extends SendOtpEvent {}
