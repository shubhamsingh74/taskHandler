import 'package:flutter/services.dart';

class EmailInputFormatter implements TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Perform email validation
    final regExp = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'); // Basic email regex pattern
    if (regExp.hasMatch(newValue.text)) {
      return newValue;
    } else {
      // If the entered text doesn't match the email pattern, keep the previous value
      return oldValue;
    }
  }
}
