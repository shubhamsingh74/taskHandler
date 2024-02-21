// ignore_for_file: prefer_const_constructors

import 'package:auto_route/auto_route.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/presentation/widgets/attendance_dropdown/attendance_dropdown.dart';
import 'package:quickprism/presentation/widgets/button/bottom_navigation_bar.dart';
import 'package:quickprism/presentation/widgets/form_fields/normal_text_field.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/styles/app_styles.dart';
import '../../widgets/back_icon_and_title/back_icon_and_title.dart';

@RoutePage()
class ScreenPaymentStaffMember extends StatelessWidget {
  const ScreenPaymentStaffMember({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "title",
          style: AppStyles.appBar,
        ),
        actions: [
          Text(
            'QPID:1234',
            style: AppStyles.inter50016.copyWith(
              fontSize: 18.sp,
            ),
          ),
        ],
        backgroundColor: AppColors.white,
      ),
      bottomNavigationBar: ButtonBottomNavigationBar(title: "Save"),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              color: AppColors.white,
              child: Column(
                children: [
                  // 20.h.verticalSpace,
                  NormalTextField(),
                  10.h.verticalSpace,
                  NormalTextField(),
                  10.h.verticalSpace,
                  AttendanceDropDown(
                      list: ["list"], controller: DropdownController()),
                  10.h.verticalSpace,
                  PaymentMode(),
                  //
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMode extends StatelessWidget {
  final bool? isCash;
  const PaymentMode({
    super.key,
    this.isCash = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Payment mode',
          style: TextStyle(
            color: Color(0xFF353535),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),

        // =============
        Spacer(),
        //==============

        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: ShapeDecoration(
            color: Color(0xFF0689FF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: Text(
            'Cash',
            style: AppStyles.tileLeading.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        //
        10.w.horizontalSpace,
        //
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFFE1E1E1)),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: Text(
            'Online',
            style: AppStyles.tileLeading,
          ),
        )
      ],
    );
  }
}
