import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/button_widget.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/product_listing_section/product_details_section/widget/delivary_option_change_widget.dart';
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
                        title: "Authentic\nProducts",
                        size: 13.px,
                        align: true,
                        fontWeight: FontWeight.w500)
                  ],
                ),
                Container(
                  height: 5.h,
                  width: 0.5.w,
                  color: Colors.black12,
                ),
                Row(
                  children: [
                    Image.asset('assets/images/details1.png'),
                    buildHspacer(2.w),
                    buildsTextManrope(
                        title: "Easy\nReturn",
                        size: 13.px,
                        align: true,
                        fontWeight: FontWeight.w500)
                  ],
                )
              ],
            ),
          ),
          buildVspacer(2.h),
          Container(
            padding: EdgeInsets.all(12.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.sp),
            ),
            child: Column(
              spacing: 2.h,
              children: [
                buildsTextManrope(
                    title: "Delivery Details",
                    size: 18.px,
                    align: true,
                    fontWeight: FontWeight.w600),
                Row(
                  children: [
                    Image.asset('assets/images/delivary.png'),
                    buildHspacer(5.w),
                    buildsTextManrope(
                        title: "Expected Delivery by Wed, 4 Dec ",
                        size: 13.px,
                        fontWeight: FontWeight.w600)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/details5.png'),
                    buildsTextManrope(
                        title: "Pin Code - 888865",
                        size: 13.px,
                        fontWeight: FontWeight.w600),
                    CustomButton(
                        width: Adaptive.w(30),
                        onpress: () {
                          addressChangeBottom(context);
                        },
                        color: white,
                        title: "Change",
                        borderColor: black,
                        textColor: black,
                        height: 5.h,
                        radious: 24.sp)
                  ],
                ),
                buildVspacer(1.h),
              ],
            ),
          ),
          Container(
            height: Adaptive.h(5),
            padding: EdgeInsets.all(12.sp),
            decoration: BoxDecoration(
              border: Border.all(color: grey.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(12.sp),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildsTextManrope(
                    title: "Product Information",
                    size: 13.px,
                    fontWeight: FontWeight.w500,
                    color: black),
                Icon(
                  Icons.keyboard_arrow_up,
                  color: black,
                )
              ],
            ),
          ),
          buildVspacer(2.h),

          Container(
            padding: EdgeInsets.all(12.sp),
            decoration: BoxDecoration(
              border: Border.all(color: grey.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(12.sp),
            ),
            child: Column(
              spacing: 2.h,
              children: [
                buildsTextManrope(
                  title:
                      "Corem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque.",
                  size: 13.px,
                  fontWeight: FontWeight.w400,
                  align: true,
                ),
                buildsTextManrope(
                  title: "Usage",
                  size: 17.px,
                  fontWeight: FontWeight.w600,
                  align: true,
                ),
                buildsTextManrope(
                  title:
                      "Corem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque.",
                  size: 13.px,
                  fontWeight: FontWeight.w400,
                  align: true,
                ),
                buildsTextManrope(
                  title: "Benefits",
                  size: 17.px,
                  fontWeight: FontWeight.w600,
                  align: true,
                ),
                buildsTextManrope(
                  title:
                      "Corem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque.",
                  size: 13.px,
                  fontWeight: FontWeight.w400,
                  align: true,
                ),
                buildsTextManrope(
                  title: "Ingredients",
                  size: 17.px,
                  fontWeight: FontWeight.w600,
                  align: true,
                ),
                buildsTextManrope(
                  title:
                      "Corem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque.",
                  size: 13.px,
                  fontWeight: FontWeight.w400,
                  align: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
