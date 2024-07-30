import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pingo_learn_assignment/utils/app_colors.dart';
import 'package:pingo_learn_assignment/utils/app_sizes.dart';

class CommonTextWidget extends StatelessWidget {
  const CommonTextWidget(
      {required this.text,
      this.fontSize,
      this.color,
      this.fontWeight,
      this.fontFamily,
      this.textAlign,
      this.overflow,
      this.textStyle,
      this.maxTextLines,
      this.softWrap,
      this.padding,
      super.key});

  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final TextStyle? textStyle;
  final int? maxTextLines;
  final bool? softWrap;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: fontSize ?? AppSizes.defaultFontSize,
          color: color ?? AppColors.primaryColor,
          fontWeight: fontWeight ?? FontWeight.normal,
        ),
        softWrap: softWrap,
        maxLines: maxTextLines,
        textAlign: textAlign ?? defaultTextStyle.textAlign ?? TextAlign.start,
        overflow: overflow ?? defaultTextStyle.overflow,
      ),
    );
  }
}
