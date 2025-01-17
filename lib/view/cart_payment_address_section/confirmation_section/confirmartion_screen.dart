import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/view/drawer/orders_section/order_details_section/order_details_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackground,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Confirmation",
          style: GoogleFonts.manrope(color: Colors.black, fontSize: 18.sp),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: Column(
          children: [
            SizedBox(height: 2.h),
            Container(
              width: Adaptive.w(100),
              decoration: BoxDecoration(color: white),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/confirmation1.png',
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    "Congratulation!",
                    style: GoogleFonts.manrope(
                      color: Colors.pink,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 0.5.h),
                  Text(
                    "Your order has been placed successfully",
                    style: GoogleFonts.manrope(
                      color: Colors.grey,
                      fontSize: 16.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 3.h),
                  Flex(
                    direction: Axis.horizontal,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 1,
                          child: orderStep(
                            "confirmation2",
                          )),
                      Expanded(flex: 1, child: orderStep("confirmation3")),
                      Expanded(flex: 1, child: orderStep("confirmation4")),
                      Expanded(flex: 1, child: orderStep("confirmation5")),
                    ],
                  ),
                  // buildVspacer(1.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Adaptive.w(4)),
                    child: Image.asset('assets/images/confirmation6.png'),
                  ),
                  buildVspacer(1.h),
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(flex: 1, child: orderStep2("Ordered")),
                      buildHspacer(3.w),
                      Expanded(flex: 1, child: orderStep2("Dispatched")),
                      buildHspacer(3.w),
                      Expanded(flex: 1, child: orderStep2("Out for\ndelivery")),
                      buildHspacer(3.w),
                      Expanded(flex: 1, child: orderStep2("Delivered"))
                    ],
                  ),
                  buildVspacer(3.h),
                ],
              ),
            ),
            SizedBox(height: 3.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "SHIPMENT",
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
            ),
            SizedBox(height: 2.h),
            shipmentDetails(),
            buildVspacer(2.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "REWARD POINTS",
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
            ),
            SizedBox(height: 2.h),
            rewardPoints(),
          ],
        ),
      ),
    );
  }

  Widget orderStep(
    String icon,
  ) {
    return Image.asset('assets/images/$icon.png');
  }

  Widget orderStep2(String title) {
    return Text(title,
        textAlign: TextAlign.center,
        style: GoogleFonts.manrope(fontSize: 14.sp, color: Colors.black));
  }

  Widget shipmentDetails() {
    return Container(
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1.h),
          Text(
            "Arriving Tomorrow wed, 4th Dec",
            style: GoogleFonts.manrope(fontSize: 16.sp),
          ),
          SizedBox(height: 2.h),
          Row(
            children: [
              Image.asset(
                "assets/images/orderdetails1.png",
                width: 12.w,
                height: 12.w,
              ),
              SizedBox(width: 3.w),
            ],
          ),
          buildVspacer(1.h),
          SizedBox(
            width: Adaptive.w(90),
            child: ElevatedButton(
              onPressed: () {
                Get.offAll(() => OrderDetailsScreen(
                      index: 0,
                    ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text(
                "View Details",
                style: GoogleFonts.manrope(fontSize: 16.sp, color: white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget rewardPoints() {
    return Container(
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1.h),
          Text(
            "500 Reward points will be credited on order delivery",
            style: GoogleFonts.manrope(fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
