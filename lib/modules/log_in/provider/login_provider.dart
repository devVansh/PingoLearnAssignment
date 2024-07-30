import 'package:flutter/material.dart';
import 'package:pingo_learn_assignment/core/firebase_services.dart';
import 'package:pingo_learn_assignment/utils/app_utils.dart';
import 'package:pingo_learn_assignment/utils/text_constants.dart';

class LoginProvider with ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final loginFormKey = GlobalKey<FormState>();

  bool isObscure = true;

  navigateToSignUp() {
    AppUtils.navigateToSignUp();
    clearTextControllers();
  }

  navigateToDashboard() {
    AppUtils.navigateToDashboard();
    clearTextControllers();
  }

  showOrHidePassword() {
    isObscure = !isObscure;
    notifyListeners();
  }

  Future<void> loginUser() async {
    if (loginFormKey.currentState?.validate() ?? false) {
      try {
        AppUtils.showLoader(TextConstants.loginInProgress);
        bool isSuccess = await FirebaseServices.instance
            .fireBaseUserLogin(emailController.text, passwordController.text);

        if (isSuccess) {
          AppUtils.showSuccessLoader(TextConstants.loginSuccess);
          navigateToDashboard();
        }
      } catch (e) {
        AppUtils.dismissLoader();
        AppUtils.showErrorLoader(TextConstants.genericError);
        debugPrint(e.toString());
      }
    }
  }

  clearTextControllers() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
