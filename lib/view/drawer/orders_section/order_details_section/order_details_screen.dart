import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/button_widget.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/drawer/orders_section/help_centre_section/help_centre_screen.dart';
import 'package:iza_app/view/drawer/orders_section/order_details_section/cancel_order/cancel_order_item_screen.dart';
import 'package:iza_app/view/drawer/orders_section/order_details_section/track_order_of_arriving/arriving_track_order.dart';
import 'package:iza_app/view/drawer/orders_section/order_details_section/widgets/order_details_widget.dart';
import 'package:iza_app/view/drawer/orders_section/orders_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderDetailsScreen extends StatelessWidget {
  OrderDetailsScreen({super.key, required this.index});
  final int index;
  RxBool isClicked = false.obs;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.off(() => OrdersScreen());
        return Future.value(false);
      },
      child: Scaffold(
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
          padding: normalPadding,
          child: SingleChildScrollView(
              child: index == 0
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildOrderInfo(),
                        SizedBox(height: 2.h),
                        _buildShippingAddress(),
                        SizedBox(height: 2.h),
                        _buildPreparingItem(context),
                        SizedBox(height: 2.h),
                        _buildPaymentDetails(),
                        Obx(() {
                          return isClicked.value
                              ? Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Adaptive.w(5)),
                                  child: CustomButton(
                                    title: "Need Help ?",
                                    color: Colors.white,
                                    textColor: Colors.black,
                                    borderColor: Colors.black,
                                    onpress: () {
                                      Get.to(() => HelpCenterScreen());
                                    },
                                  ),
                                )
                              : Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Adaptive.w(5)),
                                  child: CustomButton(
                                    title: "Cancel Order",
                                    color: Colors.white,
                                    textColor: Colors.black,
                                    borderColor: Colors.black,
                                    onpress: () {},
                                  ),
                                );
                        }),
                      ],
                    )
                  : index == 1
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildOrderInfo(),
                            SizedBox(height: 2.h),
                            _buildShippingAddress(),
                            SizedBox(height: 2.h),
                            _buildPreparingCancelItem(context),
                            SizedBox(height: 2.h),
                            _buildPaymentDetails(),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildOrderInfo(),
                            SizedBox(height: 2.h),
                            _buildShippingAddress(),
                            SizedBox(height: 2.h),
                            buildprepareDelivered(context),
                            SizedBox(height: 2.h),
                            _buildPaymentDetails(),
                            buildVspacer(2.h),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomButton(
                                    title: "Need Help ?",
                                    color: Colors.white,
                                    textColor: Colors.black,
                                    borderColor: Colors.black,
                                    onpress: () {
                                      Get.to(() => HelpCenterScreen());
                                    },
                                    textSize: 15.sp,
                                  ),
                                ),
                                SizedBox(width: 2.w),
                                Expanded(
                                  child: CustomButton(
                                    title: "Download Invoices",
                                    color: Colors.white,
                                    textColor: Colors.black,
                                    borderColor: Colors.black,
                                    textSize: 15.sp,
                                    onpress: () {},
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
        ),
      ),
    );
  }

  Widget _buildOrderInfo() {
    return GestureDetector(
      onTap: () {
        isClicked.value = true;
      },
      child: Container(
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

  Widget _buildPreparingItem(BuildContext context) {
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
                      title: "Delivery by Wed, 4 Dec",
                      size: 11.px,
                      align: true,
                      color: Colors.grey,
                    ),
                    buildVspacer(1.h),
                    GestureDetector(
                      onTap: () {
                        selectQuantityBottom(context);
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
          Obx(() {
            return isClicked.value
                ? Column(
                    children: [
                      CustomButton(
                        title: "Track Order",
                        color: Colors.white,
                        textColor: Colors.black,
                        borderColor: Colors.black,
                        onpress: () {
                          Get.to(() => ArrivingTrackOrderScreen());
                        },
                      ),
                      buildVspacer(2.h),
                      CustomButton(
                        title: "Download Invoice",
                        color: Colors.white,
                        textColor: Colors.black,
                        borderColor: Colors.black,
                        onpress: () {
                          Get.to(() => ArrivingTrackOrderScreen());
                        },
                      ),
                    ],
                  )
                : Row(
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
                            Get.to(() => CancelOrderItemDisplayingScreen(
                                  title: "Cancel Item",
                                ));
                          },
                        ),
                      ),
                    ],
                  );
          }),
        ],
      ),
    );
  }

  Widget _buildPreparingCancelItem(BuildContext context) {
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
            title: "Cancelled",
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
                        selectQuantityBottom(context);
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
          CustomButton(
            title: "Need Help ?",
            color: Colors.white,
            textColor: Colors.black,
            borderColor: Colors.black,
            onpress: () {
              Get.to(() => HelpCenterScreen());
            },
          ),
        ],
      ),
    );
  }

  void selectQuantityBottom(BuildContext context) {
    List<String> sortList = [
      "1",
      "2",
      "3",
      "4",
    ];
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildsTextManrope(
                  title: "Select Quantity",
                  size: 19.px,
                  fontWeight: FontWeight.w600,
                  align: true),
              ...List.generate(
                sortList.length,
                (index) {
                  return ListTile(
                    contentPadding: EdgeInsets.all(0),
                    leading: CircleAvatar(
                      radius: Adaptive.w(3),
                      backgroundColor: black,
                      child: Center(
                        child: CircleAvatar(
                          radius: 2.5.w,
                          backgroundColor: white,
                          child: Center(
                            child: CircleAvatar(
                              radius: Adaptive.w(1.6),
                              backgroundColor: index == 0 ? primarys : grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: buildsTextManrope(
                        title: sortList[index],
                        size: 15.px,
                        align: true,
                        fontWeight: FontWeight.w500),
                    onTap: () {
                      Navigator.pop(context); // Close the bottom sheet
                    },
                  );
                },
              )
            ],
          ),
        );
      },
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
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildsTextManrope(
                  title: "Total Amount",
                  size: 14.px,
                  fontWeight: FontWeight.w600),
              buildsTextManrope(
                title: "₹20",
                size: 14.px,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ],
          )
        ],
      ),
    );
  }
}
