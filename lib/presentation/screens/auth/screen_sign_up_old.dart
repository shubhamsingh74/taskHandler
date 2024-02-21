import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickprism/application/auth/send_otp/send_otp_bloc.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/core/utils/utils.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/infrastructure/routing/app_router.dart';
import 'package:quickprism/presentation/widgets/button/primary_button.dart';
import 'package:quickprism/presentation/widgets/form_fields/auth_text_field.dart';

final GlobalKey<FormState> sendOtpFormKey = GlobalKey<FormState>();

@RoutePage()
class ScreenSignUp extends StatefulWidget {
  const ScreenSignUp({super.key, required this.authType});

  final String authType;

  @override
  State<ScreenSignUp> createState() => _ScreenSignUpState();
}

class _ScreenSignUpState extends State<ScreenSignUp> {
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

          ctx.router.push(RouteOtp(
              authType: widget.authType, phoneNumber: controller.text));
        }
      },
      builder: (context, state) {
        return Scaffold(
          // appBar: AppBar(
          //   backgroundColor: AppColors.white,
          // ),
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  90.verticalSpace,
                  Image.asset(
                    AppAssets.logo,
                    width: 50.w,
                    height: 50.w,
                  ),
                  10.verticalSpace,
                  Text(
                    'Sign Up',
                    style: AppStyles.heading,
                  ),
                  90.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Enter phone number',
                        style: AppStyles.textFormHeadingStyle,
                      ),
                    ],
                  ),
                  16.verticalSpace,
                  Form(
                    key: sendOtpFormKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        AuthTextField(
                          key: const Key('numberField'),
                          controller: controller,
                          autoFocus: true,
                          style: AppStyles.formTextStyle,
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          prefixText: '+91 ',
                          // hintText: "+91 999 6758 973",
                          validator: phoneNumberValidate,
                        ),
                        35.verticalSpace,
                        AppPrimaryButton(
                          color: controller.text.length==10 ? AppColors.oldPrimaryP1:AppColors.oldPrimaryP1.withOpacity(0.5),
                          isDisabled: (state is SendOtpLoadingState),
                          onTap: () {
                            final FormState? form = sendOtpFormKey.currentState;
                            if (form != null && form.validate()) {
                              sendOtpBloc.add(SendOtpButtonClickEvent(
                                  phone: controller.text));
                            }
                          },
                          label: 'Get OTP',
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'By signing up, you accept to the',
                            style: GoogleFonts.robotoFlex(
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColorT1,
                              fontSize: 12.sp,
                            ),
                          ),
                          InkWell(
                            splashFactory: NoSplash.splashFactory,
                            onTap: (){

                            },
                            child: Text(
                              ' Terms & Conditions ',
                              style: GoogleFonts.robotoFlex(
                                fontWeight: FontWeight.w500,
                                color: AppColors.oldPrimaryP1,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                          Text(
                            'and',
                            style: GoogleFonts.robotoFlex(
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColorT1,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                     InkWell(
                       splashFactory: NoSplash.splashFactory,
                       onTap: (){

                       },
                       child: Text("Privacy Policy",  style: GoogleFonts.robotoFlex(
                         fontWeight: FontWeight.w500,
                         color: AppColors.oldPrimaryP1,
                         fontSize: 12.sp,
                       ),),
                     )
                    ],
                  ),
                  20.verticalSpace,
                ],
              ),
            ),
          ),
        );
      },
    );
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
