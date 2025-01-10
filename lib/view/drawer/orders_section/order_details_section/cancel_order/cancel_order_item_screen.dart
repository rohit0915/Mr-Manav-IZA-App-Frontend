import 'package:flutter/material.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/button_widget.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/custom_appbar.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CancelOrderItemDisplayingScreen extends StatelessWidget {
  const CancelOrderItemDisplayingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Return Item"),
      body: Padding(
        padding: normalPadding,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.px),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 6,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildsTextManrope(
                    title: "Select item",
                    size: 15.px,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 8.h,
                        width: 8.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image:
                                AssetImage('assets/images/orderdetails1.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildsTextManrope(
                              title: "Streax Lorem ipsum dolor sit amet",
                              size: 12.px,
                              align: true,
                              fontWeight: FontWeight.bold,
                            ),
                            buildsTextManrope(
                              title: "Delivery by Wed, 4 Dec\nQty - 1",
                              size: 11.px,
                              align: true,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            thickness: 2,
            color: grey.withOpacity(0.1),
          ),
          buildVspacer(3.h),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Adaptive.w(5), vertical: Adaptive.h(2)),
            child: CustomButton(
              onpress: () {},
            ),
          ),
        ],
      ),
    );
  }
}
