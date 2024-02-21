import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/styles/app_styles.dart';

class AppItemCountCircleWidget extends StatelessWidget {
  const AppItemCountCircleWidget({super.key, required this.count, this.radius});

  final int count;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius ?? 8.r,
      child: Center(
        child: Text(
          '+$count',
          style: AppStyles.subHeading12.copyWith(
            fontSize: 8.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
