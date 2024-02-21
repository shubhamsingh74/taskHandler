import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';



///--------flow primary button
customCommonPrimaryButton(
    {required VoidCallback onTap, required String title}) {
  return InkWell(
    splashFactory: NoSplash.splashFactory,
    onTap: onTap,
    child: Material(
      elevation: 10,
      shadowColor: Colors.blue.withOpacity(0.6),
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 30.w),
        decoration: BoxDecoration(
          color: AppColors.newThemePrimaryColor,
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xff125D99),
                Color(0xff1276C6),
              ]),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppStyles.inter70016FFFFFF,
            ),
            Image.asset(
              AppAssets.imageRightArrow,
              height: 16,
              width: 15,
              fit: BoxFit.fill,
            )
          ],
        ),
      ),
    ),
  );
}