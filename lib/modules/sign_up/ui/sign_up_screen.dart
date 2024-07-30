import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pingo_learn_assignment/modules/common/widget/base_scaffold.dart';
import 'package:pingo_learn_assignment/modules/common/widget/common_button.dart';
import 'package:pingo_learn_assignment/modules/common/widget/common_sized_boxes.dart';
import 'package:pingo_learn_assignment/modules/common/widget/common_text_input_field.dart';
import 'package:pingo_learn_assignment/modules/common/widget/common_text_widget.dart';
import 'package:pingo_learn_assignment/modules/sign_up/provider/sign_up_provider.dart';
import 'package:pingo_learn_assignment/utils/app_colors.dart';
import 'package:pingo_learn_assignment/utils/app_sizes.dart';
import 'package:pingo_learn_assignment/utils/text_constants.dart';
import 'package:pingo_learn_assignment/utils/validator.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget with ValidatorMixin {
  const SignUpScreen({super.key});

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
        body: Consumer<SignUpProvider>(
            builder: (c, SignUpProvider signUpProvider, _) =>
                Builder(builder: (context) {
                  return Column(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Form(
                            key: signUpProvider.signUpFormKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(
                                      AppSizes.smallPadding),
                                  child: CommonTextFormField(
                                    hintText: TextConstants.name,
                                    controller: signUpProvider.nameController,
                                    focusNode: signUpProvider.nameFocusNode,
                                    validator: validateName,
                                    textInputActionType: TextInputAction.next,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(
                                      AppSizes.smallPadding),
                                  child: CommonTextFormField(
                                    hintText: TextConstants.email,
                                    controller: signUpProvider.emailController,
                                    focusNode: signUpProvider.emailFocusNode,
                                    validator: validateEmail,
                                    textInputActionType: TextInputAction.next,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(
                                      AppSizes.smallPadding),
                                  child: CommonTextFormField(
                                    hintText: TextConstants.password,
                                    controller:
                                        signUpProvider.passwordController,
                                    focusNode: signUpProvider.passwordFocusNode,
                                    validator: validatePassword,
                                    obscureText: signUpProvider.isObscure,
                                    suffixIcon: Icon(
                                      signUpProvider.isObscure
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: AppColors.primaryColor,
                                    ),
                                    onTapSuffixIcon: () {
                                      signUpProvider.showOrHidePassword();
                                    },
                                    isSuffixIcon: true,
                                    textInputActionType: TextInputAction.done,
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
                                  signUpProvider.registerUser();
                                },
                                buttonColor: AppColors.primaryColor,
                                buttonTitle: TextConstants.signUp,
                                buttonTextColor: AppColors.white,
                                buttonRadius: 10,
                                buttonWidth:
                                    AppSizes.getWidth(context, percent: 50),
                              ),
                              InkWell(
                                onTap: () {
                                  signUpProvider.navigateToLogin();
                                },
                                child: RichText(
                                  text: TextSpan(
                                    text: TextConstants.alreadyAccount,
                                    style: GoogleFonts.poppins(
                                      fontSize: AppSizes.defaultFontSize,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: TextConstants.login,
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
