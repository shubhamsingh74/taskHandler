import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/colors/app_colors.dart';

class AppPrimaryFloatingButton extends StatelessWidget {
  const AppPrimaryFloatingButton(
      {super.key, required this.onTap, this.icon, this.toolTip, this.heroTag});
  final void Function()? onTap;
  final Icon? icon;
  final String? toolTip;
  final Object? heroTag;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        heroTag: heroTag,
        tooltip: toolTip,
        backgroundColor: const Color(0xff1DB4C9),
        foregroundColor: AppColors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r)),
        onPressed: onTap,
        child: icon ??
            const Icon(
              Icons.add,
            ));
  }
}
