import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/colors/app_colors.dart';

class AppRoundActionButtonWidget extends StatelessWidget {
  const AppRoundActionButtonWidget(
      {super.key,
      this.bgColor,
      this.iconColor,
      this.radius,
      this.iconData,
      required this.onTap});

  final Color? bgColor;
  final Color? iconColor;
  final double? radius;
  final Function()? onTap;
  final IconData? iconData;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: bgColor ?? AppColors.supportSP1,
        radius: radius ?? 14.w,
        child: Icon(
          iconData ?? Icons.close,
          color: iconColor ?? AppColors.textColorRed,
          size: 15.sp,
        ),
      ),
    );
  }
}
