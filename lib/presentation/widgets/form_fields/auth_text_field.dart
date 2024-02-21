import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    super.key,
    this.maxLength,
    this.keyboardType,
    this.inputFormatters,
    this.prefixText,
    this.style,
    this.autoFocus = false,
    this.controller,
    this.onChanged,
    this.validator,
    this.hintText,
  });
  final bool autoFocus;
  final int? maxLength;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? prefixText;
  final TextStyle? style;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? hintText;
  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: widget.autoFocus,
      style: widget.style ?? AppStyles.formTextStyle,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      inputFormatters: widget.inputFormatters,
      controller: widget.controller,
      onChanged: widget.onChanged,
      validator: widget.validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffDDE3E9),
        hintText: widget.hintText,
        hintStyle: AppStyles.labelStyle,
        labelStyle: AppStyles.labelStyle,
        prefixText: widget.prefixText,
        prefixStyle: widget.style,
        counterText: '',
        border: baseBorder,
        enabledBorder: baseBorder,
        focusedBorder: baseBorder,
      ),
    );
  }

  OutlineInputBorder baseBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide: const BorderSide(
      width: 1,
      color: AppColors.borderColorTextField,
    ),
  );
}
