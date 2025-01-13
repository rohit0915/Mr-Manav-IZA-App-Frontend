import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/button_widget.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/custom_appbar.dart';
import 'package:iza_app/utilz/custom_textfield.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/drawer/personal_details/chat_section/chat_screen.dart';
import 'package:iza_app/view/drawer/personal_details/quiz_section/quiz_section.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PersonalDetailsScreen extends StatelessWidget {
  const PersonalDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Personal Details"),
      body: Padding(
        padding: normalPadding,
        child: Column(
          children: [
            Divider(
              thickness: 1,
              color: grey,
            ),
            buildVspacer(2.h),
            Stack(
              children: [
                Image.asset('assets/images/profile3.png'),
                Column(
                  children: [],
                ),
                Positioned(
                    left: Adaptive.w(3),
                    bottom: Adaptive.h(2),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => QuizSectionScreen());
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.sp),
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(14.sp)),
                        child: buildsTextManrope(
                            title: "Begin Quiz",
                            size: 14.px,
                            fontWeight: FontWeight.w500),
                      ),
                    ))
              ],
            ),
            buildVspacer(2.h),
            CustomTxtFormField(title: "Name", hintText: "Harshita Gurnani"),
            buildVspacer(2.h),
            CustomTxtFormField(
                title: "Contact Number", hintText: "63647585969"),
            buildVspacer(2.h),
            CustomTxtFormField(title: "Email ", hintText: "Enter Email"),
            Spacer(),
            Container(
              padding: normalPadding,
              decoration: BoxDecoration(
                  color: Color(0xffEDEDED),
                  borderRadius: BorderRadius.circular(12.sp)),
              child: Row(
                children: [
                  Image.asset('assets/images/profile2.png'),
                  buildHspacer(3.w),
                  Column(
                    children: [
                      buildsTextManrope(
                        title: "Need Personalized Help?",
                        size: 16.px,
                        fontWeight: FontWeight.w500,
                      ),
                      buildsTextManrope(
                        title: "Chat with a Beauty Expert!",
                        fontWeight: FontWeight.w300,
                        size: 15.px,
                      ),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => ChatScreen());
                    },
                    child: buildsTextManrope(
                        title: "Chat Now >", size: 15.px, color: primarys),
                  )
                ],
              ),
            ),
           
            buildVspacer(2.h),
            CustomButton(
              onpress: () {
                Get.to(() => QuizSectionScreen());
              },
              title: "Save",
            ),
            buildVspacer(4.h),
          ],
        ),
      ),
    );
  }
}
