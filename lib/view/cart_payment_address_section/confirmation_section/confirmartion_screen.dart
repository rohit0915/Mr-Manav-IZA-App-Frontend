import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Confirmation",
          style: TextStyle(color: Colors.black, fontSize: 18.sp),
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
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          children: [
            SizedBox(height: 2.h),
            Column(
              children: [
                Icon(
                  Icons.check_circle,
                  color: Colors.pink,
                  size: 12.w,
                ),
                SizedBox(height: 1.h),
                Text(
                  "Congratulation!",
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 0.5.h),
                Text(
                  "Your order has been placed successfully",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 3.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                orderStep("Ordered", Icons.shopping_cart, isActive: true),
                orderStep("Dispatched", Icons.local_shipping),
                orderStep("Out for delivery", Icons.delivery_dining),
                orderStep("Delivered", Icons.home),
              ],
            ),
            SizedBox(height: 3.h),
            shipmentDetails(),
            SizedBox(height: 2.h),
            rewardPoints(),
          ],
        ),
      ),
    );
  }

  Widget orderStep(String title, IconData icon, {bool isActive = false}) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: isActive ? Colors.pink : Colors.grey.shade300,
          child: Icon(icon, color: isActive ? Colors.white : Colors.black),
        ),
        SizedBox(height: 0.5.h),
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            color: isActive ? Colors.black : Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget shipmentDetails() {
    return Container(
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "SHIPMENT",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 1.h),
          Text(
            "Arriving Tomorrow wed, 4th Dec",
            style: TextStyle(fontSize: 16.sp),
          ),
          SizedBox(height: 2.h),
          Row(
            children: [
              Image.network(
                "https://via.placeholder.com/50",
                width: 12.w,
                height: 12.w,
              ),
              SizedBox(width: 3.w),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(
                    "View Details",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget rewardPoints() {
    return Container(
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "REWARD POINTS",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 1.h),
          Text(
            "500 Reward points will be credited on order delivery",
            style: TextStyle(fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
