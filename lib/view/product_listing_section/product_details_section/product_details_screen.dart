import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/app_titile_widget.dart';
import 'package:iza_app/utilz/button_widget.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/bottom_navigation/custom_bottom_navigator.dart';
import 'package:iza_app/view/home_section/home_screen.dart';
import 'package:iza_app/view/offer_section/widgets/deals_of_day.dart';
import 'package:iza_app/view/product_listing_section/product_details_section/widget/add_gst_number_widget.dart';
import 'package:iza_app/view/product_listing_section/product_details_section/widget/rating_review_widget.dart';
import 'package:iza_app/view/product_listing_section/product_details_section/widget/view_product_details_widget.dart';
import 'package:iza_app/view/wishlist_section/wishlist_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> products = [
      "assets/images/product_details1.png",
      "assets/images/product_details1.png",
      "assets/images/product_details1.png"
    ];
    PageController controller = PageController();
    RxBool isAddedToCart = false.obs;
    RxBool isViewDetails = false.obs;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back)),
        actions: [
          GestureDetector(
              onTap: () {
                Get.offAll(() => BottomNavigationScreen());
              },
              child: Image.asset('assets/images/product_home.png')),
          buildHspacer(2.w),
          GestureDetector(
              onTap: () {
                Get.to(() => WishlistScreen());
              },
              child: Image.asset('assets/images/offerappbar2.png')),
          buildHspacer(2.w),
          Image.asset('assets/images/offerappbar3.png'),
          buildHspacer(2.w),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            productImageMethod(controller, products),
            Padding(
              padding: normalPadding,
              child: Column(
                spacing: 1.h,
                children: [
                  buildsTextManrope(
                      title: "Streax",
                      size: 17.px,
                      align: true,
                      fontWeight: FontWeight.w500,
                      color: grey.withOpacity(0.4)),
                  buildsTextManrope(
                      title:
                          "Lorem ipsum dolor sit amet Lorem ipsum\ndolor sit amet",
                      size: 15.px,
                      align: true,
                      fontWeight: FontWeight.w600),
                  buildVspacer(1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildsTextManrope(
                          title: "₹ 150",
                          size: 19.px,
                          fontWeight: FontWeight.w600),
                      Text(
                        "₹ 210",
                        style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w400,
                            color: grey,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: grey),
                      ),
                      buildsTextManrope(
                          title: "(40% off)",
                          size: 17.px,
                          fontWeight: FontWeight.w400,
                          color: lightGreen),
                      buildsTextManrope(
                        title: "Inclusive of all taxes",
                        size: 14.px,
                        color: grey,
                      )
                    ],
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset('assets/images/product_details2.png')),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        showCustomBottomSheet(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Adaptive.w(3), vertical: Adaptive.h(1)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.sp),
                            color: primarys.withOpacity(0.1)),
                        child: buildsTextManrope(
                          title: "View Offers >",
                          size: 13.px,
                        ),
                      ),
                    ),
                  ),
                  buildVspacer(1.h),
                  Divider(
                    thickness: 1,
                    color: grey.withOpacity(0.3),
                  ),
                  buildVspacer(1.h),
                  GestureDetector(
                    onTap: () {
                      isViewDetails.value = !isViewDetails.value;
                    },
                    child: Container(
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
                              title: "View Product Details",
                              size: 13.px,
                              fontWeight: FontWeight.w400,
                              color: primarys),
                          Obx(() {
                            return Icon(
                              isViewDetails.value
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: primarys,
                            );
                          })
                        ],
                      ),
                    ),
                  ),
                  Obx(() {
                    return isViewDetails.value
                        ? Column(
                            children: [
                              buildVspacer(2.h),
                              FrameWidget(),
                            ],
                          )
                        : SizedBox();
                  }),
                  buildVspacer(1.h),
                  RatingAndReviewsWidget(),
                  GestureDetector(
                    onTap: () {
                      showGstDetailsBottomSheet(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Adaptive.w(2),
                        vertical: Adaptive.h(1),
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: grey.withOpacity(0.2),
                          ),
                          borderRadius: BorderRadius.circular(12.sp)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset('assets/images/product_details4.png'),
                          Column(
                            spacing: 1.h,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildsTextManrope(
                                  title: "Add GSTIN",
                                  size: 15.px,
                                  fontWeight: FontWeight.w500),
                              buildsTextManrope(
                                  title:
                                      "Claim GST credit of 28% on this product",
                                  size: 12.px,
                                  fontWeight: FontWeight.w400,
                                  align: true,
                                  color: grey)
                            ],
                          ),
                          Icon(Icons.keyboard_arrow_right)
                        ],
                      ),
                    ),
                  ),
                  buildVspacer(1.h),
                  buildsTextManrope(
                      title: "Brands in this category",
                      size: 17.px,
                      fontWeight: FontWeight.w600,
                      align: true),
                  buildVspacer(1.h),
                  SizedBox(
                    height: Adaptive.h(8),
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Image.asset('assets/images/product_logo.png');
                        },
                        separatorBuilder: (context, index) => buildHspacer(3.w),
                        itemCount: 5),
                  ),
                  buildVspacer(2.h),
                  mainTitleWidget("Recently Viewed"),
                  dealsOfDay(),
                  mainTitleWidget("Similar Product"),
                  dealsOfDay(),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: Adaptive.w(100),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(
                thickness: 2,
                color: Colors.grey.withOpacity(0.2),
              ),
              buildVspacer(2.h),
              Row(
                children: [
                  Image.asset('assets/images/product_bottom2.png'),
                  buildHspacer(2.w),
                  Image.asset('assets/images/product_bottom1.png'),
                  buildHspacer(2.w),
                  Expanded(
                    child: SizedBox(
                      height: Adaptive.h(7),
                      child: Obx(() {
                        return ElevatedButton(
                          onPressed: () {
                            isAddedToCart.value = !isAddedToCart.value;
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black, // Replaces `primary`
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(color: Colors.black),
                            ),
                            minimumSize: const Size(
                                double.infinity, 50), // Ensures button size
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/cart_product.png'),
                              buildHspacer(3.w),
                              isAddedToCart.value
                                  ? Text(
                                      'View Cart',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.px,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  : Text(
                                      'Add to Cart',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.px,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                            ],
                          ),
                        );
                      }),
                    ),
                  )
                ],
              ),
              buildVspacer(1.h),
            ],
          ),
        ),
      ),
    );
  }

  void showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.4, // 40% of the screen height
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Container(
                    width: 10.w,
                    height: 0.5.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                buildsTextManrope(
                    title: "Coupons & Offers",
                    size: 18.px,
                    fontWeight: FontWeight.w500,
                    align: true),
                SizedBox(height: 2.h),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.pink.shade50, white])),
                  padding: EdgeInsets.all(3.w),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Radio(
                            value: false,
                            groupValue: true,
                            onChanged: (value) {},
                            activeColor: Colors.pink,
                          ),
                          SizedBox(width: 2.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 5.w,
                                        child: Image.asset(
                                            'assets/images/coupon.png')),
                                    SizedBox(width: 2.w),
                                    Expanded(
                                      child: Text(
                                        "Get extra 10% off on all Orders",
                                        style: GoogleFonts.manrope(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 1.h),
                      Container(
                        height: 6.h,
                        padding: EdgeInsets.all(1.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade100),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "iza123",
                              style: GoogleFonts.manrope(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.copy,
                                size: 16.sp,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                CustomButton(
                  onpress: () {
                    Get.back();
                  },
                  title: "Apply",
                )
              ],
            ),
          ),
        );
      },
    );
  }

  SizedBox productImageMethod(
      PageController controller, List<String> products) {
    return SizedBox(
      height: 329.px,
      child: PageView.builder(
        controller: controller,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: horizontalPadding,
                child: Image.asset(
                  products[index],
                ),
              ),
              Positioned(
                bottom: Adaptive.h(2),
                child: SmoothPageIndicator(
                  controller: controller,
                  count: products.length,
                  axisDirection: Axis.horizontal,
                  effect: WormEffect(
                      dotWidth: Adaptive.w(2),
                      dotHeight: Adaptive.h(1),
                      activeDotColor: primarys),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
