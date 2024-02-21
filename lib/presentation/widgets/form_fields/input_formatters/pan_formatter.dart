import 'package:flutter/services.dart';

class PanFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final regExp = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]$'); // Custom pattern regex

    if (regExp.hasMatch(newValue.text.toUpperCase())) {
      // If the entered text matches the specified pattern, maintain the value
      return newValue;
    } else {
      // If the entered text doesn't match the pattern, keep the previous value
      return oldValue;
    }
  }
}
