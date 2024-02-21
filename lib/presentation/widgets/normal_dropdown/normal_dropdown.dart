import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';

class NormalDropDown extends StatelessWidget {
  const NormalDropDown(
      {super.key,
      this.width,
      this.height,
      this.hintText,
      required this.entries,
      this.controller,
      this.onSelected,
      this.enabled = true, this.fillcolor});
  final double? width;
  final double? height;
  final Color? fillcolor;
  final String? hintText;
  final TextEditingController? controller;
  final Function(dynamic)? onSelected;
  final bool enabled;

  final List<DropdownMenuEntry<dynamic>> entries;
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      enabled: enabled,
      controller: controller,
      width: width ?? 1.sw - 50.w,
      hintText: hintText,
      textStyle: AppStyles.formTextStyle.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      menuStyle: MenuStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: const MaterialStatePropertyAll(AppColors.white,)),
       onSelected: onSelected,
      dropdownMenuEntries: entries,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        border: baseBorder,
        fillColor: fillcolor,
        enabledBorder: baseBorder,
        focusedBorder: enabledBorder,
        constraints: BoxConstraints(
            maxHeight: height ?? double.maxFinite,
            maxWidth: width ?? double.maxFinite),
        // constraints: BoxConstraints.tight(Size(double.maxFinite, 50.h)),
        hintStyle: AppStyles.formTextStyle.copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.itemtextfieldColorText,
        ),
      ),
    );
  }
}

OutlineInputBorder baseBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      width: 1,
      color: AppColors.borderColorTextField,
    ),
    borderRadius: BorderRadius.circular(8.r));

OutlineInputBorder enabledBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      width: 1,
      color: AppColors.primaryP1,
    ),
    borderRadius: BorderRadius.circular(8.r));
