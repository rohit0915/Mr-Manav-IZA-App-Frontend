import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/button_widget.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CouponScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coupons"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2.h),
            Text(
              "Apply Coupon",
              style: GoogleFonts.manrope(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 1.h),
            Row(
              children: [
                Expanded(
                  child: TextField(
                      decoration: InputDecoration(
                          hintText: "Enter Coupon Code",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            // vertical: 1.5.h,
                            horizontal: 2.w,
                          ),
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: Text(
                              "Apply",
                              style: GoogleFonts.manrope(
                                fontSize: 14.px,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ))),
                ),
                SizedBox(width: 2.w),
              ],
            ),
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
                        onChanged: (value) {
                          // Handle coupon selection
                        },
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
                          onPressed: () {
                            // Copy code logic
                          },
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
            Spacer(),
            Divider(
              thickness: 1,
              color: grey.withOpacity(0.2),
            ),
            buildVspacer(2.h),
            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  flex: 1,
                  child: CustomButton(
                    onpress: () {
                      Get.back();
                    },
                    title: "Cancel",
                    color: white,
                    borderColor: black,
                    textColor: black,
                  ),
                ),
                buildHspacer(3.w),
                Expanded(
                  flex: 1,
                  child: CustomButton(
                    onpress: () {
                      Get.back();
                    },
                    title: "Apply",
                  ),
                ),
              ],
            ),
            buildVspacer(4.h),
          ],
        ),
      ),
    );
  }
}
