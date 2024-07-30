import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pingo_learn_assignment/core/firebase_services.dart';
import 'package:pingo_learn_assignment/core/shared_pref_services.dart';
import 'package:pingo_learn_assignment/utils/app_colors.dart';
import 'package:pingo_learn_assignment/utils/app_sizes.dart';
import 'package:pingo_learn_assignment/utils/app_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initializeFirebase();
  }

  initializeFirebase() async {
    await FirebaseServices.instance.initializeFirebase();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, navigationPage);
  }

  void navigationPage() {
    if (SharedPrefsServices.instance.getLoginStatus()) {
      AppUtils.navigateToDashboard();
    } else {
      AppUtils.navigateToLogin();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: AppColors.white,
      width: AppSizes.getWidth(context),
      height: AppSizes.getHeight(context),
      child: Lottie.asset(
        'assets/splash_animation.json',
        animate: true,
        repeat: true,
      ),
    ));
  }
}
