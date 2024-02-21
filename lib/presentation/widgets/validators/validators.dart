


class AppValidators {
  

  static String? emptyStringValidator(text) {
    if (text != null && text.isEmpty) {
    
      return 'required field';
    }
    return null;
  }

  static String? phoneNumberValidate(text) {
    if (text != null && text.isEmpty) {
      return 'Enter your phone number';
    } else if (text != null && text.length != 10) {
      return 'Invalid phone number';
    }
    return null;
  }
}