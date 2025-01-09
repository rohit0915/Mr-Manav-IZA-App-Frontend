import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreateQuestionScreen extends StatelessWidget {
  const CreateQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> items = [
      "Skincare",
      "Makeup",
      "Fashion",
      "skincare",
      "skincare"
    ];
    RxBool isClicked = false.obs;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
            )),
        title: buildsTextManrope(
            title: "Create a question",
            size: 19.px,
            fontWeight: FontWeight.w600),
        centerTitle: true,
        actions: [
          Obx(() {
            return GestureDetector(
              onTap: () {
                if (isClicked.value) {
                  Get.back();
                }
              },
              child: Container(
                height: Adaptive.h(5),
                padding: EdgeInsets.symmetric(
                    vertical: Adaptive.h(0.1), horizontal: Adaptive.w(5)),
                decoration: BoxDecoration(
                  color: isClicked.value ? black : grey,
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                child: Center(
                  child: buildsTextManrope(
                      title: "Post",
                      size: 15.px,
                      fontWeight: FontWeight.w500,
                      color: white),
                ),
              ),
            );
          }),
          buildHspacer(3.w)
        ],
      ),
      body: Padding(
        padding: normalPadding,
        child: Column(
          children: [
            Divider(
              color: grey.withOpacity(0.4),
            ),
            buildVspacer(2.h),
            GestureDetector(
              onTap: () {
                isClicked.value = true;
              },
              child: Obx(() {
                return SizedBox(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/faq1.png'),
                          buildHspacer(5.w),
                          isClicked.value
                              ? buildsTextManrope(
                                  title:
                                      "Jorem ipsum dolor sit amet, consectetur adi pis\ncing elit.",
                                  size: 12.px,
                                  align: true,
                                  fontWeight: FontWeight.w500)
                              : buildsTextManrope(
                                  title: "Share your questions ",
                                  size: 13.px,
                                  fontWeight: FontWeight.w500)
                        ],
                      ),
                      buildVspacer(15.h),
                      isClicked.value
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IntrinsicWidth(
                                  child: Container(
                                    height: Adaptive.h(5),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: Adaptive.w(3),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.sp),
                                        border: Border.all(color: primarys)),
                                    child: Center(
                                      child: buildsTextManrope(
                                          title: "#skincare",
                                          size: 11.px,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : SizedBox(),
                      buildVspacer(3.h),
                      SizedBox(
                        height: Adaptive.h(5),
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Adaptive.w(2),
                                      vertical: Adaptive.h(0.1)),
                                  decoration: BoxDecoration(
                                      color: Color(0xffF4ACD9).withOpacity(0.2),
                                      border: Border.all(
                                        color: Color(0xffF4ACD9),
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(12.sp)),
                                  child: Center(
                                    child: buildsTextManrope(
                                      title: items[index],
                                      size: 11.px,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ));
                            },
                            separatorBuilder: (context, index) =>
                                buildHspacer(2.5.w),
                            itemCount: items.length),
                      ),
                      buildVspacer(2.h),
                      Divider(
                        color: grey.withOpacity(0.4),
                      )
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
