// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/styles/app_styles.dart';

class ButtonBottomNavigationBar extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final bool isActive;
  final double? height;
  final double? width;
  const ButtonBottomNavigationBar({
    Key? key,
    required this.title,
    this.onTap,
    this.isActive = true,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 50.h,
        width: width,
        // padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        // margin: EdgeInsets.symmetric(horizontal: 16.w).copyWith(bottom: 30.h),
        decoration: ShapeDecoration(
          color: isActive
              ? AppColors.primaryP1Teal
              : AppColors.primaryP1Teal.withOpacity(0.5),
          // color: AppColors.primaryP2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        ),
        child: Center(
          child: Text(title, style: AppStyles.inter18500T4),
        ),
      ),
    );
  }
}
