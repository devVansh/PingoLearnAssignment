import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pingo_learn_assignment/utils/app_colors.dart';
import 'package:pingo_learn_assignment/utils/app_sizes.dart';

class CommonTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final String? headerText;
  final InputBorder? outputBorder;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextAlign? textAlign;
  final EdgeInsetsGeometry? contentPadding;

  final FormFieldValidator<String>? validator;
  final VoidCallback? onEditingComplete;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onFieldChange;

  final TextInputType keyboardType;
  final int? maxLines;
  final int minLines;
  final TextCapitalization? textCapitalization;
  final bool isDropdown;
  final VoidCallback? onTapField;
  final VoidCallback? onTapSuffixIcon;
  final bool readOnly;
  final int? maxLength;
  final int? lengthLimit;
  final bool showCounterText;
  final AutovalidateMode? autoValidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final bool? autofocus;
  final Color fillColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isSuffixIcon;
  final bool? isDense;
  final bool obscureText;
  final String? errorMessage;
  final String? suffixText;
  final TextStyle? suffixTextStyle;
  final TextInputAction? textInputActionType;
  final FontWeight? headerFontWeight;

  const CommonTextFormField({
    super.key,
    this.controller,
    required this.hintText,
    this.headerText,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.focusNode,
    this.contentPadding,
    this.prefixIcon,
    this.style,
    this.isDense,
    this.hintStyle,
    this.textAlign,
    this.labelStyle,
    this.onEditingComplete,
    this.headerFontWeight,
    this.outputBorder,
    this.onFieldSubmitted,
    this.onFieldChange,
    this.maxLines = 1,
    this.minLines = 1,
    this.onTapField,
    this.onTapSuffixIcon,
    this.readOnly = false,
    this.maxLength,
    this.lengthLimit,
    this.showCounterText = false,
    this.autoValidateMode,
    this.inputFormatters,
    this.autofocus = false,
    this.textCapitalization,
    this.isDropdown = false,
    this.fillColor = AppColors.white,
    this.suffixIcon,
    this.isSuffixIcon = false,
    this.errorMessage,
    this.obscureText = false,
    this.suffixText,
    this.suffixTextStyle,
    this.textInputActionType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      onFieldSubmitted: onFieldSubmitted,
      textAlign: textAlign ?? TextAlign.start,
      obscureText: obscureText,
      onChanged: onFieldChange,
      autofocus: autofocus ?? false,
      focusNode: focusNode ?? FocusNode(),
      onEditingComplete: onEditingComplete,
      cursorColor: Theme.of(context).primaryColor,
      style: style ??
          GoogleFonts.poppins(
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
      readOnly: readOnly,
      keyboardType: keyboardType,
      textInputAction: textInputActionType,
      validator: validator,
      autovalidateMode: autoValidateMode,
      controller: controller,
      maxLines: maxLines,
      minLines: minLines,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      onTap: onTapField,
      maxLength: maxLength ?? 100,
      decoration: InputDecoration(
        fillColor: fillColor,
        errorMaxLines: 2,
        prefixIcon: prefixIcon,
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        isDense: isDense ?? false,
        suffixIcon: isSuffixIcon
            ? InkWell(
                onTap: onTapSuffixIcon,
                child: suffixIcon,
              )
            : suffixText?.trim().isNotEmpty ?? false
                ? Text(
                    suffixText ?? "",
                    style: suffixTextStyle ??
                        GoogleFonts.poppins(
                          fontSize: 10,
                          color: AppColors.black,
                          fontWeight: FontWeight.w400,
                        ),
                  )
                : const SizedBox.shrink(),
        suffixIconConstraints: isDropdown || isSuffixIcon
            ? const BoxConstraints(maxHeight: 30, maxWidth: 30)
            : (suffixText?.trim().isNotEmpty ?? false)
                ? const BoxConstraints(maxHeight: 30, maxWidth: 50)
                : const BoxConstraints(maxHeight: 0, maxWidth: 0),
        contentPadding:
            contentPadding ?? const EdgeInsets.symmetric(horizontal: 5),
        counterText: showCounterText ? null : '',
        errorText: errorMessage,
        labelStyle: labelStyle ??
            GoogleFonts.poppins(
              fontSize: 14,
              color: AppColors.grey,
              fontWeight: FontWeight.w400,
            ),
        filled: true,
        hintText: hintText,
        hintStyle: hintStyle ??
            GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
        disabledBorder: outputBorder ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.smallPadding),
                borderSide: const BorderSide(color: AppColors.white)),
        enabledBorder: outputBorder ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.smallPadding),
                borderSide: const BorderSide(color: AppColors.white)),
        focusedBorder: outputBorder ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.smallPadding),
                borderSide: const BorderSide(color: AppColors.white)),
        errorBorder: outputBorder ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.smallPadding),
                borderSide: const BorderSide(color: AppColors.white)),
        focusedErrorBorder: outputBorder ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.smallPadding),
                borderSide: const BorderSide(color: AppColors.white)),
      ),
    );
  }
}
