import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';

class AuthCategoryListTile extends StatelessWidget {
  const AuthCategoryListTile(
      {super.key,
      required this.checked,
      required this.title,
      required this.onChanged});

  final bool checked;
  final String title;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 53.h,
        child: ListTile(
          leading: Text(
            title,
            style: AppStyles.tileLeading,
          ),
          trailing: Checkbox(
            checkColor: Colors.white,
            activeColor: AppColors.oldPrimaryP1,
            side: const BorderSide(
              color: AppColors.textColorT3,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.r)),
            value: checked,
            onChanged: onChanged,
          ),
        ));
  }
}
