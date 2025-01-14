import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/button_widget.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/drawer/orders_section/order_details_section/cancel_order/cancel_order_item_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildprepareDelivered(BuildContext context) {
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
          title: "Delivered",
          size: 15.px,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 2.h),
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
                    title: "Streax Lorem ipsum dolor sit amet",
                    size: 12.px,
                    align: true,
                    fontWeight: FontWeight.bold,
                  ),
                  buildsTextManrope(
                    title: "Delivery by Wed, 4 Dec",
                    size: 11.px,
                    align: true,
                    color: Colors.grey,
                  ),
                  buildVspacer(1.h),
                  GestureDetector(
                    onTap: () {
                      // selectQuantityBottom(context);
                    },
                    child: buildsTextManrope(
                      title: "Qty - 1",
                      size: 11.px,
                      align: true,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 2.h),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                title: "Track Order",
                color: Colors.white,
                textColor: Colors.black,
                borderColor: Colors.black,
                onpress: () {},
              ),
            ),
            SizedBox(width: 2.w),
            Expanded(
              child: CustomButton(
                title: "Return Item",
                onpress: () {
                  Get.to(() => CancelOrderItemDisplayingScreen(title: "Return Item",));
                },
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
