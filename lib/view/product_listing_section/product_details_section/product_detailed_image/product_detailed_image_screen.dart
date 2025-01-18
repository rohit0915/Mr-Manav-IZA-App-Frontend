import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductDetailedImageScreen extends StatelessWidget {
  const ProductDetailedImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: white,
            )),
      ),
      body: Padding(
        padding: normalPadding,
        child: Column(
          children: [
            Image.asset(
              'assets/images/product_review_poster.png',
              width: Adaptive.w(100),
              height: Adaptive.h(65),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:  Adaptive.w(3)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 1.h,
                    children: [
                      buildsTextManrope(
                          title: "Riya Tiwari",
                          size: 16.px,
                          color: white,
                          fontWeight: FontWeight.w500),
                      IntrinsicWidth(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Adaptive.w(2),
                              vertical: Adaptive.h(0.5)),
                          decoration: BoxDecoration(
                              border: Border.all(color: white),
                              borderRadius: BorderRadius.circular(14.sp)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: white,
                              ),
                              buildHspacer(1.w),
                              buildsTextManrope(
                                  title: "4/5",
                                  color: white,
                                  size: 13.px,
                                  fontWeight: FontWeight.w400)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  buildsTextManrope(
                      title: "Sun, 07 July 2024",
                      size: 10.px,
                      color: white,
                      fontWeight: FontWeight.w400)
                ],
              ),
            ),
            buildVspacer(1.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:  Adaptive.w(3)),
              child: buildsTextManrope(
                  title:
                      "Worem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
                  size: 13.px,
                  color: white,
                  fontWeight: FontWeight.w400,
                  align: true),
            ),
          ],
        ),
      ),
    );
  }
}
