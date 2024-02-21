import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:quickprism/application/auth/verify_otp/verify_otp_bloc.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/core/utils/utils.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/infrastructure/routing/app_router.dart';
import 'package:quickprism/presentation/widgets/button/primary_button.dart';

@RoutePage()
class ScreenOtp extends StatefulWidget {
  const ScreenOtp({
    super.key,
    required this.authType,
    required this.phoneNumber,
  });

  final String authType;
  final String phoneNumber;

  @override
  State<ScreenOtp> createState() => _ScreenOtpState();
}

class _ScreenOtpState extends State<ScreenOtp> {
  final VerifyOtpBloc sendOtpBloc = getIt<VerifyOtpBloc>();

  OtpFieldController controller = OtpFieldController();
  String otpPin = '';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyOtpBloc, VerifyOtpState>(
      bloc: sendOtpBloc,
      listenWhen: (prev, current) => (current is VerifyOtpActionState),
      buildWhen: (prev, current) => (current is! VerifyOtpActionState),
      listener: (ctx, state) {
        log('Verify otp is listening');

        if (state is VerifyOtpInitial) {}
        if (state is VerifyOtpErrorSnackBarState) {
          Utils.errorToast(ctx, 'Something went wrong');
        }

        if (state is VerifyOtpNavigateToRegisterState) {
          Utils.successToast(ctx, 'OTP verified successfully!');

          // ctx.router.push(RouteUserSelection(phoneNumber: widget.phoneNumber));
        }
        if (state is VerifyOtpNavigateToBusinessHomeState) {
          Utils.successToast(ctx, 'OTP verified successfully!');

          ctx.router.replaceAll([RouteBusinessHome()]);
        }
      },
      builder: (context, state) {
        return Scaffold(
           appBar: AppBar(
            backgroundColor: AppColors.white,
          ),
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  72.verticalSpace,
                  Image.asset(
                    AppAssets.logo,
                    width: 40.w,
                    height: 40.w,
                  ),
                  12.verticalSpace,
                  Text(
                    'Sign Up',
                    style: AppStyles.heading,
                  ),
                  57.verticalSpace,
                  Text(
                    '4 digit OTP has been sent to ${widget.phoneNumber}',
                    style: AppStyles.subHeading14,
                  ),
                  61.verticalSpace,
                  OTPTextField(
                    controller: controller,
                    length: 4,
                    width: 220.w,
                    fieldWidth: 46.w,
                    style: AppStyles.formTextStyle.copyWith(height: 2.5),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.box,
                    onChanged: (pin) {},
                    onCompleted: (pin) {
                      otpPin = pin;
                    },
                  ),
                  48.verticalSpace,
                  AppPrimaryButton(
                    isDisabled: (state is VerifyOtpLoadingState),
                    onTap: () {
                      if (widget.authType.toLowerCase() == 'signup' &&
                          otpPin.length == 4) {
                        // context.router.push(const RouteUserSelection());
                        log('signup pressed');
                        sendOtpBloc.add(VerifyOtpButtonClickEventSignUp(
                            otp: otpPin, phone: widget.phoneNumber));
                      } else if (widget.authType.toLowerCase() == 'login' &&
                          otpPin.length == 4) {
                        log('login pressed');

                        sendOtpBloc.add(VerifyOtpButtonClickEventLogin(
                            otp: otpPin, phone: widget.phoneNumber));
                      }
                    },
                    label: 'Verify OTP',
                  ),
                  33.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't receive OTP?",
                        style: GoogleFonts.robotoFlex(
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColorT2,
                          fontSize: 16.sp,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Resend',
                          style: AppStyles.textButtonStyle.copyWith(
                            color: AppColors.primaryP1,
                          ),
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
