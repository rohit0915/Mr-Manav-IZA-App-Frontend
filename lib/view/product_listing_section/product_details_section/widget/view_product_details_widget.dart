import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FrameWidget extends StatelessWidget {
  const FrameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.sp),
      decoration:
          BoxDecoration(border: Border.all(color: grey.withOpacity(0.2))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image Section
          Container(
            padding: EdgeInsets.all(12.sp),
            decoration: BoxDecoration(
                border: Border.all(color: grey.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(12.sp)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Image.asset('assets/images/details3.png'),
                    buildHspacer(2.w),
                    buildsTextManrope(
                        title: "Authentic\nProducts", size: 13.px, align: true)
                  ],
                ),
                Container(
                  height: 5.h,
                  width: 1.w,
                  color: Colors.black12,
                ),
                Row(
                  children: [
                    Image.asset('assets/images/details1.png'),
                    buildHspacer(2.w),
                    buildsTextManrope(
                        title: "Easy\nReturn", size: 13.px, align: true)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
