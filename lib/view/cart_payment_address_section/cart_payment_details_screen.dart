import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/button_widget.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/cart_payment_address_section/payment_section/payment_screen.dart';
import 'package:iza_app/view/drawer/payment_section/payment_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CartAddressChangingScreen extends StatelessWidget {
  const CartAddressChangingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, size: 20.sp, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: buildsTextManrope(
            title: "Address",
            size: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Address Section
                _buildAddress(),
                SizedBox(height: 2.h),
                // Delivery Section
                Container(
                  padding: EdgeInsets.all(3.w),
                  decoration: BoxDecoration(
                      gradient:
                          LinearGradient(colors: [Color(0xffFADEEB), white])),
                  child: Row(
                    children: [
                      Image.asset('assets/images/delivary.png'),
                      SizedBox(width: 3.w),
                      buildsTextManrope(
                        title: "Delivery by Wed, 4 Dec",
                        size: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      Spacer(),
                      buildsTextManrope(
                        title: "Item (1)",
                        size: 14.sp,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                // Item Details Section
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 12.w,
                      height: 12.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/orderdetails1.png'), // Replace with your image
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
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                // Price Details Section
                Container(
                  padding: EdgeInsets.all(1.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildsTextManrope(
                        title: "Price Details",
                        size: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildsTextManrope(title: "Bag Total (1 Item)"),
                          buildsTextManrope(
                            title: "₹159",
                            size: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildsTextManrope(title: "Discount on MRP"),
                          buildsTextManrope(
                            title: "- ₹59",
                            size: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.green,
                          ),
                        ],
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildsTextManrope(title: "Shipping"),
                          buildsTextManrope(
                            title: "₹20",
                            size: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      Divider(
                          thickness: 1, color: Colors.grey.withOpacity(0.4)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildsTextManrope(
                            title: "Total Amount",
                            size: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          buildsTextManrope(
                            title: "₹159",
                            size: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildsTextManrope(
                            title: "₹ 159",
                            size: 19.px,
                            fontWeight: FontWeight.w600),
                        buildVspacer(1.h),
                        buildsTextManrope(
                            title: "Grand Total",
                            size: 18.px,
                            fontWeight: FontWeight.w600),
                      ],
                    ),
                    buildHspacer(5.w),
                    Expanded(
                      child: CustomButton(
                        onpress: () {
                          Get.to(() => CartPaymentScreen());
                        },
                        title: "Proceed to pay",
                      ),
                    )
                  ],
                ),
                buildVspacer(1.h),
              ],
            ),
          ),
        ));
  }

  Widget _buildAddress() {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildsTextManrope(
                title: "Address",
                size: 15.px,
                fontWeight: FontWeight.bold,
              ),
              Row(
                children: [
                  buildsTextManrope(
                    title: "Change ",
                    size: 12.px,
                    fontWeight: FontWeight.bold,
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: 20.sp,
                  )
                ],
              ),
            ],
          ),
          buildsTextManrope(
            title: "Harshita Gurnani",
            size: 14.px,
            fontWeight: FontWeight.w500,
          ),
          buildsTextManrope(
            title:
                "211/abc avenue Kolkata - 123455, West Bengal IN\nMobile: 7364648765",
            size: 12.px,
            align: true,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
