// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/colors/app_colors.dart';

class ShadowContainerForTiles extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const ShadowContainerForTiles({
    Key? key,
    required this.child,
    this.height,
    this.width,
    this.padding,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),
      margin: margin,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          left: BorderSide(color: AppColors.supportUI6),
          top: BorderSide(color: AppColors.supportUI6),
          right: BorderSide(color: AppColors.supportUI6),
          bottom: BorderSide(width: 1, color: AppColors.supportUI6),
        ),
      ),
      child: child,
    );
  }
}
