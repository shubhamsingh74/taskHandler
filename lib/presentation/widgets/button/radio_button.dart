import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/styles/app_styles.dart';

class AppRadioButton extends StatelessWidget {
  const AppRadioButton({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
    required this.groupValue,
    required this.radioColor,
  });
  final String value;
  final void Function(String?)? onChanged;
  final String title;
  final String groupValue;
  final Color radioColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      // crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Radio(
            fillColor: MaterialStateColor.resolveWith(
              (states) => radioColor
            ),
            value: value,
            groupValue: groupValue,
            onChanged: onChanged),
        Text(
          title,
          style: AppStyles.inter14500T5,
        ),
      ],
    );
  }
}
