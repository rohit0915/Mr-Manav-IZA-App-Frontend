import 'package:flutter/material.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/button_widget.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/custom_appbar.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:dotted_border/dotted_border.dart';

class ReferAndEarnScreen extends StatelessWidget {
  const ReferAndEarnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Refer & earn"),
      body: Column(
        children: [
          Container(
              width: Adaptive.w(100),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.pink.shade50, white])),
              // padding: EdgeInsets.all(3.w),
              child: Padding(
                padding: normalPadding,
                child: Column(
                  children: [
                    buildVspacer(2.h),
                    buildsTextManrope(
                      title: "Invite Friends & Earn",
                      size: 18.px,
                      align: true,
                      fontWeight: FontWeight.w600,
                    ),
                    buildVspacer(1.h),
                    buildsTextManrope(
                      title: "Invite friends & earn 200 for every friend",
                      size: 11.px,
                      align: true,
                      fontWeight: FontWeight.w500,
                    ),
                    buildVspacer(3.h),
                    Container(
                      padding: EdgeInsets.all(12.sp),
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(12.sp)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildsTextManrope(
                                      title: "Earnings",
                                      size: 15.px,
                                      fontWeight: FontWeight.w500,
                                      color: grey),
                                  buildVspacer(1.h),
                                  buildsTextManrope(
                                      title: "\$0",
                                      size: 15.px,
                                      fontWeight: FontWeight.w500,
                                      color: grey)
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildsTextManrope(
                                      title: "Signup",
                                      size: 15.px,
                                      fontWeight: FontWeight.w500,
                                      color: grey),
                                  buildVspacer(1.h),
                                  buildsTextManrope(
                                      title: "0",
                                      size: 15.px,
                                      fontWeight: FontWeight.w500,
                                      color: grey)
                                ],
                              )
                            ],
                          ),
                          buildVspacer(2.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(12),
                                padding: EdgeInsets.all(6),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  child: Container(
                                    height: Adaptive.h(5),
                                    width: Adaptive.w(70),
                                  ),
                                ),
                              ),
                              Image.asset('assets/images/refer_and_earn.png')
                            ],
                          ),
                          buildVspacer(2.h),
                          buildsTextManrope(
                            title: "Or",
                            color: grey,
                            size: 13.px,
                          ),
                          buildVspacer(2.h),
                          CustomButton(
                            onpress: () {},
                            title: "Invite your friends",
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
