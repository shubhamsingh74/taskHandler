part of 'send_otp_bloc.dart';

// class SendOtpState with _$SendOtpState {
//   const factory SendOtpState({
//     required bool isLoading,
//   }) = _SendOtpState;
//
//   factory SendOtpState.initial() => const SendOtpState(isLoading: false);
//   factory SendOtpState.loading() => const SendOtpState(isLoading: true);
//   factory SendOtpState.error() => const SendOtpState(isLoading: false);
//   factory SendOtpState.success() => const SendOtpState(isLoading: false);
//
//   //
//
//   const factory SendOtpState.showingSnackBar(String message) =
//       _YourBlocShowingSnackBarState;
//
//   const factory SendOtpState.navigatingToScreen() = _YourBlocNavigatingState;
// }

@immutable
abstract class SendOtpState {}

@immutable
abstract class SendOtpActionState extends SendOtpState {}

class SendOtpInitialState extends SendOtpState {}

class SendOtpLoadingState extends SendOtpState {}

class SendOtpErrorState extends SendOtpState {}

class SendOtpNavigateToVerifyState extends SendOtpActionState {}

class SendOtpErrorSnackBarState extends SendOtpActionState {
  final String error;

  SendOtpErrorSnackBarState({required this.error});
}

class SendOtpShowToastState extends SendOtpActionState {}
