import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';

class AppFloatingActionButton extends StatelessWidget {
  const AppFloatingActionButton(
      {super.key,
      required this.label,
      this.icon,
      required this.onTap,
      this.heroTag});

  final String? label;
  final Widget? icon;
  final Object? heroTag;

  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      //backgroundColor: AppColors.primaryP1,
      backgroundColor: Color(0xff1DB4C9),
      foregroundColor: AppColors.textColorT4,
      heroTag: heroTag,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.r)),
      onPressed: onTap,
      icon: icon,
      label: Text(
        label ?? '',
        style: AppStyles.tileStyleTitle.copyWith(color: AppColors.textColorT4),
      ),
    );
  }
}

class AppFloatingActionButtonEmployee extends StatelessWidget {
  const AppFloatingActionButtonEmployee(
      {super.key,
      required this.label,
      this.icon,
      required this.onTap,
      this.heroTag});

  final String? label;
  final Widget? icon;
  final Object? heroTag;

  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white,width: 2),
        borderRadius: BorderRadius.circular(60.r),
      ),
      child: FloatingActionButton.extended(
        backgroundColor: AppColors.primaryBlue125D99,
        foregroundColor: AppColors.textColorT4,
        heroTag: heroTag,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.r)),
        onPressed: onTap,
        icon: icon,
        label: Text(
          label ?? '',
          style: AppStyles.tileStyleTitle.copyWith(color: AppColors.textColorT4),
        ),
      ),
    );
  }
}
