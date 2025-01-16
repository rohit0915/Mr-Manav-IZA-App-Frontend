import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HelpCenterDetailsScreen extends StatelessWidget {
  const HelpCenterDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: buildsTextManrope(
          title: "Order Related",
          size: 18.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 20.sp, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            orderExtractedMethod(),
            SizedBox(height: 2.h),
            orderExtractedMethod(),
            SizedBox(height: 2.h),

            // SizedBox(height: 2.h),
            // Second ExpansionTile
          ],
        ),
      ),
    );
  }

  Column orderExtractedMethod() {
    RxBool isClicked = false.obs;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            isClicked.value = !isClicked.value;
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildsTextManrope(
                title: "Forem ipsum dolor sit",
                size: 15.px,
                align: true,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              Obx(() {
                return Icon(
                  isClicked.value
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  size: 22.sp,
                  color: Colors.grey,
                );
              }),
            ],
          ),
        ),
        buildVspacer(1.h),
        Obx(() {
          return isClicked.value
              ? buildsTextManrope(
                  title:
                      "Detailed description goes here. Add more text to explain this item.description goes here. Add more text to explain this item.",
                  size: 14.px,
                  align: true,
                  color: Colors.grey,
                )
              : SizedBox();
        }),
      ],
    );
  }
}
