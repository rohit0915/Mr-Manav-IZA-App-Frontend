import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/button_widget.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/drawer/orders_section/order_details_section/cancel_order/cancel_order_item_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: buildsTextManrope(
          title: "My Orders",
          size: 17.px,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        actions: [
          Image.asset('assets/images/orderdetails.png'),
          buildHspacer(3.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.px),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildOrderInfo(),
              SizedBox(height: 2.h),
              _buildShippingAddress(),
              SizedBox(height: 2.h),
              _buildPreparingItem(),
              SizedBox(height: 2.h),
              _buildPaymentDetails(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderInfo() {
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildsTextManrope(
                  title: "ORDER NUMBER",
                  color: grey,
                  fontWeight: FontWeight.w600,
                  size: 13.px),
              buildsTextManrope(
                  title: "1246585",
                  color: black,
                  fontWeight: FontWeight.w700,
                  size: 13.px),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildsTextManrope(
                  title: "PLACED",
                  color: grey,
                  fontWeight: FontWeight.w600,
                  size: 13.px),
              buildsTextManrope(
                  title: "Tue, 3 Dec",
                  color: black,
                  fontWeight: FontWeight.w700,
                  size: 13.px),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildsTextManrope(
                  title: "TOTAL",
                  color: grey,
                  fontWeight: FontWeight.w600,
                  size: 13.px),
              buildsTextManrope(
                  title: "₹159",
                  color: black,
                  fontWeight: FontWeight.w700,
                  size: 13.px),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildShippingAddress() {
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
                title: "Shipping Address",
                size: 15.px,
                fontWeight: FontWeight.bold,
              ),
              Image.asset('assets/images/review.png')
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

  Widget _buildPreparingItem() {
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
            title: "Preparing 1 item",
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
                      title: "Delivery by Wed, 4 Dec\nQty - 1",
                      size: 11.px,
                      align: true,
                      color: Colors.grey,
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
                  title: "Need Help ?",
                  color: Colors.white,
                  textColor: Colors.black,
                  borderColor: Colors.black,
                  onpress: () {},
                ),
              ),
              SizedBox(width: 2.w),
              Expanded(
                child: CustomButton(
                  title: "Cancel Item",
                  onpress: () {
                    Get.to(()=>CancelOrderItemDisplayingScreen());
                  },
                ),
              ),
            ],
          ),
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
              buildsTextManrope(title: "Payment Method", size: 13.px),
              buildsTextManrope(
                title: "COD",
                size: 13.px,
                color: Colors.grey,
              ),
            ],
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildsTextManrope(title: "Subtotal (Inclusive tax)", size: 13.px),
              buildsTextManrope(title: "₹159", size: 13.px, color: Colors.grey),
            ],
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildsTextManrope(title: "Discount", size: 13.px),
              buildsTextManrope(
                title: "- ₹59",
                size: 13.px,
                color: Colors.green,
              ),
            ],
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildsTextManrope(title: "Shipping Charges", size: 13.px),
              buildsTextManrope(
                title: "₹20",
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
