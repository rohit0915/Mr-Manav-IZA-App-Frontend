import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/button_widget.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/view/drawer/address_section/add_new_address_section.dart/add_new_address_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({
    super.key,
    this.address = '',
    this.city = '',
    this.state = '',
    this.country = '',
    this.pincode = '',
  });

  final String address;
  final String city;
  final String state;
  final String country;
  final String pincode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Address",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 1,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add New Address Button
            GestureDetector(
              onTap: () {
                Get.to(() => AddAddressScreen());
              },
              child: Row(
                children: [
                  Icon(Icons.add, color: Colors.pink, size: 20.sp),
                  SizedBox(width: 2.w),
                  Text(
                    "Add New Address",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.pink,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h),

            // Placeholder for Address Details List
            SizedBox(
              child: ListView.separated(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Card(
                      color: white,
                      surfaceTintColor: white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.sp),
                      ),
                      elevation: 1,
                      child: Padding(
                        padding: EdgeInsets.all(3.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Name
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Harshita Gurnani ",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete_outline,
                                      color: Colors.grey),
                                  onPressed: () async {},
                                ),
                              ],
                            ),
                            SizedBox(height: 1.h),

                            // Address Details
                            Text(
                              "211/abc avenue\nKolkata - 123455, West Bengal IN",
                              style: TextStyle(
                                  fontSize: 14.sp, color: Colors.black87),
                            ),
                            SizedBox(height: 1.h),

                            // Mobile Number
                            Text(
                              "Mobile: 7364648765",
                              style: TextStyle(
                                  fontSize: 14.sp, color: Colors.black87),
                            ),
                            SizedBox(height: 2.h),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        width: 3.w,
                      ),
                  itemCount: 1),
            ),
            buildVspacer(2.h),
            // Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
              child: CustomButton(
                onpress: () {},
                title: "Edit",
              ),
            )
          ],
        ),
      ),
    );
  }
}
