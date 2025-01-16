import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/custom_appbar.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/drawer/orders_section/help_centre_section/get_in_touch/write_us_section/write_us_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GetInTouchScreen extends StatelessWidget {
  const GetInTouchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Get in touch"),
      body: Padding(
        padding: horizontalPadding,
        child: Column(
          children: [
            Divider(
              thickness: 2,
              color: grey.withOpacity(0.4),
            ),
            buildVspacer(1.h),
            touchMethodWidget(
                image: "touch1", title: "Call us", subtitle: "1800-53674-8566"),
            buildVspacer(2.h),
            GestureDetector (
              onTap:(){
                                Get.to(() => WriteToUsScreen());

              },
              child: touchMethodWidget(
                  image: "touch2",
                  title: "Write to us",
                  subtitle: "Qorem ipsum dolor sit "),
            ),
            buildVspacer(2.h),
            touchMethodWidget(
                image: "touch3",
                title: "Contact us on whatsapp",
                subtitle: "Qorem ipsum dolor sit ")
          ],
        ),
      ),
    );
  }

  Container touchMethodWidget(
      {required String image,
      required String title,
      required String subtitle}) {
    return Container(
      // height: Adaptive.h(10),
      padding: EdgeInsets.all(2.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Image.asset('assets/images/$image.png'),
          SizedBox(width: 4.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildsTextManrope(
                title: title,
                size: 15.px,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              if (subtitle.isNotEmpty)
                buildsTextManrope(
                  title: subtitle,
                  size: 12.px,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
