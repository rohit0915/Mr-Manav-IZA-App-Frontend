// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iza_app/controller/product_listing_controller.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import 'widgets/product_listing_screen.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductListingConroller());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back button
          },
        ),
        title: Text(
          "Face",
          style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Handle search
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite_outline, color: Colors.black),
            onPressed: () {
              // Handle favorites
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {
              // Handle cart
            },
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              // Banner
              Container(
                width: double.infinity,
                color: Colors.pink[50],
                padding: EdgeInsets.all(2.h),
                child: Text(
                  "Enjoy Rs.1000 off. Use code : 12345",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 14.sp),
                ),
              ),
              // Product Grid Section
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 2.h),
                        // Product Count
                        Text(
                          "Showing all products (1234 Items)",
                          style:
                              TextStyle(fontSize: 14.sp, color: Colors.black),
                        ),
                        SizedBox(height: 2.h),
                        // Product Grid
                        GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 6, // Change this count as needed
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 4,
                            crossAxisSpacing: 2.w,
                            mainAxisSpacing: 2.h,
                          ),
                          itemBuilder: (context, index) {
                            return ProductCard(
                              index: index,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                height: Adaptive.h(10),
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        sortBottomSheet(context);
                      },
                      icon: Image.asset('assets/images/productsort.png'),
                      label: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildVspacer(0.5.h),
                          buildsTextManrope(
                              title: "Sort",
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
                      onPressed: () {},
                      icon: Image.asset('assets/images/productfilter.png'),
                      label: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildVspacer(0.5.h),
                          buildsTextManrope(
                              title: "Filter",
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
                  ],
                ),
              ),
            ],
          ),
          Obx(() {
            return controller.isItemSelected.value
                ? Padding(
                    padding: EdgeInsets.only(bottom: Adaptive.h(12)),
                    child: Container(
                      width: Adaptive.w(90),
                      height: Adaptive.h(5),
                      decoration: BoxDecoration(
                        color: black,
                        borderRadius: BorderRadius.circular(12.sp),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: Adaptive.w(4)),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              buildsTextManrope(
                                  title: "Amount:",
                                  size: 13.px,
                                  fontWeight: FontWeight.w300,
                                  color: white),
                              buildHspacer(2.w),
                              buildsTextManrope(
                                  title: "₹ 159 ",
                                  size: 13.px,
                                  fontWeight: FontWeight.w600,
                                  color: white)
                            ],
                          ),
                          Spacer(),
                          buildsTextManrope(
                              title: "View cart",
                              size: 14.px,
                              fontWeight: FontWeight.w600,
                              color: white)
                        ],
                      ),
                    ),
                  )
                : SizedBox();
          })
        ],
      ),
      // bottomNavigationBar: // Sort and Filter Section
    );
  }

  void sortBottomSheet(BuildContext context) {
    List<String> sortList = [
      "Popularity",
      "Price Low to High",
      "Price High to Low",
      "New Arrivals"
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
                  title: "Sort by",
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
