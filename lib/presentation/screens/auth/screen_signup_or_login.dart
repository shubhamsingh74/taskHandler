import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/infrastructure/routing/app_router.dart';
import 'package:quickprism/presentation/widgets/button/primary_button.dart';

@RoutePage()
class ScreenSignupOrLogin extends StatelessWidget {
  const ScreenSignupOrLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              72.verticalSpace,
              Image.asset(
                AppAssets.logo,
                width: 100.w,
                height: 100.w,
              ),
              5.verticalSpace,
              Text(
                'Welcome to Quickprism',
                style: AppStyles.heading,
              ),
              // Expanded(
              //     child: Container(
              //   color: Colors.amber,
              // )),

              const Spacer(),
              Text(
                "na risus nunc velit in porttitor. Lorem mi\ntempus mattis eu dictumst. D",
                style: AppStyles.subHeading18,
                textAlign: TextAlign.center,
              ),

              const Spacer(
                flex: 2,
              ),
              Text(
                "Sign up now and grow your business",
                style: AppStyles.subHeading16Blue,
                textAlign: TextAlign.center,
              ),
              14.verticalSpace,
              Text(
                "Sign up now and grow your business",
                style: AppStyles.subHeading14,
                textAlign: TextAlign.center,
              ),
              4.verticalSpace,
              Text(
                "Sign up now and grow your business",
                style: AppStyles.subHeading12,
                textAlign: TextAlign.center,
              ),
              const Spacer(
                flex: 2,
              ),
              AppPrimaryButton(
                  label: 'Sign Up',
                  color: Colors.red,
                  onTap: () {
                    context.router.replace(RouteSignUp(authType: 'login'));
                  }),
              8.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Already registered?',
                    style: GoogleFonts.robotoFlex(
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColorT2,
                      fontSize: 16.sp,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.router.push(RouteSignUp(authType: 'login'));
                    },
                    child: Text(
                      'Log In',
                      style: AppStyles.textButtonStyle,
                    ),
                  )
                ],
              ),
              60.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
