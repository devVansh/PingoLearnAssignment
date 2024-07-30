import 'package:pingo_learn_assignment/utils/text_constants.dart';

mixin ValidatorMixin {
  // Name validation
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return TextConstants.emptyName;
    } else if (value.length < 3) {
      return TextConstants.minNameLength;
    }
    return null;
  }

  // Email validation
  String? validateEmail(String? value) {
    final regex = RegExp(TextConstants.emailRegex);
    if (value == null || value.isEmpty) {
      return TextConstants.emptyEmail;
    } else if (!regex.hasMatch(value)) {
      return TextConstants.invalidEmail;
    }
    return null;
  }

  // Password validation
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return TextConstants.emptyPassword;
    } else if (value.length < 8 || value.length > 15) {
      return TextConstants.minPassword;
    } else if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
      return TextConstants.minOneCapitalLetter;
    } else if (!RegExp(r'(?=.*\d)').hasMatch(value)) {
      return TextConstants.minOneNumber;
    } else if (!RegExp(r'(?=.*[@$!%*?&])').hasMatch(value)) {
      return TextConstants.minOneSpecialCharacter;
    }
    return null;
  }
}
