import 'package:flutter/material.dart';
import 'package:pingo_learn_assignment/utils/app_sizes.dart';

Widget extraSmallSizedBox({bool isWidth = false}) {
  return SizedBox(
    height: isWidth ? null : AppSizes.microPadding,
    width: isWidth ? AppSizes.microPadding : null,
  );
}

Widget smallSizedBox({bool isWidth = false}) {
  return SizedBox(
    height: isWidth ? null : AppSizes.smallPadding,
    width: isWidth ? AppSizes.smallPadding : null,
  );
}

Widget mediumSizedBox({bool isWidth = false}) {
  return SizedBox(
    height: isWidth ? null : AppSizes.mediumPadding,
    width: isWidth ? AppSizes.mediumPadding : null,
  );
}

Widget defaultSizedBox({bool isWidth = false}) {
  return SizedBox(
    height: isWidth ? null : AppSizes.defaultPadding,
    width: isWidth ? AppSizes.defaultPadding : null,
  );
}

Widget largeSizedBox({bool isWidth = false}) {
  return SizedBox(
    height: isWidth ? null : AppSizes.largePadding,
    width: isWidth ? AppSizes.largePadding : null,
  );
}

Widget extraLargeSizedBox({bool isWidth = false}) {
  return SizedBox(
    height: isWidth ? null : AppSizes.xxlPadding,
    width: isWidth ? AppSizes.xxlPadding : null,
  );
}
