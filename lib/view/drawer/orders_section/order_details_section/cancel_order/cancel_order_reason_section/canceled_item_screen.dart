import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/button_widget.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/custom_appbar.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/bottom_navigation/custom_bottom_navigator.dart';
import 'package:iza_app/view/drawer/orders_section/order_details_section/order_details_screen.dart';
import 'package:iza_app/view/drawer/orders_section/orders_screen.dart';
import 'package:iza_app/view/drawer/orders_section/track_order_section/track_order_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CanceledItemScreen extends StatelessWidget {
  const CanceledItemScreen({super.key, required this.isCancelled});
  final bool isCancelled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Cancelled"),
      body: Padding(
        padding: normalPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset('assets/lottie/lottieofcancel.json',
                height: 136.px, width: 136.px, fit: BoxFit.fill),
            Center(
              child: buildsTextManrope(
                  title: isCancelled ? "1 Item Cancelled" : "Return scheduled",
                  size: 17.px,
                  fontWeight: FontWeight.w600),
            ),
            buildVspacer(2.h),
            buildsTextManrope(
                title:
                    "Refund amount (if any ) will be processed to\nyour source account within 3- 5 days",
                size: 14.px,
                fontWeight: FontWeight.w400,
                color: grey)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Adaptive.w(3), vertical: Adaptive.h(2)),
        child: CustomButton(
          title: "Okay, Got it",
          onpress: () {
            Get.offAll(() => BottomNavigationScreen());
            Get.to(() => OrdersScreen());
          },
        ),
      ),
    );
  }
}
