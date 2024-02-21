import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';

class StockInOutField extends StatefulWidget {
  const StockInOutField(
      {super.key,
      required this.heading,
      this.controller,
      this.autoFocus = false,
      this.maxLength,
      this.keyboardType,
      this.inputFormatters,
      this.suffixText,
      this.style,
      this.onChanged,
      this.validator});

  final String heading;
  final TextEditingController? controller;
  final bool autoFocus;
  final int? maxLength;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? suffixText;
  final TextStyle? style;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  State<StockInOutField> createState() => _StockInOutFieldState();
}

class _StockInOutFieldState extends State<StockInOutField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.heading,
          style: AppStyles.detailsTextFieldHead.copyWith(fontSize: 14.sp),
          textAlign: TextAlign.start,
        ),
        1.verticalSpace,
        TextFormField(
          autofocus: widget.autoFocus,
          style: widget.style ??
              AppStyles.subHeading14.copyWith(color: AppColors.textColorT1),
          keyboardType: widget.keyboardType,
          maxLength: widget.maxLength,
          inputFormatters: widget.inputFormatters,
          controller: widget.controller,
          onChanged: widget.onChanged,
          validator: widget.validator,
          decoration: InputDecoration(
            suffixText: widget.suffixText,
            suffixStyle: widget.style,
            counterText: '',
            border: baseBorder,
            enabledBorder: baseBorder,
            focusedBorder: baseBorder,
          ),
        ),
      ],
    );
  }

  UnderlineInputBorder baseBorder = const UnderlineInputBorder(
    // borderRadius: BorderRadius.circular(8.r),
    borderSide: BorderSide(
      width: 1,
      color: AppColors.borderColorTextField,
    ),
  );
}
