import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iza_app/controller/product_listing_controller.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/button_widget.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/product_listing_section/product_details_section/product_details_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductCard extends StatelessWidget {
  ProductCard({super.key, required this.index});
  final int index;

  RxBool isSelect = false.obs;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductListingConroller());

    return Stack(
      children: [
        Container(
          width: Adaptive.w(45),
          decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/offer1.png'),
              buildVspacer(1.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Adaptive.w(1)),
                child: Column(
                  children: [
                    buildsTextManrope(
                      title: "Streax",
                      size: 13.px,
                      fontWeight: FontWeight.w300,
                      align: true,
                      color: textGreyColor,
                    ),
                    buildVspacer(1.h),
                    buildsTextManrope(
                      title: "Streax Hair Serum\nEnriched With Vitamin E",
                      size: 12.px,
                      align: true,
                      fontWeight: FontWeight.w500,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildsTextBitter(
                            title: "₹ 150",
                            size: 15.px,
                            fontWeight: FontWeight.w700),
                        Text(
                          "₹ 299",
                          style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w700,
                              fontSize: 16.px,
                              decoration: TextDecoration.overline,
                              decorationColor: grey,
                              color: grey),
                        ),
                        buildsTextManrope(
                            title: "40% off",
                            size: 12.px,
                            fontWeight: FontWeight.w500,
                            color: lightGreen)
                      ],
                    ),
                    buildVspacer(1.h),
                    index % 2 == 0
                        ? Wrap(
                            direction: Axis.horizontal,
                            // runSpacing: 2.h,
                            spacing: 3.w,
                            children: [
                              IntrinsicWidth(
                                child: Container(
                                  height: 3.h,
                                  padding: EdgeInsets.all(5.sp),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: textFieldColor,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(12.sp)),
                                  child: Center(
                                    child: buildsTextManrope(
                                        title: "30 ml", color: grey),
                                  ),
                                ),
                              ),
                              IntrinsicWidth(
                                child: Container(
                                  height: 3.h,
                                  padding: EdgeInsets.all(5.sp),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: textFieldColor,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(12.sp)),
                                  child: Center(
                                    child: buildsTextManrope(
                                        title: "30 ml", color: grey),
                                  ),
                                ),
                              )
                            ],
                          )
                        : Image.asset('assets/images/offerColor.png'),
                    buildVspacer(1.h),
                    Column(
                        children: [
                          if (index == 0 ||
                              index == 1) // For the 1st and 2nd items
                            index % 2 == 0
                                ? isSelect.value
                                    ? Container(
                                        height: Adaptive.h(6),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.sp),
                                          border: Border.all(color: black),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Icon(Icons.add),
                                            buildsTextManrope(
                                                title: "1",
                                                size: 15.px,
                                                fontWeight: FontWeight.w600),
                                            Icon(Icons.remove),
                                          ],
                                        ),
                                      )
                                    : CustomButton(
                                        onpress: () {
                                          controller.isItemSelected.value =
                                              true;
                                          showSizeBottomSheet(context);
                                        },
                                        title: "Select Size",
                                      )
                                : isSelect.value
                                    ? Container(
                                        height: Adaptive.h(6),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.sp),
                                          border: Border.all(color: black),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Icon(Icons.add),
                                            buildsTextManrope(
                                                title: "1",
                                                size: 15.px,
                                                fontWeight: FontWeight.w600),
                                            Icon(Icons.remove),
                                          ],
                                        ),
                                      )
                                    : isSelect.value
                                        ? Container(
                                            height: Adaptive.h(6),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12.sp),
                                              border: Border.all(color: black),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Icon(Icons.add),
                                                buildsTextManrope(
                                                    title: "1",
                                                    size: 15.px,
                                                    fontWeight:
                                                        FontWeight.w600),
                                                Icon(Icons.remove),
                                              ],
                                            ),
                                          )
                                        : CustomButton(
                                            onpress: () {
                                              // isSelect.value = true;
                                              controller.isItemSelected.value =
                                                  true;
                                              showShadeSelectionBottomSheet(
                                                  context);
                                            },
                                            title: "Select Shade",
                                          )
                          else // For all other items
                            CustomButton(
                              onpress: () {
                                // Add to Cart logic
                                controller.isItemSelected.value = true;
                              },
                              title: "Add to Cart",
                            ),
                        ],
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 3.w,
          child: Container(
            height: Adaptive.h(6),
            padding: EdgeInsets.all(8.sp),
            decoration: BoxDecoration(color: grey.withOpacity(0.2)),
            child: Center(
              child: GestureDetector(
                  onTap: () {
                    //  isFavorite.value=!isFavorite.value;
                  },
                  child: Image.asset(
                    'assets/images/offerappbar2.png',
                    color: Colors.red,
                  )),
            ),
          ),
        )
      ],
    );
  }

  void showSizeBottomSheet(BuildContext context) {
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
        return Padding(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildsTextManrope(
                      title: "Select Size",
                      size: 15.px,
                      fontWeight: FontWeight.w500),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => ProductDetailsScreen());
                    },
                    child: buildsTextManrope(
                        title: "View Details",
                        color: primarys,
                        size: 15.px,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              buildVspacer(1.h),
              Row(
                // runSpacing: 2.h,
                spacing: 3.w,
                children: [
                  IntrinsicWidth(
                    child: Container(
                      height: 4.h,
                      padding: EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: grey,
                          ),
                          borderRadius: BorderRadius.circular(12.sp)),
                      child: Center(
                        child: buildsTextManrope(title: "30 ml", color: grey),
                      ),
                    ),
                  ),
                  IntrinsicWidth(
                    child: Container(
                      height: 4.h,
                      padding: EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: grey,
                          ),
                          borderRadius: BorderRadius.circular(12.sp)),
                      child: Center(
                        child: buildsTextManrope(title: "30 ml", color: grey),
                      ),
                    ),
                  )
                ],
              ),
              buildVspacer(1.h),
              Row(
                children: [
                  Image.asset('assets/images/product_bottom1.png'),
                  buildHspacer(2.w),
                  Expanded(
                    child: SizedBox(
                        height: Adaptive.h(7),
                        child: ElevatedButton(
                          onPressed: () {
                            // isAddedToCart.value = !isAddedToCart.value;
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
                              Text(
                                'Add to Cart',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.px,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        )),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void showShadeSelectionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Drag Handle
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

              // Header Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildsTextManrope(
                    title: "Select Shade",
                    size: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Add View Details Action
                    },
                    child: buildsTextManrope(
                      title: "View Details",
                      size: 14.sp,
                      color: Colors.pink,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),

              // Shade Grid
              SizedBox(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  itemCount: 6, // Number of shades
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 15.w,
                          height: 15.w,
                          decoration: const BoxDecoration(
                            color: Colors.brown, // Replace with dynamic colors
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(height: 1.h),
                        buildsTextManrope(
                          title: "34n Pecan",
                          size: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 3.h),
              Row(
                children: [
                  Image.asset('assets/images/product_bottom1.png'),
                  buildHspacer(2.w),
                  Expanded(
                    child: SizedBox(
                        height: Adaptive.h(7),
                        child: ElevatedButton(
                          onPressed: () {
                            // isAddedToCart.value = !isAddedToCart.value;
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
                              Text(
                                'Add to Cart',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.px,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        )),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
