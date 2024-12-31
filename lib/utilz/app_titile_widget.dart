import 'package:flutter/material.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Row mainTitleWidget(String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: Adaptive.w(10),
        child: Divider(
          color: black,
        ),
      ),
      buildHspacer(3.w),
      buildsTextBitter(
        title: title,
        size: 24.px,
        fontWeight: FontWeight.w300,
      ),
      buildHspacer(3.w),
      SizedBox(
        width: Adaptive.w(10),
        child: Divider(
          color: black,
        ),
      ),
    ],
  );
}
