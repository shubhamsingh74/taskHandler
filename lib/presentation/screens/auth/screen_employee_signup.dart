import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/presentation/widgets/button/primary_button.dart';
import 'package:quickprism/presentation/widgets/form_fields/auth_text_field.dart';

@RoutePage()
class ScreenEmployeeSignup extends StatelessWidget {
  const ScreenEmployeeSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            49.verticalSpace,
            Text(
              'Employee details',
              style: AppStyles.heading,
            ),
            35.verticalSpace,
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('QPID', style: AppStyles.detailsTextFieldHead),
                12.verticalSpace,
                const AuthTextField(),
              ],
            ),
            24.verticalSpace,
            const Spacer(),
            AppPrimaryButton(
              label: 'Next',
              onTap: () {},
            ),
            16.verticalSpace,
          ],
        ),
      )),
    );
  }
}
