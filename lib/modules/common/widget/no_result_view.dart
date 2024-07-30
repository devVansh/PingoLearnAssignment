import 'package:flutter/material.dart';
import 'package:pingo_learn_assignment/modules/common/widget/common_text_widget.dart';
import 'package:pingo_learn_assignment/utils/app_colors.dart';

class NoResultView extends StatelessWidget {
  final String text;
  const NoResultView({super.key, this.text = "No Data Available"});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CommonTextWidget(
        text: text,
        textAlign: TextAlign.center,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
    );
  }
}
