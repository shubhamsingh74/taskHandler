// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/styles/app_styles.dart';

class CommonPrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final bool isActive;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool ? isLoading ;
  // final
  const CommonPrimaryButton(
      {Key? key,
      required this.title,
      this.onTap,
      this.isActive = true,
      this.height,
      this.width,
      this.padding,
      this.margin, this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: isActive ? onTap : null,
      child: Material(
        elevation: 10,
        shadowColor: Colors.blue.withOpacity(0.6),
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          height: height ?? 55.h,
          width: width ?? double.maxFinite,
          padding: padding ?? EdgeInsets.zero,
          margin: margin ?? EdgeInsets.zero,
          alignment: Alignment.center,
          decoration: ShapeDecoration(
            gradient: isActive
                ? const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xff125D99), Color(0xff1276C6)])
                : LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                        const Color(0xff125D99).withOpacity(0.7),
                        const Color(0xff1276C6).withOpacity(0.6),
                      ]),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: isLoading! ? const CircularProgressIndicator() : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: AppStyles.inter18700T4),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 25.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
