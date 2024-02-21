// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';

class AppPrimaryButton extends StatefulWidget {
  const AppPrimaryButton({
    super.key,
    this.size,
    this.color,
    this.label,
    this.onTap,
    this.isDisabled = false,
  });
  final Size? size;
  final String? label;
  final Color? color;
  final Function()? onTap;
  final bool isDisabled;
  @override
  State<AppPrimaryButton> createState() => _AppPrimaryButtonState();
}

class _AppPrimaryButtonState extends State<AppPrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
        alignment: Alignment.center,
        fixedSize: widget.size ?? Size(328.w, 48.h),
        elevation: 0,
        backgroundColor: AppColors.primaryP1Teal,
        foregroundColor: AppColors.textColorT4,
        disabledBackgroundColor: AppColors.supportSP3,
        disabledForegroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: widget.isDisabled ? null : widget.onTap,
      child: Text(
        widget.label ?? 'Click Here',
        style: AppStyles.inter18500T4,
      ),
    );
  }
}

class AppPrimaryButtonNew extends StatefulWidget {
  final Function() onTap;
  final String title;
  final bool? isLoading;
  const AppPrimaryButtonNew({
    Key? key,
    required this.onTap,
    required this.title,
    this.isLoading = false,
  }) : super(key: key);

  @override
  State<AppPrimaryButtonNew> createState() => _AppPrimaryButtonNewState();
}

class _AppPrimaryButtonNewState extends State<AppPrimaryButtonNew> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: widget.onTap,
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(8),
        shadowColor: const Color(0xff5E3A68),
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffC18ABD), width: 1.5),
              borderRadius: BorderRadius.circular(8),
              gradient: const LinearGradient(colors: [
                Color(0xff87C1F5),
                Color(0xffB26AC6),
              ])),
          child: widget.isLoading!
              ? const CircularProgressIndicator()
              : Text(
                  widget.title,
                  style: AppStyles.buttonColor,
                ),
        ),
      ),
    );
  }
}
