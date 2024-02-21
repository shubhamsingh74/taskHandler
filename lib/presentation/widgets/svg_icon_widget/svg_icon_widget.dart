import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickprism/core/colors/app_colors.dart';

class AppSvgIconWidget extends StatelessWidget {
  const AppSvgIconWidget({
    super.key,
    required this.iconPath,
    this.color = AppColors.textColorT1,
    this.size,
    this.label,
    this.type = AppSvgIconWidgetType.listTileIcon,
    this.onTap,
  });

  final String iconPath;
  final Color color;
  final double? size;
  final String? label;
  final AppSvgIconWidgetType type;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    double iconSize = 0.0;
    double outerWidth = 0.0;

    switch (type) {
      case AppSvgIconWidgetType.listTileIcon:
        outerWidth = iconSize = 16.w;

      case AppSvgIconWidgetType.appBarIcon:
        iconSize = 24.w;
        outerWidth = (size ?? iconSize) + 4.w;

      case AppSvgIconWidgetType.actionIcon:
        iconSize = 24.w;
        outerWidth = (size ?? iconSize) + 4.w;
    }

    return Container(
      width: outerWidth,
      height: outerWidth,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(50.r),
        // radius: 12.w,

        onTap: onTap,
        child: Center(
          child: SvgPicture.asset(
            iconPath,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            semanticsLabel: label,
            width: size ?? iconSize,
            height: size ?? iconSize,
          ),
        ),
      ),
    );
  }
}

enum AppSvgIconWidgetType {
  listTileIcon,
  appBarIcon,
  actionIcon,
}
