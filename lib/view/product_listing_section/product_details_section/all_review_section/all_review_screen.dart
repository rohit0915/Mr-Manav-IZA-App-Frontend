import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/product_listing_section/product_details_section/all_review_section/add_review/add_review_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AllReviewScreen extends StatelessWidget {
  const AllReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back)),
        title: buildsTextManrope(title: "All Reviews", size: 19.px),
        actions: [
          GestureDetector(
            onTap: () {
              Get.off(() => PostReviewScreen());
            },
            child: buildsTextManrope(
                title: "Write Review",
                size: 13.px,
                fontWeight: FontWeight.w400,
                color: primarys),
          ),
          buildHspacer(2.w),
        ],
      ),
      backgroundColor: scaffoldBackground,
      body: Padding(
        padding: horizontalPadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(12.sp),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 1.h,
                                  children: [
                                    buildsTextManrope(
                                        title: "Riya Tiwari",
                                        size: 16.px,
                                        fontWeight: FontWeight.w500),
                                    IntrinsicWidth(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Adaptive.w(2),
                                            vertical: Adaptive.h(0.5)),
                                        decoration: BoxDecoration(
                                            border: Border.all(color: black),
                                            borderRadius:
                                                BorderRadius.circular(14.sp)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: black,
                                            ),
                                            buildHspacer(1.w),
                                            buildsTextManrope(
                                                title: "4/5",
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
                                    fontWeight: FontWeight.w400)
                              ],
                            ),
                            buildVspacer(1.h),
                            buildsTextManrope(
                                title:
                                    "Worem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
                                size: 13.px,
                                fontWeight: FontWeight.w400,
                                align: true),
                            buildVspacer(1.h),
                            Row(
                                children: List.generate(
                              2,
                              (index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                      'assets/images/image_product.png'),
                                );
                              },
                            ))
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => buildVspacer(3.h),
                    itemCount: 4),
              )
            ],
          ),
        ),
      ),
    );
  }
}
