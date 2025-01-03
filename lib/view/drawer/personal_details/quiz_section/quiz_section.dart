import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/button_widget.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/custom_appbar.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/drawer/personal_details/components/list_of_quiz.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'quiz_review_answer/quiz.dart';

class QuizSectionScreen extends StatefulWidget {
  const QuizSectionScreen({super.key});

  @override
  State<QuizSectionScreen> createState() => _QuizSectionScreenState();
}

class _QuizSectionScreenState extends State<QuizSectionScreen> {
  @override
  RxInt selctedIndex = 0.obs;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Build My Profile",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
        child: Column(
          children: [
            Divider(
              thickness: 1,
              color: grey,
            ),
            buildVspacer(1.h),
            buildsTextManrope(
                title: quizList[selctedIndex.value],
                size: 18.px,
                fontWeight: FontWeight.w600,
                align: true),
            buildsTextManrope(
              title: "Pick one",
              size: 14.px,
              align: true,
              fontWeight: FontWeight.w500,
            ),
            buildVspacer(2.h),
            SizedBox(
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Adaptive.w(3), vertical: Adaptive.h(2)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.sp),
                          border: Border.all(color: grey.withOpacity(0.4))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildsTextManrope(
                            title: "Oily and greesy",
                            size: 14.px,
                            fontWeight: FontWeight.w600,
                          ),
                          CircleAvatar(
                            radius: Adaptive.w(3),
                            backgroundColor: grey.withOpacity(0.4),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => buildVspacer(2.h),
                  itemCount: 4),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Adaptive.w(3), vertical: Adaptive.h(4)),
        child: selctedIndex.value != 0
            ? SizedBox(
                height: Adaptive.h(12),
                child: Column(
                  children: [
                    Divider(
                      color: grey,
                    ),
                    buildVspacer(3.h),
                    Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          child: CustomButton(
                            onpress: () {
                              setState(() {
                                selctedIndex.value = selctedIndex.value - 1;
                              });
                            },
                            title: "Back",
                            color: white,
                            textColor: black,
                          ),
                        ),
                        buildHspacer(3.w),
                        Expanded(
                          child: CustomButton(
                            onpress: () {
                              log("selected index:$selctedIndex");
                              if (selctedIndex.value == quizList.length - 1) {
                                Get.to(() => QuizReviewSectionScreen());
                              } else {
                                setState(() {
                                  selctedIndex.value = selctedIndex.value + 1;
                                });
                              }
                            },
                            title: "Next",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : SizedBox(
                height: Adaptive.h(12),
                child: Column(
                  children: [
                    Divider(
                      color: grey,
                    ),
                    buildVspacer(3.h),
                    CustomButton(
                      onpress: () {
                        setState(() {
                          selctedIndex.value = selctedIndex.value + 1;
                        });
                      },
                      title: "Next",
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
