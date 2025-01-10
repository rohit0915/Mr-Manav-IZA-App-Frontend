import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iza_app/controller/product_listing_controller.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/button_widget.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
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
                    Obx(() {
                      return Column(
                        children: [
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
                                        isSelect.value = true;
                                        controller.isItemSelected.value = true;
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
                                  : CustomButton(
                                      onpress: () {
                                        isSelect.value = true;
                                        controller.isItemSelected.value = true;
                                      },
                                      title: "Select Shade",
                                    )
                        ],
                      );
                    })
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
}
