import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/brand_section/brand_searching/brand_searching_screen.dart';
import 'package:iza_app/view/cart/cart_screen.dart';
import 'package:iza_app/view/wishlist_section/wishlist_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BrandCategoryListScreen extends StatelessWidget {
  const BrandCategoryListScreen({super.key, required this.title});
  final String title;
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
            title: title, size: 17.px, fontWeight: FontWeight.w600),
        actions: [
          GestureDetector(
              onTap: () {
                Get.to(() => WishlistScreen());
              },
              child: Image.asset('assets/images/offerappbar2.png')),
          buildHspacer(2.w),
          GestureDetector(
              onTap: () {
                Get.to(() => CartScreen());
              },
              child: Image.asset('assets/images/offerappbar3.png'))
        ],
      ),
      body: Padding(
        padding: normalPadding,
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, 
                  crossAxisSpacing: 2.w,
                  mainAxisSpacing: 2.h,
                  childAspectRatio: 8 / 5,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return Image.asset(
                    'assets/images/brandlogo1.png',
                    height: Adaptive.h(4),
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            buildVspacer(1.h),
            GestureDetector(
              onTap: () {
                Get.to(() => BrandScreen());
              },
              child: Container(
                height: Adaptive.h(5),
                padding: EdgeInsets.symmetric(horizontal: Adaptive.w(3)),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildsTextManrope(
                      title: "Find More Brands",
                      size: 16.px,
                      fontWeight: FontWeight.w700,
                    ),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
              ),
            ),
            buildVspacer(2.h)
          ],
        ),
      ),
    );
  }
}
