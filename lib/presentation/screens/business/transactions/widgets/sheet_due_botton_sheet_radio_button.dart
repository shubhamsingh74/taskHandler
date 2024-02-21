import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/styles/app_styles.dart';

class SheetDueDateBottomSheetRadioButton extends StatelessWidget {
  SheetDueDateBottomSheetRadioButton({
    super.key,
    required this.groupValue,
    required this.title,
    required this.onChanged,
    required this.value,
  });
  String? title;
  String? value;
  String groupValue;
  void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.w),
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          left: BorderSide(color: AppColors.textFieldBorder),
          top: BorderSide(color: AppColors.textFieldBorder),
          right: BorderSide(color: AppColors.textFieldBorder),
          bottom: BorderSide(width: 1, color: AppColors.textFieldBorder),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title ?? "N/A", style: AppStyles.inter14400T6),
          Radio<String?>(
              value: value, groupValue: groupValue, onChanged: onChanged)
        ],
      ),
    );
  }
}