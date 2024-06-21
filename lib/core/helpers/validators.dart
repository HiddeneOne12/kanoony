String? errorMsg = '';
String? errorMsg2 = '';

class TextFieldValidator {
  static String? validateText(String? value) {
    errorMsg = 'Field Empty';
    errorMsg2 = 'Maximum 64 characters allowed';
    if (value!.isEmpty) {
      return errorMsg;
    }
    if (value.length >= 62) {
      return errorMsg2;
    }
    return null;
  }

  static String? validatePhone(String? value) {
    errorMsg = 'Field Empty';
    errorMsg2 = 'Maximum 15 characters allowed';
    if (value!.isEmpty) {
      return errorMsg;
    }
    if (value.length > 15) {
      return errorMsg2;
    }
    return null;
  }

  static String? validateEmail(String? value) {
    errorMsg2 = 'Enter Valid Email';
    errorMsg = 'Field Empty';

    if (value!.isEmpty) {
      return errorMsg;
    } /*

    if (value!.isEmpty) {
      return null;
    } */

    else {
      final emailValidate = RegExp(
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
          .hasMatch(value);

      if (!emailValidate) {
        return errorMsg2;
      } else {
        return null;
      }
    }
  }

  static String? validatePassword(String? value) {
    var errorMsg = 'Password is required';
    var invalidMsg =
        'Passwords must be at least 8 characters and must contain at least one uppercase letter, one lowercase letter, and one number.';
    final regExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');

    if (value == null || value.isEmpty) {
      return errorMsg;
    }
    return !regExp.hasMatch(value) ? invalidMsg : null;
  }

  static String? validateConfirmPassword(String? value, String? confirmValue) {
    var errorMsg = 'Password is required';
    var invalidMsg =
        'Passwords must be at least 8 characters and must contain at least one uppercase letter, one lowercase letter, and one number.';
    var invalidConfirmMsg = 'Passwords don\'t match';
    final regExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');

    if (value == null || value.isEmpty) {
      return errorMsg;
    }

    if (confirmValue == null || confirmValue.isEmpty) {
      return 'Confirm password is required';
    }

    if (!regExp.hasMatch(value)) {
      return invalidMsg;
    }

    if (value != confirmValue) {
      return invalidConfirmMsg;
    }

    return null;
  }
}
