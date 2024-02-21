import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';

class AutoFillTextField<T> extends StatefulWidget {
  final String? hintText;
  final List<String> suggestions;
  final Function()? onSuffixTap;
  final TextEditingController controller;
  final Function(String)? textSubmitted;
  final Widget? suffix;
  final bool clearOnSubmit;
  final bool enabled;
  final String? label;
  final TextInputType? inputType;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const AutoFillTextField({
    super.key,
    this.hintText,
    required this.suggestions,
    this.onSuffixTap,
    required this.controller,
    this.textSubmitted,
    this.suffix,
    this.clearOnSubmit = false,
    this.enabled = true,
    this.label,
    this.inputType,
    this.validator,
    this.inputFormatters,
  });

  @override
  State<AutoFillTextField> createState() => _AutoFillTextFieldState();
}

class _AutoFillTextFieldState extends State<AutoFillTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 50.h,
      child: TypeAheadField<String>(
        hideKeyboardOnDrag: true,
        controller: widget.controller,
        suggestionsCallback: (search) => widget.suggestions
            .where((element) =>
                element.toLowerCase().contains(search.toLowerCase()))
            .toList(),
        builder: (context, controller, focusNode) {
          return TextFormField(
            controller: controller,
            focusNode: focusNode,
            style: AppStyles.formTextStyle.copyWith(fontSize: 13),
            validator: widget.validator,
            inputFormatters: widget.inputFormatters,
            decoration: InputDecoration(
                border: baseBorder,
                enabledBorder: baseBorder,
                focusedBorder: baseBorder,
                enabled: widget.enabled,
                labelText: widget.label,
                labelStyle: AppStyles.detailsTextFieldHint
                    .copyWith(fontSize: 14, color: AppColors.textColorT2),
                floatingLabelStyle: AppStyles.detailsTextFieldLabel,
                suffixIcon: InkWell(
                  onTap: widget.onSuffixTap,
                  child: widget.suffix ??
                      Icon(
                        Icons.search,
                        color: AppColors.oldPrimaryP2,
                        size: 15.sp,
                      ),
                )),
          );
        },
        itemBuilder: (context, newText) {
          return Container(
            padding: const EdgeInsets.all(8),
            child: Text(newText),
          );
        },
        onSelected: widget.textSubmitted,
      ),
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
