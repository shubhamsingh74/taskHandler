import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';

class NormalTextField<T> extends StatefulWidget {
  final String? hintText;
  final Function()? onSuffixTap;
  final TextEditingController? controller;
  final Function(String)? textSubmitted;
  final Widget? suffix;
  final Widget? prefix;
  final Function()? onPrefixTap;
  final bool clearOnSubmit;
  final bool enabled;
  final String? label;
  final TextInputType? inputType;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? style;
  final Function(String)? onChanged;

  final int? maxLength;
  final double? cursorHeight;
  final Color? labelColor;
  final Color? borderColor;
  // final Color? fillColor;
  final bool? isFilled;

  const NormalTextField({
    super.key,
    this.hintText,
    this.onSuffixTap,
    this.controller,
    this.textSubmitted,
    this.suffix,
    this.clearOnSubmit = false,
    this.enabled = true,
    this.label,
    this.inputType,
    this.validator,
    this.inputFormatters,
    this.maxLength,
    this.style,
    this.onChanged,
    this.onTap,
    this.prefix,
    this.onPrefixTap,
    this.cursorHeight,
    this.labelColor,
    this.borderColor,
    this.isFilled,
    // this.fillColor,
  });

  @override
  State<NormalTextField> createState() => _NormalTextFieldState();
}

class _NormalTextFieldState extends State<NormalTextField> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: widget.onTap,
      child: SizedBox(
        height: 70.h,
        child: TextFormField(
          keyboardType: widget.inputType,
          cursorHeight: widget.cursorHeight,
          maxLength: widget.maxLength,
          controller: widget.controller,
          style: widget.style ??
              AppStyles.formTextStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
          validator: widget.validator,
          inputFormatters: widget.inputFormatters,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            fillColor: widget.isFilled ?? false
                ? AppColors.textFieldFilledColor
                : Colors.white,
            // fillColor: widget.fillColor ?? Colors.white,
            filled: widget.isFilled ?? false,
            hintText: widget.hintText,
            counter: const SizedBox.shrink(),

            border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: widget.borderColor ?? AppColors.borderColorTextField,
                ),
                borderRadius: BorderRadius.circular(8.r)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: widget.borderColor ?? AppColors.borderColorTextField,
                ),
                borderRadius: BorderRadius.circular(8.r)),
            // border: baseBorder,
            // enabledBorder: baseBorder,
            // focusedBorder: enabledBorder,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: widget.labelColor ?? AppColors.primaryP1,
                  // color: AppColors.primaryP1,
                ),
                borderRadius: BorderRadius.circular(8.r)),
            enabled: widget.enabled,
            labelText: widget.label,
            labelStyle: AppStyles.detailsTextFieldHint.copyWith(
                fontSize: 14.sp,
                color: AppColors.itemtextfieldColorText,
                fontWeight: FontWeight.w400),
            hintStyle: const TextStyle(
                color: AppColors.itemtextfieldColorText,
                fontSize: 14,
                fontWeight: FontWeight.w400),
            floatingLabelStyle: AppStyles.inter12400T2.copyWith(
              // color: Colors.purple,
              color: widget.labelColor ?? AppColors.primaryP1,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
            suffixIcon:
                (widget.suffix != null && widget.suffix.toString().isNotEmpty)
                    ? InkWell(onTap: widget.onSuffixTap, child: widget.suffix!)
                    : null,
            prefixIcon:
                (widget.prefix != null && widget.prefix.toString().isNotEmpty)
                    ? InkWell(onTap: widget.onPrefixTap, child: widget.prefix!)
                    : null,
          ),
        ),
      ),
    );
  }

  // OutlineInputBorder baseBorder = OutlineInputBorder(
  //     borderSide: const BorderSide(
  //       width: 1,
  //       color: AppColors.borderColorTextField,
  //     ),
  //     borderRadius: BorderRadius.circular(8.r));

  // OutlineInputBorder enabledBorder = OutlineInputBorder(
  //     borderSide: BorderSide(
  //       width: 1,
  //       color: widget.labelColor ?? Colors.pink,
  //       // color: AppColors.primaryP1,
  //     ),
  //     borderRadius: BorderRadius.circular(8.r));
}





