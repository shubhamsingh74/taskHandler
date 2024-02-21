import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';

class FilledTextField extends StatefulWidget {
  final TextStyle? style;

  final String heading;

  final TextEditingController? controller;
  final Function(String)? onChanged;

  const FilledTextField(
      {super.key,
      this.style,
      required this.heading,
      this.controller,
      this.onChanged});

  @override
  State<FilledTextField> createState() => _FilledTextFieldState();
}

class _FilledTextFieldState extends State<FilledTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.heading,
          style: AppStyles.subHeading12,
          textAlign: TextAlign.start,
        ),
        1.verticalSpace,
        SizedBox(
          height: 30.h,
          child: TextFormField(
              controller: widget.controller,
              onChanged: widget.onChanged,
              style: widget.style ??
                  AppStyles.subHeading14.copyWith(color: AppColors.textColorT1),
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.supportUI6,
                border: baseBorder,
                focusedBorder: baseBorder,
                enabledBorder: baseBorder,
              )),
        ),
      ],
    );
  }

  UnderlineInputBorder baseBorder = const UnderlineInputBorder(
    // borderRadius: BorderRadius.circular(8.r),
    borderSide: BorderSide(
      width: 0.5,
      color: AppColors.supportUI6,
    ),
  );
}
