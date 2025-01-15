import 'package:flutter/material.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:order_tracker_zen/order_tracker_zen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ArrivingTrackOrderScreen extends StatelessWidget {
  const ArrivingTrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Track Order"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: normalPadding,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Expected delivery by",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 0.5.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Sunday, 8th Dec",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 2.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
              decoration: BoxDecoration(
                color: Colors.pink[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dispatched",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 0.5.h),
                  Text(
                    "Last Update : Today, 10:18",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            buildVspacer(2.h),
            Image.asset('assets/images/trackorderon.png'),
            // buildv
            buildVspacer(3.h),
            _buildPaymentDetails()
          ],
        ),
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
            title: "Shipment Details",
            size: 15.px,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildsTextManrope(title: "Order ID", size: 13.px),
              buildsTextManrope(
                title: "1246585",
                size: 13.px,
                color: Colors.grey,
              ),
            ],
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildsTextManrope(title: "Placed", size: 13.px),
              buildsTextManrope(
                  title: "Tue, 3 Dec", size: 13.px, color: Colors.grey),
            ],
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildsTextManrope(title: "Delivery Partner", size: 13.px),
              buildsTextManrope(
                title: "Couirer company",
                size: 13.px,
              ),
            ],
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildsTextManrope(title: "Awb Number", size: 13.px),
              buildsTextManrope(
                title: "12243556",
                size: 13.px,
                color: Colors.grey,
              ),
            ],
          )
        ],
      ),
    );
  }
}
