import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/stream/faq_question_section/faq_question_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Column faqItemMethodWidget() {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.all(12.sp),
        decoration: BoxDecoration(
          border: Border.all(
            color: grey.withOpacity(0.3),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset('assets/images/faq1.png'),
                buildHspacer(3.w),
                buildsTextManrope(
                  title: "Anonymous",
                  size: 15.px,
                  fontWeight: FontWeight.w500,
                )
              ],
            ),
            buildVspacer(2.h),
            Row(
              children: [
                Image.asset('assets/images/stash_question-light.png'),
                buildHspacer(3.w),
                buildsTextManrope(
                    title:
                        "I have too many Blackheads on my nose, Please\nshare some tips.",
                    size: 12.px,
                    fontWeight: FontWeight.w400,
                    align: true)
              ],
            ),
            buildVspacer(2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Adaptive.w(3),
                    vertical: Adaptive.h(0.5),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: primarys,
                    ),
                    borderRadius: BorderRadius.circular(12.sp),
                  ),
                  child: Center(
                    child: buildsTextManrope(
                        title: "#skincare",
                        size: 11.px,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                buildsTextManrope(
                    title: "16 Nov 2024",
                    size: 11.px,
                    color: grey.withOpacity(0.4))
              ],
            )
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(
            horizontal: Adaptive.w(2), vertical: Adaptive.h(2)),
        decoration: BoxDecoration(
            border: Border.all(
              color: grey.withOpacity(0.4),
            ),
            borderRadius: BorderRadius.circular(12.sp)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.favorite_border),
            buildHspacer(2.w),
            buildsTextManrope(
              title: "21",
              size: 13.px,
              fontWeight: FontWeight.w400,
            ),
            buildHspacer(2.w),
            GestureDetector(
                onTap: () {
                  Get.to(() => FaqQuestionSectionScreen());
                },
                child: Image.asset('assets/images/command.png')),
            buildHspacer(2.w),
            buildsTextManrope(
              title: "45",
              size: 13.px,
              fontWeight: FontWeight.w400,
            ),
            Spacer(),
            Icon(Icons.share)
          ],
        ),
      ),
    ],
  );
}
