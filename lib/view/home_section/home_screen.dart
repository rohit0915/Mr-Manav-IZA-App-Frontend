import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/search_section/search_screen.dart';
import 'package:iza_app/view/wishlist_section/wishlist_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> keyhome = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildVspacer(1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                  onTap: () {
                    keyhome.currentState!.openDrawer();
                  },
                  child: Image.asset('assets/images/offerappbar1.png')),
              GestureDetector(
                onTap: () {
                  Get.to(() => SearchScreen());
                },
                child: Container(
                  height: Adaptive.h(5),
                  width: Adaptive.w(60),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.sp),
                    color: textFieldColor,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      buildHspacer(3.w),
                      buildsTextManrope(
                          title: "Search",
                          size: 14.px,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey)
                    ],
                  ),
                ),
              ),
              buildHspacer(2.w),
              GestureDetector(
                  onTap: () {
                    Get.to(() => WishlistScreen());
                  },
                  child: Image.asset('assets/images/offerappbar2.png')),
              buildHspacer(2.w),
              Image.asset('assets/images/offerappbar3.png')
            ],
          ),
        ],
      ),
    );
  }
}
