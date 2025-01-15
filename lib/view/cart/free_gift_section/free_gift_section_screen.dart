import 'package:flutter/material.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/custom_appbar.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FreeGiftScreen extends StatelessWidget {
  const FreeGiftScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Free Gifts"),
      body: Padding(
        padding: normalPadding,
        child: Column(
          children: [
            Row(
              children: [
                Image.asset('assets/images/cart1.png'),
                buildHspacer(2.w),
                buildsTextBitter(
                    title: "Gift on order above 4000",
                    size: 15.px,
                    fontWeight: FontWeight.w500)
              ],
            ),
            buildVspacer(2.h),
            _freeGiftmethod(),
            buildVspacer(2.h),
            _freeGiftmethod(),
            buildVspacer(2.h),
            _freeGiftmethod()
          ],
        ),
      ),
    );
  }

  Row _freeGiftmethod() {
    return Row(
      children: [
        Image.asset('assets/images/cart_section.png'),
        buildHspacer(3.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildsTextManrope(
                title:
                    "Jorem ipsum dolor sit amet, consectetur\nadipiscing elit.",
                size: 13.px,
                align: true,
                fontWeight: FontWeight.w500),
            buildVspacer(1.h),
            buildsTextManrope(
                title: "₹ 0", size: 13.px, fontWeight: FontWeight.w500)
          ],
        )
      ],
    );
  }
}
