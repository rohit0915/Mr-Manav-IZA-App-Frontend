import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MembershipSectionScreen extends StatelessWidget {
  const MembershipSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      "Reward point for every order",
      "Exclusive offers for loyal members",
      "Early Access to Sales",
      "First Access to New Products"
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back)),
        title: buildsTextManrope(
            title: "Membership", size: 18.px, fontWeight: FontWeight.w600),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
          child: Column(
            children: [
              Divider(
                thickness: 1,
                color: grey,
              ),
              buildVspacer(1.h),
              Image.asset('assets/images/membership.png'),
              buildVspacer(2.h),
              buildsTextManrope(
                  title: "Join our 2,3,489 + Platinum Membership family",
                  size: 13.px,
                  fontWeight: FontWeight.w600),
              buildVspacer(2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: Adaptive.w(10),
                    child: Divider(
                      color: black,
                    ),
                  ),
                  buildHspacer(3.w),
                  buildsTextBitter(
                    title: "Membership ",
                    size: 17.px,
                    color: grey,
                    fontWeight: FontWeight.w300,
                  ),
                  buildHspacer(1.h),
                  buildsTextManrope(
                    title: "Benefits",
                    size: 17.px,
                    fontWeight: FontWeight.w400,
                  ),
                  buildHspacer(3.w),
                  SizedBox(
                    width: Adaptive.w(10),
                    child: Divider(
                      color: black,
                    ),
                  ),
                ],
              ),
              buildVspacer(2.h),
              SizedBox(
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            vertical: Adaptive.h(2), horizontal: Adaptive.w(2)),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                          Color(0xffFFFFFF),
                          Color(0xffD2D2D2)
                        ])),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                                'assets/images/membership${index + 1}.png'),
                            buildHspacer(8.w),
                            buildsTextManrope(
                                title: titles[index],
                                size: 15.px,
                                fontWeight: FontWeight.w400)
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => buildVspacer(3.h),
                    itemCount: titles.length),
              ),
              buildVspacer(2.h),
              buildsTextManrope(
                  title: "FAQs",
                  size: 17.px,
                  fontWeight: FontWeight.w600,
                  align: true),
              buildVspacer(1.h),
              buildsTextManrope(
                title: "Forem ipsum dolor sit ",
                align: true,
                size: 15.px,
                fontWeight: FontWeight.w500,
              ),
              buildVspacer(2.h),
              buildsTextManrope(
                title:
                    "Qorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.",
                size: 13.px,
                fontWeight: FontWeight.w500,
                align: true,
              ),
              buildVspacer(2.h),
              buildsTextManrope(
                title: "Forem ipsum dolor sit ",
                align: true,
                size: 15.px,
                fontWeight: FontWeight.w500,
              ),
              buildVspacer(8.h),
            ],
          ),
        ),
      ),
    );
  }
}