class NormalTextFieldPurchase<T> extends StatefulWidget {
  final String? hintText;
  final Function()? onSuffixTap;
  final TextEditingController? controller;
  final Function(String)? textSubmitted;
  final Widget? suffix;
  final Widget? prefix;
  final Function()? onPrefixTap;
  final bool clearOnSubmit;
  final bool enabled;
  final String? label;
  final TextInputType? inputType;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? style;
  final Function(String)? onChanged;

  final int? maxLength;
  final double? cursorHeight;
  final Color? labelColor;
  final Color? borderColor;
  // final Color? fillColor;
  final bool? isFilled;

  const NormalTextFieldPurchase({
    super.key,
    this.hintText,
    this.onSuffixTap,
    this.controller,
    this.textSubmitted,
    this.suffix,
    this.clearOnSubmit = false,
    this.enabled = true,
    this.label,
    this.inputType,
    this.validator,
    this.inputFormatters,
    this.maxLength,
    this.style,
    this.onChanged,
    this.onTap,
    this.prefix,
    this.onPrefixTap,
    this.cursorHeight,
    this.labelColor,
    this.borderColor,
    this.isFilled,
    // this.fillColor,
  });

  @override
  _NormalTextFieldPurchaseState createState() => _NormalTextFieldPurchaseState();
}

class _NormalTextFieldPurchaseState extends State<NormalTextFieldPurchase> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: widget.onTap,
      child: SizedBox(
        height: 65,
        child: TextFormField(
          keyboardType: widget.inputType,
          cursorHeight: widget.cursorHeight,
          maxLength: widget.maxLength,
          controller: widget.controller,
          style: widget.style ??
              AppStyles.formTextStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
          validator: widget.validator,
          inputFormatters: widget.inputFormatters,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            fillColor: Colors.white,
            // fillColor: widget.fillColor ?? Colors.white,
            filled: widget.isFilled ?? false,
            hintText: widget.hintText,
            counter: const SizedBox.shrink(),

            border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: widget.borderColor ?? AppColors.borderColorTextField,
                ),
                borderRadius: BorderRadius.circular(8.r)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: widget.borderColor ?? AppColors.borderColorTextField,
                ),
                borderRadius: BorderRadius.circular(8.r)),
            // border: baseBorder,
            // enabledBorder: baseBorder,
            // focusedBorder: enabledBorder,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: widget.labelColor ?? AppColors.primaryP1,
                  // color: AppColors.primaryP1,
                ),
                borderRadius: BorderRadius.circular(8.r)),
            enabled: widget.enabled,
            labelText: widget.label,
            labelStyle: AppStyles.detailsTextFieldHint.copyWith(
                fontSize: 12.sp,
                color: AppColors.itemtextfieldColorText,
                fontWeight: FontWeight.w400),
            hintStyle: const TextStyle(
                color: AppColors.itemtextfieldColorText,
                fontSize: 14,
                fontWeight: FontWeight.w400),
            floatingLabelStyle: AppStyles.inter12400T2.copyWith(
              // color: Colors.purple,
              color: widget.labelColor ?? AppColors.primaryP1,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
            suffixIcon:
            (widget.suffix != null && widget.suffix.toString().isNotEmpty)
                ? InkWell(onTap: widget.onSuffixTap, child: widget.suffix!)
                : null,
            prefixIcon:
            (widget.prefix != null && widget.prefix.toString().isNotEmpty)
                ? InkWell(onTap: widget.onPrefixTap, child: widget.prefix!)
                : null,
          ),
        ),
      ),
    );
  }

// OutlineInputBorder baseBorder = OutlineInputBorder(
//     borderSide: const BorderSide(
//       width: 1,
//       color: AppColors.borderColorTextField,
//     ),
//     borderRadius: BorderRadius.circular(8.r));

// OutlineInputBorder enabledBorder = OutlineInputBorder(
//     borderSide: BorderSide(
//       width: 1,
//       color: widget.labelColor ?? Colors.pink,
//       // color: AppColors.primaryP1,
//     ),
//     borderRadius: BorderRadius.circular(8.r));
}