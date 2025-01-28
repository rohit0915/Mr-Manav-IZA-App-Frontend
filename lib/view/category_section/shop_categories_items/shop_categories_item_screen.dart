import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/custom_appbar.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/product_listing_section/product_listing_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ShopCategoriesItemScreen extends StatefulWidget {
  const ShopCategoriesItemScreen({super.key, required this.title});
  final String title;

  @override
  State<ShopCategoriesItemScreen> createState() =>
      _ShopCategoriesItemScreenState();
}

class _ShopCategoriesItemScreenState extends State<ShopCategoriesItemScreen> {
  Timer? _timer;
  PageController controller = PageController();
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  List<String> banner = [
    'assets/images/homebanner.png',
    'assets/images/homebanner.png',
    'assets/images/homebanner.png',
  ];
  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (controller.hasClients) {
        int nextPage = (controller.page?.toInt() ?? 0) + 1;
        if (nextPage >= banner.length) {
          nextPage = 0; // Loop back to the first page
        }
        controller.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> titles1 = [
      "Face",
      "Eyes",
      "Lips",
    ];
    final List<String> titles2 = [
      "Nails",
      "Tools & \nBrushes",
      "Lips",
    ];
    return Scaffold(
      appBar: CustomAppBar(title: widget.title),
      body: Padding(
        padding: normalPadding,
        child: Column(
          children: [
            SizedBox(
              height: Adaptive.h(35),
              child: PageView.builder(
                controller: controller,
                itemCount: banner.length,
                itemBuilder: (context, index) {
                  return Image.asset(
                    banner[index],
                    // height: Adaptive.h(30),
                    fit: BoxFit.fill,
                  );
                },
              ),
            ),
            buildVspacer(1.h),
            SmoothPageIndicator(
              controller: controller,
              count: banner.length,
              axisDirection: Axis.horizontal,
              effect: ExpandingDotsEffect(
                  dotWidth: Adaptive.w(2),
                  dotHeight: Adaptive.h(1),
                  activeDotColor: black),
            ),
            buildVspacer(2.h),
            Divider(
              color: grey.withOpacity(0.5),
              thickness: 1,
            ),
            buildVspacer(1.h),
            SizedBox(
              height: Adaptive.h(12),
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => ProductListScreen());
                      },
                      child: Column(
                        spacing: 1.h,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(14.sp),
                            child: Image.asset(
                              'assets/images/categoryfirst${index + 1}.jpg',
                              width: Adaptive.w(30),
                              height: Adaptive.h(8),
                              fit: BoxFit.fill,
                            ),
                          ),
                          buildsTextManrope(
                              title: titles1[index],
                              size: 14.px,
                              fontWeight: FontWeight.w400)
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => buildHspacer(5.w),
                  itemCount: 3),
            ),
            // buildVspacer(1.h),
            Divider(
              color: grey.withOpacity(0.5),
              thickness: 1,
            ),
            buildVspacer(1.h),

            SizedBox(
              height: Adaptive.h(14),
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => ProductListScreen());
                      },
                      child: Column(
                        // spacing: 1.h,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(14.sp),
                            child: Image.asset(
                              'assets/images/categoryfirst${index + 1}.jpg',
                              width: Adaptive.w(30),
                              height: Adaptive.h(8),
                              fit: BoxFit.fill,
                            ),
                          ),
                          buildVspacer(0.5.h),
                          buildsTextManrope(
                              title: titles2[index],
                              size: 14.px,
                              fontWeight: FontWeight.w400)
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => buildHspacer(5.w),
                  itemCount: 3),
            ),
          ],
        ),
      ),
    );
  }
}
