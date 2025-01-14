import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/button_widget.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/custom_appbar.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/drawer/orders_section/order_details_section/order_details_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> ordersStatusList = [
      "Arriving by tomorrow",
      "Cancelled",
      "Delivered on 4th dec"
    ];
    return Scaffold(
      appBar: CustomAppBar(title: "My Orders"),
      body: Padding(
        padding: normalPadding,
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Card(
                      color: white,
                      elevation: 1,
                      surfaceTintColor: white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    buildsTextManrope(
                                      title: "Order Number",
                                      size: 12.px,
                                      color: grey.withOpacity(0.4),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    buildVspacer(1.h),
                                    buildsTextManrope(
                                      title: "1246585",
                                      size: 13.px,
                                      fontWeight: FontWeight.w500,
                                    )
                                  ],
                                ),
                                CustomButton(
                                  onpress: () {
                                    Get.to(() => OrderDetailsScreen(
                                          index: index,
                                        ));
                                  },
                                  title: "Order Details",
                                  width: Adaptive.w(35),
                                  borderColor: black,
                                  color: white,
                                  textColor: black,
                                  textSize: 15.sp,
                                )
                              ],
                            ),
                            buildVspacer(2.h),
                            Row(
                              children: [
                                Image.asset('assets/images/orderdetails1.png'),
                                buildHspacer(5.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    buildsTextManrope(
                                        title: "Preparing 1 Item ",
                                        size: 15.px,
                                        fontWeight: FontWeight.w500,
                                        color: grey.withOpacity(0.4)),
                                    buildVspacer(1.h),
                                    buildsTextManrope(
                                        title: ordersStatusList[index],
                                        size: 15.px,
                                        fontWeight: FontWeight.w600,
                                        color: ordersStatusList[index] ==
                                                "Cancelled"
                                            ? Colors.red
                                            : black)
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => buildVspacer(2.h),
                  itemCount: ordersStatusList.length),
            ),
            Container(
              height: 14.h,
              width: double.infinity,
              decoration: BoxDecoration(color: white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      orderStatusBottomSheet(context);
                    },
                    icon: Image.asset('assets/images/productsort.png'),
                    label: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildVspacer(0.5.h),
                        buildsTextManrope(
                            title: "Order Status",
                            size: 17.px,
                            fontWeight: FontWeight.w400),
                        buildsTextManrope(
                            title: "Popularity",
                            size: 11.px,
                            fontWeight: FontWeight.w400,
                            color: grey.withOpacity(0.4))
                      ],
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      orderDateBottomSheet(context);
                    },
                    icon: Image.asset('assets/images/productsort.png'),
                    label: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildVspacer(0.5.h),
                        buildsTextManrope(
                            title: "Order Date",
                            size: 17.px,
                            fontWeight: FontWeight.w400),
                        buildsTextManrope(
                            title: "Apply Filters",
                            size: 11.px,
                            fontWeight: FontWeight.w400,
                            color: grey.withOpacity(0.4))
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void orderStatusBottomSheet(BuildContext context) {
    List<String> sortList = [
      "All Status",
      "Cancelled",
      "Delivered",
      "Returned"
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
                  title: "Order Status",
                  size: 19.px,
                  fontWeight: FontWeight.w600,
                  align: true),
              ...List.generate(
                sortList.length,
                (index) {
                  return ListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: buildsTextManrope(
                        title: sortList[index],
                        size: 15.px,
                        align: true,
                        fontWeight: FontWeight.w500),
                    onTap: () {
                      // Handle Sort by Popularity
                      Navigator.pop(context); // Close the bottom sheet
                    },
                    trailing: CircleAvatar(
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
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }

  void orderDateBottomSheet(BuildContext context) {
    List<String> sortList = [
      "All Dates",
      "Recent",
      "Last 30 Days",
      "Last 6 Months",
      "Last 12 Months"
    ];
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          height: Adaptive.h(45),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildsTextManrope(
                  title: "Order Date",
                  size: 19.px,
                  fontWeight: FontWeight.w600,
                  align: true),
              ...List.generate(
                sortList.length,
                (index) {
                  return ListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: buildsTextManrope(
                        title: sortList[index],
                        size: 15.px,
                        align: true,
                        fontWeight: FontWeight.w500),
                    onTap: () {
                      // Handle Sort by Popularity
                      Navigator.pop(context); // Close the bottom sheet
                    },
                    trailing: CircleAvatar(
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
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
