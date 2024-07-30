import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pingo_learn_assignment/utils/app_colors.dart';
import 'package:pingo_learn_assignment/utils/app_sizes.dart';

class CommonButton extends StatelessWidget {
  final String? buttonTitle;
  final double buttonHeight;
  final double? buttonWidth;
  final VoidCallback onTap;
  final bool isDarkButton;
  final bool showTrailingIcon;
  final bool showIconWithButtonTitle;
  final bool showShadow;
  final String? centerIcon;
  final double? buttonTextSize;
  final double? buttonRadius;
  final Color buttonColor;
  final Color? borderColor;
  final Color? buttonTextColor;
  final TextStyle? buttonTextStyle;

  const CommonButton({
    super.key,
    this.buttonTitle,
    this.buttonHeight = 50,
    this.buttonRadius = 5,
    this.buttonWidth,
    required this.onTap,
    this.isDarkButton = true,
    this.showTrailingIcon = false,
    this.showIconWithButtonTitle = false,
    this.showShadow = false,
    this.buttonTextSize,
    this.centerIcon,
    this.borderColor,
    required this.buttonColor,
    this.buttonTextColor,
    this.buttonTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap.call(),
      splashColor: Colors.transparent,
      child: Container(
        height: buttonHeight,
        width: buttonWidth ?? AppSizes.getWidth(context),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(
          vertical: 3,
        ),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(buttonRadius ?? 5),
          boxShadow: showShadow
              ? const [
                  BoxShadow(
                      color: AppColors.grey,
                      blurRadius: 5.0,
                      blurStyle: BlurStyle.outer),
                ]
              : [],
          border: Border.all(color: borderColor ?? AppColors.black),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: showTrailingIcon
              ? MainAxisAlignment.spaceEvenly
              : MainAxisAlignment.center,
          children: [
            Text(
              buttonTitle ?? "",
              style: buttonTextStyle ??
                  GoogleFonts.poppins(
                    color: buttonTextColor,
                    fontSize: buttonTextSize ?? 18,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            showTrailingIcon
                ? Container(
                    height: buttonHeight - 15,
                    width: buttonHeight - 15,
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(23),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: AppColors.primaryColor,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
