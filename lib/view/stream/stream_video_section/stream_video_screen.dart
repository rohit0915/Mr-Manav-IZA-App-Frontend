import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StreamVideoScreen extends StatelessWidget {
  const StreamVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                // alignment: Alignment.centerLeft,
                children: [
                  Image.asset(
                    'assets/images/stream_video1.png',
                    height: Adaptive.h(100),
                    width: Adaptive.w(100),
                    fit: BoxFit.fill,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildsTextManrope(
                          title: "Glowing Skin Routine....",
                          size: 18.px,
                          fontWeight: FontWeight.w600,
                          color: white),
                      Row(
                        spacing: 3.w,
                        children: [
                          Image.asset(
                            'assets/images/stream_video2.png',
                          ),
                          Image.asset(
                            'assets/images/stream_video3.png',
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Image.asset(
                              'assets/images/stream_video4.png',
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Positioned(
                      bottom: Adaptive.h(3),
                      left: Adaptive.w(5),
                      child: Container(
                        padding: EdgeInsets.all(12.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.sp),
                          color: white.withOpacity(0.9),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/stream_video5.png',
                            ),
                            buildHspacer(3.w),
                            SizedBox(
                              width: Adaptive.w(60),
                              child: Column(
                                spacing: 1.h,
                                mainAxisAlignment: MainAxisAlignment
                                    .center, // Center content vertically
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildsTextManrope(
                                    title: "Botox Treatment Spray",
                                    size: 19.px,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  buildsTextManrope(
                                    title: "\$1450 ",
                                    size: 16.px,
                                    align: true,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Shop Now >",
                                        style: GoogleFonts.manrope(
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
