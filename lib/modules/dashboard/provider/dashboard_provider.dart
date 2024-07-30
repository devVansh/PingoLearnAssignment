import 'package:flutter/material.dart';
import 'package:pingo_learn_assignment/core/firebase_services.dart';
import 'package:pingo_learn_assignment/core/shared_pref_services.dart';
import 'package:pingo_learn_assignment/main.dart';
import 'package:pingo_learn_assignment/modules/common/widget/common_button.dart';
import 'package:pingo_learn_assignment/modules/common/widget/common_text_widget.dart';
import 'package:pingo_learn_assignment/modules/dashboard/model/comments_response_model.dart';
import 'package:pingo_learn_assignment/modules/dashboard/repository/dashboard_repository.dart';
import 'package:pingo_learn_assignment/modules/log_in/ui/login_screen.dart';
import 'package:pingo_learn_assignment/utils/app_colors.dart';
import 'package:pingo_learn_assignment/utils/app_sizes.dart';
import 'package:pingo_learn_assignment/utils/app_utils.dart';
import 'package:pingo_learn_assignment/utils/text_constants.dart';

class DashboardProvider with ChangeNotifier {
  List<CommentsResponseModel> commentsList = List.empty(growable: true);
  bool isMasked() => FirebaseServices.instance.getBool(TextConstants.isMasked);

  getCommentsList() async {
    AppUtils.showLoader(TextConstants.fetchingComments);
    commentsList = await DashboardRepository.instance.getCommentsList();
    await FirebaseServices.instance.fetchAndActivate();
    AppUtils.dismissLoader();
    notifyListeners();
  }

  _navigateToLogin() {
    navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
      (route) => false,
    );

    AppUtils.showSuccessLoader(TextConstants.logoutDesc);
  }

  logOut() {
    SharedPrefsServices.instance.clearPreferences();
    _navigateToLogin();
  }

  Future<void> showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: AppColors.white,
          backgroundColor: AppColors.white,
          title: const CommonTextWidget(
            text: TextConstants.confirmLogout,
            color: AppColors.black,
            fontWeight: FontWeight.bold,
          ),
          content: const CommonTextWidget(
            text: TextConstants.confirmLogoutDesc,
            color: AppColors.black,
          ),
          actions: <Widget>[
            TextButton(
              child: const CommonTextWidget(
                text: TextConstants.cancel,
                color: AppColors.black,
              ),
              onPressed: () {
                navigatorKey.currentState?.pop();
              },
            ),
            CommonButton(
              buttonColor: AppColors.primaryColor,
              buttonTitle: TextConstants.logout,
              buttonWidth: AppSizes.getWidth(context, percent: 30),
              buttonRadius: 20,
              buttonTextColor: AppColors.white,
              onTap: () async {
                logOut();
              },
            ),
          ],
        );
      },
    );
  }
}
