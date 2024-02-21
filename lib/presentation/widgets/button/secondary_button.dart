import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';

class AppSecondaryButton extends StatefulWidget {
  const AppSecondaryButton(
      {super.key, required this.label, this.icon, this.onPressed});
  final String label;
  final Widget? icon;
  final void Function()? onPressed;
  @override
  State<AppSecondaryButton> createState() => _AppSecondaryButtonState();
}

class _AppSecondaryButtonState extends State<AppSecondaryButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.oldPrimaryP1,
          foregroundColor: AppColors.supportUI8,
        ),
        onPressed: widget.onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.icon ?? 1.verticalSpace,
            widget.icon != null ? 4.horizontalSpace : 1.verticalSpace,
            Text(
              widget.label,
              style: AppStyles.inter18500T4.copyWith(fontSize: 12.sp),
            ),
          ],
        ));
  }
}
