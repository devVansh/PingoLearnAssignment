import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pingo_learn_assignment/modules/dashboard/provider/dashboard_provider.dart';
import 'package:pingo_learn_assignment/modules/log_in/provider/login_provider.dart';
import 'package:pingo_learn_assignment/modules/sign_up/provider/sign_up_provider.dart';
import 'package:pingo_learn_assignment/modules/splash/view/splash_screen.dart';
import 'package:pingo_learn_assignment/utils/app_colors.dart';
import 'package:pingo_learn_assignment/utils/text_constants.dart';
import 'package:provider/provider.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<
    NavigatorState>(); // You need to create this key to control what navigator you want to use

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<SignUpProvider>(
            create: (context) => SignUpProvider(),
          ),
          ChangeNotifierProvider<LoginProvider>(
            create: (context) => LoginProvider(),
          ),
          ChangeNotifierProvider<DashboardProvider>(
            create: (context) => DashboardProvider(),
          ),
        ],
        child: MaterialApp(
          title: TextConstants.appName,
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          builder: EasyLoading.init(),
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
            useMaterial3: true,
          ),
          home: const SplashScreen(),
        ));
  }
}
