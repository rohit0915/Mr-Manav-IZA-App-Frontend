import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

buildVspacer(double h) {
 return SizedBox(
    height: h,
  );
}

buildHspacer(double w) {
 return SizedBox(
    width: w,
  );
}

final normalPadding=EdgeInsets.symmetric(horizontal: Adaptive.w(2),vertical: Adaptive.h(1));
