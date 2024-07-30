import 'package:flutter/material.dart';
import 'package:pingo_learn_assignment/core/firebase_services.dart';
import 'package:pingo_learn_assignment/modules/sign_up/model/user_model.dart';
import 'package:pingo_learn_assignment/utils/app_utils.dart';
import 'package:pingo_learn_assignment/utils/text_constants.dart';

class SignUpProvider with ChangeNotifier {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObscure = true;

  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final signUpFormKey = GlobalKey<FormState>();

  navigateToLogin() {
    AppUtils.navigateToLogin();
    clearTextControllers();
  }

  showOrHidePassword() {
    isObscure = !isObscure;
    notifyListeners();
  }

  Future<void> registerUser() async {
    if (signUpFormKey.currentState?.validate() ?? false) {
      try {
        AppUtils.showLoader(TextConstants.registrationInProgress);
        UserModel userModel =
            UserModel(email: emailController.text, name: nameController.text);

        bool isSuccess = await FirebaseServices.instance
            .fireBaseUserRegister(userModel, passwordController.text);

        if (isSuccess) {
          AppUtils.showSuccessLoader(TextConstants.registrationSuccess);
          navigateToLogin();
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
    nameController.clear();
    passwordController.clear();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }
}
