import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/stream/create_question_section/create_question_screen.dart';
import 'package:iza_app/view/stream/widgets/common_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FaqStreamWidget extends StatelessWidget {
  const FaqStreamWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: normalPadding,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                buildVspacer(2.h),
                SizedBox(
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return faqItemMethodWidget();
                      },
                      separatorBuilder: (context, index) => buildVspacer(3.h),
                      itemCount: 3),
                ),
              ],
            ),
          ),
          Positioned(
            right: Adaptive.w(2),
            bottom: Adaptive.h(2),
            child: GestureDetector(
              onTap: () {
                Get.to(() => CreateQuestionScreen());
              },
              child: CircleAvatar(
                radius: 10.w,
                backgroundColor: Colors.pinkAccent,
                child: Icon(
                  Icons.add,
                  color: white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  functionw() {}
}
