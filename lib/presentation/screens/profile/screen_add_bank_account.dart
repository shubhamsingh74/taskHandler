// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/presentation/widgets/back_icon_and_title/back_icon_and_title.dart';
import 'package:quickprism/presentation/widgets/button/bottom_navigation_bar.dart';

import '../../../core/styles/app_styles.dart';

@RoutePage()
class ScreenAddBankAccount extends StatelessWidget {
  const ScreenAddBankAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
       appBar: AppBar(
          title: Text(
            "Add Bank Account",
            style: AppStyles.appBar,
          ),
          backgroundColor: AppColors.white,
        ),
      bottomNavigationBar: ButtonBottomNavigationBar(
        title: "Save",
        isActive: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
          
            Icon(
              Icons.shield_moon_outlined,
              size: 60.sp,
            ),
            16.h.verticalSpace,
            Text(
              'Add Bank Account',
              style: TextStyle(
                color: Color(0xFF3D3D3D),
                fontSize: 22,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
