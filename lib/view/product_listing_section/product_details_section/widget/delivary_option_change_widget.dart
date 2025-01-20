import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/button_widget.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void addressChangeBottom(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: scaffoldBackground,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 1.h,
          children: [
            Center(
              child: Container(
                width: 10.w,
                height: 0.5.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            buildsTextManrope(
              title: "Delivery Option",
              size: 23.px,
              fontWeight: FontWeight.w500,
              align: true,
            ),
            Row(
              children: [
                Container(
                  height: Adaptive.h(5),
                  width: Adaptive.w(60),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(12.sp),
                  ),
                  child: buildsTextManrope(
                      title: "8867687",
                      size: 15.px,
                      fontWeight: FontWeight.w500,
                      align: true),
                ),
                buildHspacer(2.w),
                Expanded(
                  child: CustomButton(
                    onpress: () {
                      Get.back();
                    },
                    title: "Check",
                  ),
                )
              ],
            ),
            buildsTextManrope(
                title: "Harshita Gurnani ",
                size: 15.px,
                fontWeight: FontWeight.w500,
                align: true),
            buildsTextManrope(
                title: "211/abc avenue\nKolkata - 123455, West Bengal IN ",
                size: 13.px,
                fontWeight: FontWeight.w500,
                align: true),
            buildsTextManrope(
                title: "Mobile: 7364648765",
                size: 13.px,
                color: grey,
                fontWeight: FontWeight.w500),
                
          ],
        ),
      );
    },
  );
}
