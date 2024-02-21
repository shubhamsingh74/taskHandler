import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickprism/application/auth/send_otp/send_otp_bloc.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/core/utils/utils.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/infrastructure/routing/app_router.dart';
import 'package:quickprism/presentation/widgets/button/primary_button.dart';
import 'package:quickprism/presentation/widgets/form_fields/auth_text_field.dart';

final GlobalKey<FormState> sendOtpFormKey = GlobalKey<FormState>();

@RoutePage()
class ScreenSignUpNew extends StatefulWidget {
  final String authType;

  const ScreenSignUpNew({super.key, required this.authType});

  @override
  State<ScreenSignUpNew> createState() => _ScreenSignUpNewState();
}

class _ScreenSignUpNewState extends State<ScreenSignUpNew> {
  final SendOtpBloc sendOtpBloc = getIt<SendOtpBloc>();
  final TextEditingController controller = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendOtpBloc, SendOtpState>(
        bloc: sendOtpBloc,
        listenWhen: (prev, current) => (current is SendOtpActionState),
        buildWhen: (prev, current) => (current is! SendOtpActionState),
        listener: (ctx, state) {
          if (state is SendOtpErrorSnackBarState) {
            isLoading = false;
            Utils.errorToast(ctx, state.error);
          }

          if (state is SendOtpNavigateToVerifyState) {
            Utils.successToast(ctx, 'OTP sent successfully!');

            ctx.router.push(RouteOtpNew(
                authType: widget.authType, phoneNumber: controller.text));
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(
                      AppAssets.iconsNewBack,
                      height: 1.sh,
                      width: 1.sw,
                      fit: BoxFit.fill,
                    ),
                    Container(
                      width: double.infinity,
                      height: 0.58.sh,
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
                      0.30.sh.verticalSpace,
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
                                controller: controller,
                                autoFocus: true,
                                style: AppStyles.labelStyle,
                                keyboardType: TextInputType.number,
                                maxLength: 10,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                // prefixText: '+91 ',
                                hintText: "Enter Your Mobile Number",
                                validator: phoneNumberValidate,
                              ),
                              15.verticalSpace,
                              AppPrimaryButtonNew(
                                onTap: () {
                                  if (state is SendOtpLoadingState) {
                                    return;
                                  } else {
                                    final FormState? form =
                                        sendOtpFormKey.currentState;
                                    if (form != null && form.validate()) {
                                      sendOtpBloc.add(SendOtpButtonClickEvent(
                                          phone: controller.text));
                                    }
                                  }
                                },
                                title: 'Send OTP',
                              ),
                              // AppPrimaryButton(
                              //   color: controller.text.length==10 ? AppColors.oldPrimaryP1:AppColors.oldPrimaryP1.withOpacity(0.5),
                              //   isDisabled: (state is SendOtpLoadingState),
                              //   onTap: () {
                              //     final FormState? form = sendOtpFormKey.currentState;
                              //     if (form != null && form.validate()) {
                              //       sendOtpBloc.add(SendOtpButtonClickEvent(
                              //           phone: controller.text));
                              //     }
                              //   },
                              //   label: 'Get OTP',
                              // ),
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
