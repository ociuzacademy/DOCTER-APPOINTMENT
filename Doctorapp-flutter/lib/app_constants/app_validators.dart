class Validator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    String pattern = r'\w+@\w+\.\w+';
    if (!RegExp(pattern).hasMatch(value)) {
      return 'Invalid email address format';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Password cannot be empty';
    }
    // if (value.length < 8) {
    //   return 'Password must be at least 8 characters long';
    // }
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*(),.?":{}|<>]).{8,}$';

    if (!RegExp(pattern).hasMatch(value)) {
      return 'Password must be at least 8 characters long and contain at \nleast one uppercase letter, one lowercase letter, \n one number, and one special character.';
    }
    return null;
  }

  static String? validateEmpty(String? value) {
    if (value!.isEmpty) {
      return 'Fill Your Data';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a phone number.';
    }
    final RegExp phoneRegex = RegExp(r'^[0-9]{10}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid 10-digit phone number.';
    }
    return null;
  }

  // Add more validation methods as needed
}
