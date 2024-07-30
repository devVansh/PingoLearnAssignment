import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pingo_learn_assignment/core/shared_pref_services.dart';
import 'package:pingo_learn_assignment/modules/sign_up/model/user_model.dart';
import 'package:pingo_learn_assignment/utils/app_utils.dart';
import 'package:pingo_learn_assignment/utils/text_constants.dart';

class FirebaseServices {
  FirebaseServices._();

  static FirebaseServices? _instance;
  static FirebaseAuth? _firebaseAuth;
  static FirebaseFirestore? _firebaseFirestore;
  static FirebaseRemoteConfig? _remoteConfig;
  bool getBool(String key) => _remoteConfig?.getBool(key) ?? false;

  static FirebaseServices get instance {
    return _instance ??= FirebaseServices._();
  }

  Future<void> initializeFirebase() async {
    await dotenv.load(fileName: ".env");
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: dotenv.env['apiKey'] ?? "",
            appId: dotenv.env['appId'] ?? "",
            messagingSenderId: dotenv.env['messagingSenderId'] ?? "",
            projectId: dotenv.env['projectId'] ?? ""));
    _firebaseAuth = FirebaseAuth.instance;
    _firebaseFirestore = FirebaseFirestore.instance;
    _remoteConfig = FirebaseRemoteConfig.instance;

    await _setConfigSettings();
    await fetchAndActivate();
    await SharedPrefsServices.init();
  }

  Future<void> _setConfigSettings() async => _remoteConfig?.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          minimumFetchInterval: const Duration(seconds: 30),
        ),
      );

  Future<void> fetchAndActivate() async {
    try {
      await _remoteConfig?.fetchAndActivate();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<bool> fireBaseUserRegister(
      UserModel userModel, String password) async {
    try {
      final UserCredential? userCredential =
          await _firebaseAuth?.createUserWithEmailAndPassword(
              email: userModel.email ?? "", password: password);

      await _firebaseFirestore
          ?.collection(TextConstants.userCollection)
          .doc(userCredential?.user?.uid)
          .set(userModel.toJson());

      return true;
    } on FirebaseAuthException catch (e) {
      AppUtils.dismissLoader();
      if (e.code == 'email-already-in-use') {
        AppUtils.showErrorLoader(TextConstants.emailAlreadyInUse);
      } else {
        AppUtils.showErrorLoader(e.message ?? TextConstants.genericError);
      }
      debugPrint(e.toString());
      return false;
    } catch (e) {
      AppUtils.dismissLoader();
      AppUtils.showErrorLoader(TextConstants.genericError);
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> fireBaseUserLogin(String email, String password) async {
    try {
      final UserCredential? userCredential = await _firebaseAuth
          ?.signInWithEmailAndPassword(email: email, password: password);

      SharedPrefsServices.instance.setLoginStatus(true);
      SharedPrefsServices.instance
          .setUserEmail(userCredential?.user?.email ?? "");

      return true;
    } on FirebaseAuthException catch (e) {
      AppUtils.dismissLoader();
      if (e.code == 'user-not-found') {
        AppUtils.showErrorLoader(TextConstants.userNotFound);
      } else if (e.code == 'wrong-password') {
        AppUtils.showErrorLoader(TextConstants.wrongPassword);
      } else {
        AppUtils.showErrorLoader(e.message ?? TextConstants.genericError);
      }
      debugPrint(e.toString());
      return false;
    } catch (e) {
      AppUtils.dismissLoader();
      AppUtils.showErrorLoader(TextConstants.genericError);
      debugPrint(e.toString());
      return false;
    }
  }
}
