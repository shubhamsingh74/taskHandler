import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar(
      {super.key,
      this.title,
      this.defaultLeading = true,
      this.leading,
      this.context,
      this.actions});

  final String? title;
  final bool defaultLeading;

  final Widget? leading;

  final BuildContext? context;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      title: Text(
        title ?? 'Title',
        style: AppStyles.appBarTitle.copyWith(color: AppColors.textColorT4),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(1.sw, 56.h);
}
