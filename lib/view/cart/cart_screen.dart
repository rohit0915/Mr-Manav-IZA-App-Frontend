import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/app_titile_widget.dart';
import 'package:iza_app/utilz/button_widget.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/custom_appbar.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/offer_section/widgets/deals_of_day.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Shopping Bag (1 items)"),
      body: Padding(
        padding: normalPadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildGiftMethod(),
              buildVspacer(2.h),
              cartItemMethod(),
              buildVspacer(2.h),
              Card(
                color: white,
                elevation: 3,
                shadowColor: Colors.black38,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/cart3.png'),
                      buildHspacer(3.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildsTextManrope(title: "Coupons & Offers"),
                          buildVspacer(1.h),
                          buildsTextManrope(
                              title: "Collect now & save extra",
                              size: 13.px,
                              fontWeight: FontWeight.w500),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              buildVspacer(2.h),
              Card(
                color: white,
                elevation: 3,
                shadowColor: Colors.black38,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/cart1.png'),
                      buildHspacer(3.w),
                      buildsTextManrope(title: "Coupons & Offers")
                    ],
                  ),
                ),
              ),
              buildVspacer(2.h),
              _buildPaymentDetails(),
              buildVspacer(2.h),
              Container(
                height: Adaptive.h(9),
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(begin: Alignment.centerLeft, colors: [
                  Color(0xffFFF7F7),
                  Color.fromARGB(250, 245, 172, 233),
                  Color(0xffFFF7F7),
                ])),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/cart4.png'),
                    buildHspacer(2.w),
                    buildsTextManrope(
                      title: "Earn 500 Reward Points ",
                      size: 15.px,
                      fontWeight: FontWeight.w500,
                    ),
                    buildHspacer(1.w),
                    Icon(
                      Icons.info_outline,
                      color: grey,
                    )
                  ],
                ),
              ),
              buildVspacer(2.h),
              mainTitleWidget("Deals Of The Day"),
              buildVspacer(2.h),
              delsOfDayMethod(),
              buildVspacer(2.h),
              mainTitleWidget("People Also Bought"),
              buildVspacer(2.h),
              delsOfDayMethod()
            ],
          ),
        ),
      ),
    );
  }

  SizedBox delsOfDayMethod() {
    return SizedBox(
      height: Adaptive.h(43),
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            RxBool isFavorite = false.obs;
            return Stack(
              children: [
                Container(
                  width: Adaptive.w(45),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/offer1.png'),
                      buildVspacer(1.h),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Adaptive.w(1)),
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
                              title:
                                  "Streax Hair Serum\nEnriched With Vitamin E",
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
                            Wrap(
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
                            ),
                            buildVspacer(1.h),
                            CustomButton(
                              onpress: () {},
                              title: "Add To Bag",
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 3.w,
                  child: Obx(() {
                    return Container(
                      height: Adaptive.h(6),
                      padding: EdgeInsets.all(8.sp),
                      decoration: BoxDecoration(color: grey.withOpacity(0.2)),
                      child: Center(
                        child: GestureDetector(
                            onTap: () {
                              isFavorite.value = !isFavorite.value;
                            },
                            child: Image.asset(
                              'assets/images/offerappbar2.png',
                              color: isFavorite.value ? Colors.red : null,
                            )),
                      ),
                    );
                  }),
                )
              ],
            );
          },
          separatorBuilder: (context, index) => buildHspacer(2.w),
          itemCount: 2),
    );
  }

  Card cartItemMethod() {
    return Card(
      surfaceTintColor: white,
      color: white,
      shadowColor: Colors.black26,
      // borderRadius: BorderRadius.circular(12.sp),
      elevation: 1,
      child: Container(
        padding: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.sp),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 8.h,
                  width: 8.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage('assets/images/orderdetails1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildsTextManrope(
                        title:
                            "Streax Lorem ipsum dolor sit\namet Lorem ipsum dolor....",
                        size: 12.px,
                        align: true,
                        fontWeight: FontWeight.w500,
                      ),
                      buildsTextManrope(
                        title: "Delivery by Wed, 4 Dec",
                        size: 11.px,
                        align: true,
                        color: Colors.grey,
                      ),
                      buildVspacer(1.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // selectQuantityBottom(context);
                            },
                            child: IntrinsicWidth(
                              child: Container(
                                padding: EdgeInsets.all(8.sp),
                                decoration: BoxDecoration(
                                  border: Border.all(color: black),
                                  borderRadius: BorderRadius.circular(12.sp),
                                ),
                                child: Row(
                                  children: [
                                    buildsTextManrope(
                                      title: "Qty - 1",
                                      size: 11.px,
                                      align: true,
                                      color: Colors.black87,
                                    ),
                                    Icon(Icons.keyboard_arrow_down)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          buildsTextManrope(
                            title: "₹ 159 ",
                            size: 16.px,
                            fontWeight: FontWeight.w700,
                            align: true,
                            color: Colors.black87,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            buildVspacer(2.h),
            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(12.sp),
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 2, color: grey.withOpacity(0.1))),
                    child: Row(
                      children: [
                        Icon(Icons.delete_outline),
                        buildHspacer(2.w),
                        buildsTextManrope(
                            title: "Remove",
                            size: 14.px,
                            fontWeight: FontWeight.w500)
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(12.sp),
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 2, color: grey.withOpacity(0.1))),
                    child: Row(
                      children: [
                        Icon(Icons.favorite_border),
                        buildHspacer(2.w),
                        buildsTextManrope(
                            title: "Move to Wishlist",
                            size: 14.px,
                            fontWeight: FontWeight.w500)
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container _buildGiftMethod() {
    return Container(
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
        color: Color(0xffFADEEB),
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset('assets/images/cart1.png'),
                  buildVspacer(1.h),
                  buildsTextManrope(
                      title: "Free Gift",
                      size: 14.px,
                      fontWeight: FontWeight.w600)
                ],
              ),
              buildVspacer(1.h),
              buildsTextManrope(
                  title: "Click here to choose your free gift",
                  size: 14.px,
                  fontWeight: FontWeight.w600)
            ],
          ),
          Image.asset('assets/images/cart2.png'),
        ],
      ),
    );
  }

  Widget _buildPaymentDetails() {
    return Container(
      padding: EdgeInsets.all(16.px),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildsTextManrope(
            title: "Payment Details",
            size: 15.px,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildsTextManrope(title: "Bag Total (1 Item)", size: 13.px),
              buildsTextManrope(
                title: "₹159",
                size: 13.px,
                color: Colors.grey,
              ),
            ],
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildsTextManrope(title: "Discount on MRP", size: 13.px),
              buildsTextManrope(
                  title: "- ₹59", size: 13.px, color: Colors.green),
            ],
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildsTextManrope(title: "Shipping", size: 13.px),
              buildsTextManrope(
                title: " ₹20",
                size: 13.px,
                color: Colors.grey,
              ),
            ],
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildsTextManrope(
                title: "Total Amount",
                size: 18.px,
                fontWeight: FontWeight.w800,
              ),
              buildsTextManrope(
                title: "₹159",
                size: 18.px,
                fontWeight: FontWeight.w800,
              ),
            ],
          )
        ],
      ),
    );
  }
}
