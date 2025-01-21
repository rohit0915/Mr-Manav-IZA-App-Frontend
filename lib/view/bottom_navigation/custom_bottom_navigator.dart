import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iza_app/controller/bottom_controller.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/category_section/category_screen.dart';
import 'package:iza_app/view/chat_bot_section/chat_bot_screen.dart';
import 'package:iza_app/view/home_section/home_screen.dart';
import 'package:iza_app/view/offer_section/offer_screen.dart';
import 'package:iza_app/view/stream/stream_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../login_section/login_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  final controller = Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetOptions = [
      HomeScreen(),
      CategoryScreen(),
      ChatBotScreen(),
      OfferScreen(),
      StreamScreen(),
    ];

    return Scaffold(
      body: Obx(() {
        return widgetOptions.elementAt(controller.currentIndex.value);
      }),
      bottomNavigationBar: Obx(() {
        return Container(
        
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(
              vertical: Adaptive.h(1.2)), // Padding around Row
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem('assets/images/bottom0.png', 0, "Home"),
              _buildNavItem('assets/images/bottom1.png', 1, "Shop"),
              _buildNavItem('assets/images/bottom2.png', 2, "ChatBot"),
              _buildNavItem('assets/images/bottom3.png', 3, "Offers"),
              _buildNavItem('assets/images/bottom4.png', 4, "Stream"),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildNavItem(String assetPath, int index, String title) {
    return GestureDetector(
      onTap: () {
        log("Tapped on item: $index");

        controller.currentIndex.value = index;
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            assetPath,
            color: controller.currentIndex.value == index
                ? primarys
                : Colors.black,
            height: 24.sp,
            width: 24.sp,
          ),
          buildVspacer(1.h),
          buildsTextManrope(
            title: title,
            size: 11.px,
            fontWeight: FontWeight.w400,
            color: controller.currentIndex.value == index
                ? primarys
                : Colors.black,
          )
          // SizedBox(height: 5), // Space between icon and indicator
        ],
      ),
    );
  }
}
