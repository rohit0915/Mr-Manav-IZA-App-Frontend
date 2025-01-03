import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/category_section/widgets/list_of_category.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildsTextBitter(
                    align: true,
                    title: "Makeup Vanity",
                    color: Colors.grey,
                    size: 12.px,
                    fontWeight: FontWeight.w400),
                buildsTextCormarant(
                  title: "Silver >",
                  size: 24.px,
                  align: true,
                  fontWeight: FontWeight.w400,
                ),
                buildVspacer(1.h),
                Divider(
                  color: Colors.black45,
                ),
                buildVspacer(2.h),
                Container(
                  height: Adaptive.h(5),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.sp),
                    color: textFieldColor,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      buildHspacer(3.w),
                      buildsTextManrope(
                          title: "Search",
                          size: 14.px,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey)
                    ],
                  ),
                ),
                buildVspacer(2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildsTextCormarant(
                      title: "Shop ",
                      size: 22.px,
                      fontWeight: FontWeight.w500,
                    ),
                    Image.asset('assets/images/category1.png')
                  ],
                ),
                buildVspacer(2.h),
                SizedBox(
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return categoryItemWidget(index);
                      },
                      separatorBuilder: (context, index) => buildVspacer(2.h),
                      itemCount: titles.length),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget categoryItemWidget(int index) {
    RxBool isCategoryClicked = false.obs;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            isCategoryClicked.value = !isCategoryClicked.value;
            print("isClicked:$isCategoryClicked");
          },
          child: Container(
            height: Adaptive.h(13),
            width: double.infinity,
            padding: EdgeInsets.all(12.sp),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.sp),
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 121, 4, 80),
                  Color(0xffF8069D),
                ])),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildsTextManrope(
                    title: titles[index],
                    size: 19.px,
                    color: white,
                    fontWeight: FontWeight.w700),
                Image.asset('assets/images/cat$index.png')
              ],
            ),
          ),
        ),
        Obx(() {
          return isCategoryClicked.value
              ? SizedBox(
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        RxBool isClicked2 = false.obs;
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                isClicked2.value = !isClicked2.value;
                              },
                              child: SizedBox(
                                height: Adaptive.h(7),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Adaptive.w(4),
                                      vertical: Adaptive.h(2)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      buildsTextManrope(
                                        title: categoryItems[index],
                                        size: 17.px,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      Icon(Icons.keyboard_arrow_down),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Obx(() {
                              return isClicked2.value
                                  ? SizedBox(
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            padding: EdgeInsets.all(12.sp),
                                            decoration: BoxDecoration(
                                                color:
                                                    primarys.withOpacity(0.1)),
                                            child: Column(
                                              children: [
                                                buildsTextManrope(
                                                    title: itemsList2[index],
                                                    size: 15.px,
                                                    fontWeight: FontWeight.w400,
                                                    align: true),
                                                buildVspacer(1.h),
                                                Divider(
                                                  color:
                                                      primarys.withOpacity(0.4),
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                        itemCount: itemsList2.length,
                                      ),
                                    )
                                  : SizedBox();
                            })
                          ],
                        );
                      },
                      separatorBuilder: (context, index) => buildVspacer(1.h),
                      itemCount: categoryItems.length),
                )
              : SizedBox();
        })
      ],
    );
  }
}
