import 'package:flutter/material.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CertificateWidget extends StatelessWidget {
  const CertificateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.sp),
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
        color: primarys.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: Column(
        spacing: 1.h,
        children: [
          certificateMethod(
              image: "certificate1",
              title1: "100% Authentic",
              title2: "All our product are directly sourced from brands"),
          certificateMethod(
              image: "delivary",
              title1: "Free Shipping",
              title2: "on all orders above 299"),
          certificateMethod(
              image: "certificate2",
              title1: "Certified Beauty Advisors",
              title2: "Get expert consultation"),
          certificateMethod(
              image: "certificate3",
              title1: "Easy Return ",
              title2: "Hassle-free-pick-ups and refunds"),
        ],
      ),
    );
  }

  Row certificateMethod(
      {required String image, required String title1, required String title2}) {
    return Row(
      children: [
        Image.asset(
          "assets/images/$image.png",
          height: 4.h,
          width: 6.w,
        ),
        buildHspacer(4.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildsTextManrope(
              title: title1,
              size: 15.px,
              fontWeight: FontWeight.w600,
            ),
            buildVspacer(1.h),
            buildsTextManrope(
              title: title2,
              size: 12.px,
              color: grey,
              fontWeight: FontWeight.w400,
            )
          ],
        )
      ],
    );
  }
}
