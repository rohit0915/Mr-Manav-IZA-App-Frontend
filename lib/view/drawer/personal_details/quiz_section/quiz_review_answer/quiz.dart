import 'package:flutter/material.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/button_widget.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/utilz/custom_appbar.dart';

class QuizReviewSectionScreen extends StatelessWidget {
  const QuizReviewSectionScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Build My Profile",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildsTextManrope(
              title: "Review answers",
              size: 16.px,
              fontWeight: FontWeight.w600,
              align: true,
            ),
            SizedBox(height: 2.h),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 2.h),
                    padding: EdgeInsets.all(2.h),
                    decoration: BoxDecoration(
                      color: Colors.pink.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10.px),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildsTextManrope(
                              title: "My skin type",
                              size: 14.px,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            SizedBox(height: 1.h),
                            buildsTextManrope(
                              title: "Oily & Greasy (1/5)",
                              size: 12.px,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[600],
                            ),
                          ],
                        ),
                        Image.asset('assets/images/review.png')
                      ],
                    ),
                  );
                },
              ),
            ),
            Divider(
              color: grey,
              thickness: 1,
            ),
            buildVspacer(2.h),
            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  child: CustomButton(
                    onpress: () {},
                    title: "Go back",
                    color: white,
                    textColor: black,
                  ),
                ),
                buildHspacer(3.w),
                Expanded(
                  child: CustomButton(
                    onpress: () {},
                    title: "Next",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
