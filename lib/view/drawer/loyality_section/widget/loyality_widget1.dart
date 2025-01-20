
import 'package:flutter/material.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoyalityWidget1 extends StatelessWidget {
  const LoyalityWidget1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: Colors.black12,
      child: Container(
        padding: EdgeInsets.all(12.sp),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(12.sp),
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: Adaptive.w(7),
                  child: Icon(
                    Icons.person_2,
                    color: grey,
                    size: 30.sp,
                  ),
                ),
                buildHspacer(2.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildsTextManrope(
                        title: "Hi, Harshita Gurnani",
                        size: 15.px,
                        fontWeight: FontWeight.w500),
                    buildsTextManrope(
                        title: "You have 100 Reward Points",
                        size: 15.px,
                        fontWeight: FontWeight.w400)
                  ],
                ),
              ],
            ),
            buildVspacer(2.h),
            Divider(
              color: grey.withOpacity(0.3),
            ),
            buildVspacer(2.h),
            buildsTextManrope(
              title:
                  "You are in the Silver Tier\n(Spend Rs.500 more to reach Gold!)",
              size: 13.px,
              fontWeight: FontWeight.w400,
            ),
            buildVspacer(2.h)
          ],
        ),
      ),
    );
  }
}
