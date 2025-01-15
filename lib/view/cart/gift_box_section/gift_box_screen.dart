import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iza_app/controller/cart_controller.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/button_widget.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/custom_appbar.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GiftSectionscreen extends StatelessWidget {
  const GiftSectionscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    return Scaffold(
      appBar: CustomAppBar(title: "Add Gift Box"),
      body: Padding(
        padding: normalPadding,
        child: Column(
          children: [
            Container(
              width: Adaptive.w(100),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.pink.shade50,
                    white,
                  ])),
              child: Column(
                children: [
                  Image.asset('assets/images/gift-box 1.png'),
                  buildVspacer(2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildsTextManrope(
                          title: "Gift Wrap (Rs.20)",
                          size: 16.px,
                          fontWeight: FontWeight.w500,
                          align: true),
                      CircleAvatar(
                        radius: Adaptive.w(3),
                        child: CircleAvatar(
                          radius: Adaptive.w(2.5),
                          backgroundColor: white,
                        ),
                      )
                    ],
                  ),
                  buildVspacer(2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildsTextManrope(
                          title: "Send me e- voucher",
                          size: 16.px,
                          fontWeight: FontWeight.w500,
                          align: true),
                      CircleAvatar(
                        radius: Adaptive.w(3),
                        child: CircleAvatar(
                          radius: Adaptive.w(2.5),
                          backgroundColor: white,
                        ),
                      )
                    ],
                  ),
                  buildVspacer(2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildsTextManrope(
                          title: "Rs",
                          size: 13.px,
                          fontWeight: FontWeight.w400),
                      buildsTextManrope(
                          title: "20 to 2000",
                          size: 13.px,
                          fontWeight: FontWeight.w400)
                    ],
                  ),
                  buildVspacer(2.h),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildsTextManrope(
                    title: "Send me personal Message",
                    size: 15.px,
                    fontWeight: FontWeight.w500),
                Radio(
                  value: true,
                  groupValue: true,
                  onChanged: (value) {
                    // Handle coupon selection
                  },
                  activeColor: Colors.pink,
                ),
              ],
            ),
            buildVspacer(2.h),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(12.sp)),
              child: TextField(
                // controller: _commentsController,
                maxLength: 200,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Gift Message",
                  hintStyle: GoogleFonts.manrope(
                      color: Colors.black12, fontSize: 14.px),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            buildVspacer(2.h),
            buildsTextManrope(
                title: "Terms & Condition",
                align: true,
                size: 15.px,
                fontWeight: FontWeight.w500),
            buildVspacer(1.h),
            buildsTextManrope(
              title:
                  "- Norem ipsum dolor sit amet, consectetur adipiscing\n  elit.",
              align: true,
              fontWeight: FontWeight.w300,
              size: 13.px,
            ),
            buildsTextManrope(
              title:
                  "- Norem ipsum dolor sit amet, consectetur adipiscing\n  elit.",
              align: true,
              fontWeight: FontWeight.w300,
              size: 13.px,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Adaptive.w(3), vertical: Adaptive.h(2)),
        child: CustomButton(
          onpress: () {
            cartController.isCartAddGift.value = true;
            Get.back();
          },
          title: "Proceed",
        ),
      ),
    );
  }
}
