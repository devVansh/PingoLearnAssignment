import 'package:flutter/material.dart';
import 'package:pingo_learn_assignment/utils/app_colors.dart';

class BaseScaffold extends StatelessWidget {
  final Widget? body;
  final AppBar? appBar;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;

  const BaseScaffold(
      {Key? key,
      this.body,
      this.backgroundColor,
      this.resizeToAvoidBottomInset,
      this.appBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: appBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? false,
      backgroundColor: backgroundColor ?? AppColors.offWhite,
      body: body,
    );
  }
}
