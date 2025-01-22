import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/brand_section/brand_category_list/brand_category_list_screen.dart';
import 'package:iza_app/view/wishlist_section/wishlist_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BrandListingScreen extends StatelessWidget {
  const BrandListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back)),
        title: buildsTextManrope(
            title: "Brands", size: 17.px, fontWeight: FontWeight.w600),
        actions: [
          GestureDetector(
              onTap: () {
                Get.to(() => WishlistScreen());
              },
              child: Image.asset('assets/images/offerappbar2.png')),
          buildHspacer(2.w),
          Image.asset('assets/images/offerappbar3.png')
        ],
      ),
      body: Padding(
        padding: normalPadding,
        child: Column(
          children: [
            Container(
              height: Adaptive.h(5),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.sp),
                color: textFieldColor,
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  buildHspacer(3.w),
                  buildsTextManrope(
                      title: "Search brand for iza",
                      size: 14.px,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey)
                ],
              ),
            ),
            buildVspacer(2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildsTextManrope(
                  title: "Top Brands",
                  size: 20.px,
                  fontWeight: FontWeight.w700,
                  color: black,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => BrandCategoryListScreen(title: "Top Brands"));
                  },
                  child: buildsTextManrope(
                    title: "View All >",
                    size: 18.px,
                    fontWeight: FontWeight.w700,
                    color: primarys,
                  ),
                ),
              ],
            ),
            buildVspacer(1.h),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 items per row
                  crossAxisSpacing: 2.w,
                  mainAxisSpacing: 2.h,
                  childAspectRatio: 8 / 5,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Image.asset(
                    'assets/images/brandlogo1.png',
                    height: Adaptive.h(4),
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildsTextManrope(
                  title: "Lux Brands",
                  size: 20.px,
                  fontWeight: FontWeight.w700,
                  color: black,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => BrandCategoryListScreen(title: "Lux Brands"));
                  },
                  child: buildsTextManrope(
                    title: "View All >",
                    size: 18.px,
                    fontWeight: FontWeight.w700,
                    color: primarys,
                  ),
                ),
              ],
            ),
            buildVspacer(1.h),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 items per row
                  crossAxisSpacing: 2.w,
                  mainAxisSpacing: 2.h,
                  childAspectRatio: 8 / 5,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Image.asset(
                    'assets/images/brandlogo2.png',
                    height: Adaptive.h(4),
                    fit: BoxFit.cover,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
