import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/custom_appbar.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/category_section/widgets/list_of_category.dart';
import 'package:iza_app/view/drawer/loyality_section/widget/loyality_widget1.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoyalityScreen extends StatelessWidget {
  const LoyalityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Loyalty Program"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color.fromARGB(255, 243, 188, 198), white])),
              child: Padding(
                padding: normalPadding,
                child: Column(
                  children: [
                    buildVspacer(1.h),
                    LoyalityWidget1(),
                    buildVspacer(3.h),
                    buildsTextManrope(
                        title: "Loyalty Tiers",
                        align: true,
                        size: 17.px,
                        fontWeight: FontWeight.w600),
                    buildVspacer(2.h),
                    Image.asset('assets/images/loyality0.png'),
                    buildVspacer(2.h),
                    buildsTextManrope(
                        title: "Silver Benefits",
                        align: true,
                        size: 17.px,
                        fontWeight: FontWeight.w600),
                    buildVspacer(2.h),
                  ],
                ),
              ),
            ),
            Padding(
              padding: normalPadding,
              child: Column(
                children: [
                  Column(
                    spacing: 2.h,
                    children: [
                      silverBenfitMethod(
                          image: "loyality1",
                          title: "Reward point for every order"),
                      silverBenfitMethod(
                          image: "loyality2",
                          title: "Exclusive offers for loyal members"),
                      silverBenfitMethod(
                          image: "loyality3", title: "Early Access to Sales"),
                      silverBenfitMethod(
                          image: "loyality4",
                          title: "First Access to New Products"),
                    ],
                  ),
                  buildVspacer(2.h),
                  Container(
                    padding: EdgeInsets.all(12.sp),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.sp),
                        color: Color(0xffE7C89A).withOpacity(0.1)),
                    child: Column(
                      spacing: 2.h,
                      children: [
                        buildsTextManrope(
                            title: "Unlock More with Platinum",
                            size: 15.px,
                            fontWeight: FontWeight.w600,
                            align: true),
                        silverBenfitMethod(
                            image: "loyality5",
                            title: "Reward point for every order"),
                        silverBenfitMethod(
                            image: "loyality5",
                            title: "Exclusive offers for loyal members"),
                        silverBenfitMethod(
                            image: "loyality5", title: "Early Access to Sales"),
                        silverBenfitMethod(
                            image: "loyality5",
                            title: "First Access to New Products"),
                      ],
                    ),
                  ),
                  buildVspacer(2.h),
                  Container(
                    padding: EdgeInsets.all(12.sp),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.sp),
                        color: Color(0xffE7C89A).withOpacity(0.1)),
                    child: Column(
                      spacing: 2.h,
                      children: [
                        buildsTextManrope(
                            title: "Unlock More with Gold",
                            size: 15.px,
                            fontWeight: FontWeight.w600,
                            align: true),
                        silverBenfitMethod(
                            image: "loyality6",
                            title: "Reward point for every order"),
                        silverBenfitMethod(
                            image: "loyality6",
                            title: "Exclusive offers for loyal members"),
                        silverBenfitMethod(
                            image: "loyality6", title: "Early Access to Sales"),
                        silverBenfitMethod(
                            image: "loyality6",
                            title: "First Access to New Products"),
                      ],
                    ),
                  ),
                  buildVspacer(2.h),
                  buildsTextManrope(
                      title: "How to Earn Points",
                      align: true,
                      size: 17.px,
                      fontWeight: FontWeight.w600),
                  buildVspacer(2.h),
                  Column(
                    spacing: 2.h,
                    children: [
                      earnPointMethod(
                          image: "loyality7",
                          title: "Shop",
                          subTitle: "Sorem ipsum dolor sit amet"),
                      earnPointMethod(
                          image: "loyality8",
                          title: "Review & Rate",
                          subTitle: "Sorem ipsum dolor sit amet"),
                      earnPointMethod(
                          image: "loyality9",
                          title: "Refer a Friend",
                          subTitle: "Sorem ipsum dolor sit amet"),
                      earnPointMethod(
                          image: "loyality10",
                          title: "Engage in the Community",
                          subTitle: "Sorem ipsum dolor sit amet"),
                      earnPointMethod(
                          image: "loyality11", title: "Share on Social Media")
                    ],
                  ),
                  buildVspacer(2.h),
                  buildsTextManrope(
                      title: "FAQs",
                      size: 17.px,
                      fontWeight: FontWeight.w600,
                      align: true),
                  buildVspacer(2.h),
                  orderExtractedMethod(),
                  buildVspacer(2.h),
                  orderExtractedMethod(),
                  buildVspacer(2.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column orderExtractedMethod() {
    RxBool isClicked = false.obs;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            isClicked.value = !isClicked.value;
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildsTextManrope(
                title: "Forem ipsum dolor sit",
                size: 15.px,
                align: true,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              Obx(() {
                return Icon(
                  isClicked.value
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  size: 22.sp,
                  color: Colors.grey,
                );
              }),
            ],
          ),
        ),
        buildVspacer(1.h),
        Obx(() {
          return isClicked.value
              ? buildsTextManrope(
                  title:
                      "Detailed description goes here. Add more text to explain this item.description goes here. Add more text to explain this item.",
                  size: 14.px,
                  align: true,
                  color: Colors.grey,
                )
              : SizedBox();
        }),
      ],
    );
  }
}

Container earnPointMethod(
    {required String image, required String title, String subTitle = ''}) {
  return Container(
      height: Adaptive.h(8),
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(8.sp)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/$image.png'),
          buildHspacer(6.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildsTextManrope(
                  title: title, size: 15.px, fontWeight: FontWeight.w600),
              subTitle.isNotEmpty
                  ? buildsTextManrope(
                      title: subTitle,
                      size: 13.px,
                      fontWeight: FontWeight.w400,
                      align: true,
                      color: grey)
                  : SizedBox(),
            ],
          ),
        ],
      )

      /*    ListTile(
                    leading:,
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildsTextManrope(
                            title: "Shop",
                            size: 15.px,
                            fontWeight: FontWeight.w600),
                        buildsTextManrope(
                            title: "Sorem ipsum dolor sit amet",
                            size: 13.px,
                            fontWeight: FontWeight.w400,
                            align: true,
                            color: grey),
                      ],
                    ),
                  ), */
      );
}

Row silverBenfitMethod({required String image, required String title}) {
  return Row(
    children: [
      Image.asset('assets/images/$image.png'),
      buildHspacer(7.w),
      buildsTextManrope(title: title, size: 15.px, fontWeight: FontWeight.w500),
    ],
  );
}
