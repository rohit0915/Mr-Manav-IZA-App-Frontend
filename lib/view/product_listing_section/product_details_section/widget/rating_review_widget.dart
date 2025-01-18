import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/product_listing_section/product_details_section/all_review_section/all_review_screen.dart';
import 'package:iza_app/view/product_listing_section/product_details_section/photo_section/all_photo_screen.dart';
import 'package:iza_app/view/product_listing_section/product_details_section/product_detailed_image/product_detailed_image_screen.dart';
import 'package:iza_app/view/product_listing_section/product_details_section/widget/rate_this_products_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RatingAndReviewsWidget extends StatelessWidget {
  const RatingAndReviewsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(12.sp)),
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
                      title: "Rating & Reviews",
                      size: 18.px,
                      fontWeight: FontWeight.w600),
                  Image.asset('assets/images/product_details2.png')
                ],
              ),
              GestureDetector(
                onTap: () {
                  showRateProduct(context);
                },
                child: buildsTextManrope(
                    title: "Rate",
                    size: 15.px,
                    fontWeight: FontWeight.w500,
                    color: primarys),
              )
            ],
          ),
          buildVspacer(2.h),
          Divider(
            thickness: 1,
            color: grey.withOpacity(0.1),
          ),
          buildVspacer(2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildsTextManrope(
                  title: "Photos", size: 17.px, fontWeight: FontWeight.w500),
              GestureDetector(
                onTap: () {
                  Get.to(() => AllPhotoScreen());
                },
                child: buildsTextManrope(
                    title: "View all >",
                    size: 14.px,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          buildVspacer(1.h),
          SizedBox(
            height: Adaptive.h(8),
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Get.to(() => ProductDetailedImageScreen());
                      },
                      child: Image.asset('assets/images/product_details3.png'));
                },
                separatorBuilder: (context, index) => buildHspacer(3.w),
                itemCount: 5),
          ),
          buildVspacer(2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildsTextManrope(
                  title: "All Reviews",
                  size: 17.px,
                  fontWeight: FontWeight.w500),
              GestureDetector(
                onTap: () {
                  Get.to(() => AllReviewScreen());
                },
                child: buildsTextManrope(
                    title: "View all >",
                    size: 14.px,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          buildVspacer(2.h),
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
                          horizontal: Adaptive.w(2), vertical: Adaptive.h(0.5)),
                      decoration: BoxDecoration(
                          border: Border.all(color: black),
                          borderRadius: BorderRadius.circular(14.sp)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                child: Image.asset('assets/images/image_product.png'),
              );
            },
          ))
        ],
      ),
    );
  }
}
