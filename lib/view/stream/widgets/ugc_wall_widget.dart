import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UgcWallWidget extends StatelessWidget {
  const UgcWallWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: normalPadding,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset('assets/images/ugcwall1.png'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildsTextManrope(
                            title: "Harshita Gurnani",
                            size: 15.px,
                            fontWeight: FontWeight.w500),
                        buildVspacer(1.h),
                        buildsTextManrope(
                            title: "Stylist",
                            size: 11.px,
                            fontWeight: FontWeight.w300)
                      ],
                    ),
                  ],
                ),
                buildVspacer(2.h),
                buildsTextManrope(
                    title:
                        "Jorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.",
                    size: 11.px,
                    fontWeight: FontWeight.w400,
                    align: true),
                Image.asset('assets/images/ugcwall0.png'),
                // buildVspacer(2.h),
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
                      Icon(Icons.favorite),
                      buildHspacer(2.w),
                      buildsTextManrope(
                        title: "21",
                        size: 13.px,
                        fontWeight: FontWeight.w400,
                      ),
                      Spacer(),
                      Icon(Icons.share)
                    ],
                  ),
                ),
                buildVspacer(3.h),
                SizedBox(
                    height: Adaptive.h(8),
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(8.sp),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.sp),
                                border: Border.all(
                                    color: primarys.withOpacity(0.3))),
                            child: Row(
                              children: [
                                Image.asset('assets/images/ugcwall2.png'),
                                buildHspacer(3.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    buildsTextManrope(
                                        title: "Botox Treatment Spray",
                                        size: 12.px,
                                        fontWeight: FontWeight.w400,
                                        align: true),
                                    buildVspacer(2.h),
                                    buildsTextManrope(
                                        title: "\$1450 ",
                                        size: 10.px,
                                        fontWeight: FontWeight.w400)
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => buildHspacer(3.w),
                        itemCount: 3)),
                Row(
                  children: [
                    Image.asset('assets/images/ugcwall1.png'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildsTextManrope(
                            title: "Harshita Gurnani",
                            size: 15.px,
                            fontWeight: FontWeight.w500),
                        buildVspacer(1.h),
                        buildsTextManrope(
                            title: "Stylist",
                            size: 11.px,
                            fontWeight: FontWeight.w300)
                      ],
                    ),
                  ],
                ),
                buildVspacer(2.h),
                buildsTextManrope(
                    title:
                        "Jorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.",
                    size: 11.px,
                    fontWeight: FontWeight.w400,
                    align: true),
                Image.asset('assets/images/ugcwall0.png'),
                // buildVspacer(2.h),
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
                      Icon(Icons.favorite),
                      buildHspacer(2.w),
                      buildsTextManrope(
                        title: "21",
                        size: 13.px,
                        fontWeight: FontWeight.w400,
                      ),
                      Spacer(),
                      Icon(Icons.share)
                    ],
                  ),
                ),
                buildVspacer(3.h),
                SizedBox(
                    height: Adaptive.h(8),
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(8.sp),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.sp),
                                border: Border.all(
                                    color: primarys.withOpacity(0.3))),
                            child: Row(
                              children: [
                                Image.asset('assets/images/ugcwall2.png'),
                                buildHspacer(3.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    buildsTextManrope(
                                        title: "Botox Treatment Spray",
                                        size: 12.px,
                                        fontWeight: FontWeight.w400,
                                        align: true),
                                    buildVspacer(2.h),
                                    buildsTextManrope(
                                        title: "\$1450 ",
                                        size: 10.px,
                                        fontWeight: FontWeight.w400)
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => buildHspacer(3.w),
                        itemCount: 3))
              ],
            ),
          ),
          Positioned(
            right: Adaptive.w(2),
            bottom: Adaptive.h(2),
            child: CircleAvatar(
              radius: 10.w,
              backgroundColor: Colors.pinkAccent,
              child: Icon(
                Icons.add,
                color: white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
