import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:quickprism/application/auth/verify_otp/verify_otp_bloc.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/core/utils/utils.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/infrastructure/routing/app_router.dart';
import 'package:quickprism/presentation/widgets/button/primary_button.dart';
import 'package:quickprism/presentation/widgets/form_fields/auth_text_field.dart';

final GlobalKey<FormState> sendOtpFormKey = GlobalKey<FormState>();

@RoutePage()
class ScreenOtpNew extends StatefulWidget {
  const ScreenOtpNew(
      {super.key, required this.authType, required this.phoneNumber});

  final String authType;
  final String phoneNumber;

  @override
  State<ScreenOtpNew> createState() => _ScreenOtpNewState();
}

class _ScreenOtpNewState extends State<ScreenOtpNew> {
  final VerifyOtpBloc sendOtpBloc = getIt<VerifyOtpBloc>();
  final TextEditingController _phoneNumberController = TextEditingController();
  OtpFieldController controller = OtpFieldController();

  String otpPin = '';

  // bool isLoading = false;

  @override
  void initState() {
    super.initState();
    controller = OtpFieldController();
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyOtpBloc, VerifyOtpState>(
        bloc: sendOtpBloc,
        listenWhen: (prev, current) => (current is VerifyOtpActionState),
        buildWhen: (prev, current) => (current is! VerifyOtpActionState),
        listener: (ctx, state) {
          if (state is VerifyOtpInitial) {}
          if (state is VerifyOtpErrorSnackBarState) {
            Utils.errorToast(ctx, 'Something went wrong');
          }
          if (state is VerifyOtpNavigateToRegisterState) {
            Utils.successToast(ctx, 'OTP verified successfully!');
            ctx.router
                .push(RouteUserSelectionNew(phoneNumber: widget.phoneNumber));
          }
          if (state is VerifyOtpNavigateToBusinessHomeState) {
            Utils.successToast(ctx, 'OTP verified successfully!');

            ///------use for the testing purpose
            ctx.router
                .push(RouteUserSelectionNew(phoneNumber: widget.phoneNumber));
            //this is correct path.
            //  ctx.router.replaceAll([RouteBusinessHome()]);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              alignment: Alignment.topCenter,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(
                      AppAssets.iconsNewOtpBack,
                      height: 0.75.sh,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    Container(
                      width: double.infinity,
                      height: 0.53.sh,
                      decoration: const BoxDecoration(
                          color: Color(0xffFBFBFB),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(58),
                            topRight: Radius.circular(58),
                          )),
                    )
                  ],
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      0.24.sh.verticalSpace,
                      Text(
                        "Welcome to \nQuickPrism",
                        style: AppStyles.welcomeText,
                      ),
                      0.01.sh.verticalSpace,
                      Text(
                        "Lets Get You Logged in!",
                        style: AppStyles.letsGetText,
                      ),
                      0.05.sh.verticalSpace,
                      Form(
                        key: sendOtpFormKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                "Your Mobile Number",
                                style: AppStyles.yourNumber,
                              ),
                              0.007.sh.verticalSpace,
                              AuthTextField(
                                key: const Key('numberField'),
                                controller: _phoneNumberController,
                                style: AppStyles.labelStyle,
                                keyboardType: TextInputType.number,
                                maxLength: 10,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                // prefixText: '+91 ',
                                hintText: widget.phoneNumber,
                                validator: phoneNumberValidate,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "OTP sent successfully!",
                                    style: AppStyles.otpSuccess
                                        .copyWith(fontSize: 15),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Resend OTP in 30',
                                      style: AppStyles.otpText
                                          .copyWith(fontSize: 15),
                                    ),
                                  )
                                ],
                              ),
                              0.01.sh.verticalSpace,
                              Material(
                                elevation: 10,
                                color: const Color(0xffFCFCFC),
                                borderRadius: BorderRadius.circular(20),
                                shadowColor: const Color(0xff5E3A68),
                                //animationDuration: const Duration(seconds: 15),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 35, horizontal: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Enter OTP sent to registered mobile number",
                                        style: AppStyles.otpTextTitle
                                            .copyWith(fontSize: 15),
                                      ),
                                      0.01.sh.verticalSpace,
                                      OTPTextField(
                                        controller: controller,
                                        length: 4,
                                        width: double.infinity,
                                        fieldWidth: 50.w,
                                        style: AppStyles.formTextStyle
                                            .copyWith(height: 2.5),
                                        textFieldAlignment:
                                            MainAxisAlignment.spaceAround,
                                        fieldStyle: FieldStyle.box,
                                        onChanged: (pin) {},
                                        onCompleted: (pin) {
                                          otpPin = pin;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ), 
                     
                              0.04.sh.verticalSpace,
                              AppPrimaryButtonNew(
                                onTap: () {
                                  if (state is VerifyOtpLoadingState) {
                                    return;
                                  } else {
                                    if (widget.authType.toLowerCase() ==
                                            'signup' &&
                                        otpPin.length == 4) {
                                      // context.router.push(const RouteUserSelection());
                                      log('signup pressed');
                                      sendOtpBloc.add(
                                          VerifyOtpButtonClickEventSignUp(
                                              otp: otpPin,
                                              phone: widget.phoneNumber));
                                    } else if (widget.authType.toLowerCase() ==
                                            'login' &&
                                        otpPin.length == 4) {
                                      log('login pressed');
                                      sendOtpBloc.add(
                                          VerifyOtpButtonClickEventLogin(
                                              otp: otpPin,
                                              phone: widget.phoneNumber));
                                    }
                                  }
                                },
                                title: 'Login',
                              ),
                              0.01.sh.verticalSpace,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  String? phoneNumberValidate(text) {
    if (text != null && text.isEmpty) {
      return 'Enter your phone number';
    } else if (text != null && text.length != 10) {
      return 'Invalid phone number';
    }
    return null;
  }
}
