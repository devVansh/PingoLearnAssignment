import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pingo_learn_assignment/modules/common/widget/base_scaffold.dart';
import 'package:pingo_learn_assignment/modules/common/widget/common_button.dart';
import 'package:pingo_learn_assignment/modules/common/widget/common_sized_boxes.dart';
import 'package:pingo_learn_assignment/modules/common/widget/common_text_input_field.dart';
import 'package:pingo_learn_assignment/modules/common/widget/common_text_widget.dart';
import 'package:pingo_learn_assignment/modules/log_in/provider/login_provider.dart';
import 'package:pingo_learn_assignment/utils/app_colors.dart';
import 'package:pingo_learn_assignment/utils/app_sizes.dart';
import 'package:pingo_learn_assignment/utils/text_constants.dart';
import 'package:pingo_learn_assignment/utils/validator.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget with ValidatorMixin {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        appBar: AppBar(
          title: const CommonTextWidget(
            text: TextConstants.appName,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: AppColors.offWhite,
        ),
        body: Consumer<LoginProvider>(
            builder: (c, LoginProvider loginProvider, _) =>
                Builder(builder: (context) {
                  return Column(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Form(
                            key: loginProvider.loginFormKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(
                                      AppSizes.smallPadding),
                                  child: CommonTextFormField(
                                    hintText: TextConstants.email,
                                    controller: loginProvider.emailController,
                                    focusNode: loginProvider.emailFocusNode,
                                    validator: validateEmail,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(
                                      AppSizes.smallPadding),
                                  child: CommonTextFormField(
                                    hintText: TextConstants.password,
                                    controller:
                                        loginProvider.passwordController,
                                    focusNode: loginProvider.passwordFocusNode,
                                    obscureText: loginProvider.isObscure,
                                    suffixIcon: Icon(
                                      loginProvider.isObscure
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: AppColors.primaryColor,
                                    ),
                                    onTapSuffixIcon: () {
                                      loginProvider.showOrHidePassword();
                                    },
                                    isSuffixIcon: true,
                                    validator: validatePassword,
                                  ),
                                ),
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CommonButton(
                                onTap: () {
                                  loginProvider.loginUser();
                                },
                                buttonColor: AppColors.primaryColor,
                                buttonTitle: TextConstants.login,
                                buttonTextColor: AppColors.white,
                                buttonRadius: 10,
                                buttonWidth:
                                    AppSizes.getWidth(context, percent: 50),
                              ),
                              InkWell(
                                onTap: () {
                                  loginProvider.navigateToSignUp();
                                },
                                child: RichText(
                                  text: TextSpan(
                                    text: TextConstants.newHere,
                                    style: GoogleFonts.poppins(
                                      fontSize: AppSizes.defaultFontSize,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: TextConstants.signUp,
                                        style: GoogleFonts.poppins(
                                          fontSize: AppSizes.defaultFontSize,
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              largeSizedBox()
                            ],
                          ))
                    ],
                  );
                })));
  }
}
