import 'package:flutter/material.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';

class RemarksTextField extends StatefulWidget {
  const RemarksTextField({super.key, required this.controller, this.validator});

  final TextEditingController controller;
  final String? Function(String?)? validator;
  @override
  State<RemarksTextField> createState() => _RemarksTextFieldState();
}

class _RemarksTextFieldState extends State<RemarksTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppStyles.subHeading14.copyWith(color: AppColors.textColorT1),
      maxLines: 5,
      controller: widget.controller,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: AppColors.borderColorTextField,
        )),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: AppColors.borderColorTextField,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: AppColors.borderColorTextField,
        )),
      ),
      validator: widget.validator,
    );
  }
}
