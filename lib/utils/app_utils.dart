import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pingo_learn_assignment/main.dart';
import 'package:pingo_learn_assignment/modules/dashboard/ui/dashboard_screen.dart';
import 'package:pingo_learn_assignment/modules/log_in/ui/login_screen.dart';
import 'package:pingo_learn_assignment/modules/sign_up/ui/sign_up_screen.dart';

class AppUtils {
  AppUtils._();

  static void showLoader(String message) {
    EasyLoading.show(status: message);
  }

  static void showSuccessLoader(String message, {int seconds = 2}) {
    EasyLoading.showSuccess(
      message,
      duration: Duration(seconds: seconds),
    );
  }

  static void showErrorLoader(String message) {
    EasyLoading.showError(
      message,
      duration: const Duration(seconds: 2),
    );
  }

  static void dismissLoader() {
    EasyLoading.dismiss();
  }

  static navigateToLogin() {
    navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    ));
  }

  static navigateToSignUp() {
    navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
      builder: (context) => const SignUpScreen(),
    ));
  }

  static navigateToDashboard() {
    navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
      builder: (context) => const DashboardScreen(),
    ));
    // clearAndDisposeTextControllers();
  }
}
