import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';

class AppBarActionButton extends StatelessWidget {
  const AppBarActionButton({super.key, this.icon, this.label, this.onTap});

  final IconData? icon;

  final String? label;

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon ?? Icons.edit,
                color: AppColors.oldPrimaryP1,
                size: 17.w,
              ),
              4.horizontalSpace,
              Text(
                label ?? 'Click',
                style: AppStyles.subHeading14Semi
                    .copyWith(color: AppColors.oldPrimaryP1),
              )
            ],
          ),
        ),
      ),
    );
  }
}
