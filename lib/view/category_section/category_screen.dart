import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/certificate_widget.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/brand_section/brand_screen.dart';
import 'package:iza_app/view/category_section/filter_section/filter_screen.dart';
import 'package:iza_app/view/category_section/widgets/list_of_category.dart';
import 'package:iza_app/view/product_listing_section/product_listing_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final ScrollController scrollController = ScrollController();
  final RxList<bool> isItemClicked2 = List.filled(6, false).obs;

  RxInt selectedIndex = (1).obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
        child: SafeArea(
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                // buildsTextBitter(
                //     align: true,
                //     title: "Makeup Vanity",
                //     color: Colors.grey,
                //     size: 12.px,
                //     fontWeight: FontWeight.w400),
                // buildsTextCormarant(
                //   title: "Silver >",
                //   size: 24.px,
                //   align: true,
                //   fontWeight: FontWeight.w400,
                // ),
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
                    GestureDetector(
                        onTap: () {
                          Get.to(() => FilterByScreen());
                        },
                        child: Image.asset('assets/images/category1.png'))
                  ],
                ),
                buildVspacer(2.h),

                /*   Wrap(
                    direction: Axis.horizontal,
                    runSpacing: 1.h,
                    spacing: 2.w,
                    children: List.generate(
                      titles.length,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            // Toggle clicked state of the item
                            if (index == 1) {
                              Get.to(() => BrandListingScreen());
                            } else {
                              isItemClicked[index] = !isItemClicked[index];
                            }
                          },
                          child: Obx(() {
                            return Column(
                              children: [
                                AnimatedContainer(
                                  width: Adaptive.w(45),
                                  height: Adaptive.h(20),
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                  margin: isItemClicked[index]
                                      ? EdgeInsets.only(top: 5.h)
                                      : EdgeInsets.zero,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.sp),
                                    gradient: LinearGradient(colors: [
                                      Color.fromARGB(255, 121, 4, 80),
                                      Color(0xffF8069D),
                                    ]),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(12.sp),
                                        child: Text(
                                          titles[index],
                                          style: TextStyle(
                                              fontSize: 19.px,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Image.asset(
                                          'assets/images/cat$index.png'),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    buildVspacer(1.h),
                                    Obx(() {
                                      return isItemClicked[index]
                                          ? index == 4
                                              ? makeUpVantityItem()
                                              : shopCategoryItemMethod()
                                          : SizedBox();
                                    })
                                  ],
                                ),
                              ],
                            );
                          }),
                        );
                      },
                    )),  */

                /*  GestureDetector(
                    onTap: () {
                      // Toggle clicked state of the item
                      if (0 == 1) {
                        Get.to(() => BrandListingScreen());
                      } else {
                        // isItemClicked[index] = !isItemClicked[index];
                      }
                    },
                    child: ), */
                SizedBox(
                  height: Adaptive.h(22),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => buildHspacer(3.w),
                    itemBuilder: (context, index) {
                      return categoryCardMethod(
                          title: categoryCard1[index], index: index);
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                  ),
                ),
                Obx(() {
                  return isItemClicked2[0]
                      ? shopCategoryItemMethod()
                      : SizedBox();
                }),
                buildVspacer(1.h),
                SizedBox(
                  height: Adaptive.h(22),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => buildHspacer(3.w),
                    itemBuilder: (context, index) {
                      return categoryCardMethod(
                          title: categoryCard2[index], index: index + 2);
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                  ),
                ),
                Obx(() {
                  return isItemClicked2[2] || isItemClicked2[3]
                      ? shopCategoryItemMethod()
                      : SizedBox();
                }),
                buildVspacer(1.h),
                SizedBox(
                  height: Adaptive.h(22),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => buildHspacer(3.w),
                    itemBuilder: (context, index) {
                      return categoryCardMethod(
                          title: categoryCard3[index], index: index + 4);
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                  ),
                ),
                Obx(() {
                  return isItemClicked2[4] || isItemClicked2[5]
                      ? shopCategoryItemMethod()
                      : SizedBox();
                }),
                buildVspacer(2.h),
                CertificateWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget categoryCardMethod({required String title, required int index}) {
    RxBool isItemClicked = false.obs;
    return GestureDetector(
      onTap: () {
        if (title == "Brands") {
          Get.to(() => BrandListingScreen());
        } else {
          isItemClicked.value = !isItemClicked.value;
          selectedIndex.value = index;
          isItemClicked2[index] = !isItemClicked2[index];
          log("index:$index selected index:$index isitemclicked:${isItemClicked2[index]}");
        }
      },
      child: Obx(() {
        return AnimatedContainer(
          width: Adaptive.w(45),
          height: isItemClicked.value ? Adaptive.h(22) : Adaptive.h(20),
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          margin:
              isItemClicked.value ? EdgeInsets.only(top: 5.h) : EdgeInsets.zero,
          transform: isItemClicked.value
              ? Matrix4.translationValues(0, -10, 0) // Move the item upward
              : Matrix4.identity(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.sp),
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 121, 4, 80),
              Color(0xffF8069D),
            ]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(12.sp),
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 19.px,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
              Image.asset('assets/images/cat$index.png'),
            ],
          ),
        );
      }),
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
            if (titles[index] == "Everyday Essential") {
              // Scroll to ensure the expanded item is visible
              Future.delayed(Duration(milliseconds: 300), () {
                scrollController.animateTo(
                  scrollController.position.pixels +
                      200, // Adjust scroll amount
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              });
            }
          },
          child: Container(
            height: Adaptive.h(20),
            width: double.infinity,
            padding: EdgeInsets.all(12.sp),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.sp),
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 121, 4, 80),
                  Color(0xffF8069D),
                ])),
            child: Column(
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
        /*   Obx(() {
          return isCategoryClicked.value
              ? index == 4
                  ? makeUpVantityItem()
                  : shopCategoryItemMethod()
              : SizedBox();
        }) */
      ],
    );
  }

  SizedBox shopCategoryItemMethod() {
    return SizedBox(
      child: ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            RxBool isClicked2 = false.obs;
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => ProductListScreen());
                  },
                  child: SizedBox(
                    height: Adaptive.h(7),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Adaptive.w(4), vertical: Adaptive.h(2)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildsTextManrope(
                            title: categoryItems[index],
                            size: 17.px,
                            fontWeight: FontWeight.w500,
                          ),
                          GestureDetector(
                              onTap: () {
                                isClicked2.value = !isClicked2.value;
                              },
                              child: Icon(Icons.keyboard_arrow_down)),
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
                                    color: primarys.withOpacity(0.1)),
                                child: Column(
                                  children: [
                                    buildsTextManrope(
                                        title: itemsList2[index],
                                        size: 15.px,
                                        fontWeight: FontWeight.w400,
                                        align: true),
                                    buildVspacer(1.h),
                                    Divider(
                                      color: primarys.withOpacity(0.4),
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
    );
  }

  SizedBox makeUpVantityItem() {
    return SizedBox(
        child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => buildVspacer(1.h),
            physics: NeverScrollableScrollPhysics(),
            itemCount: makeupvantityList.length,
            itemBuilder: (context, index) {
              // RxBool isClicked2 = false.obs;
              return Column(children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => ProductListScreen());
                  },
                  child: SizedBox(
                    height: Adaptive.h(7),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Adaptive.w(4), vertical: Adaptive.h(2)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildsTextManrope(
                            title: makeupvantityList[index],
                            size: 17.px,
                            fontWeight: FontWeight.w500,
                          ),
                          GestureDetector(
                              onTap: () {
                                // isClicked2.value =
                                //     !isClicked2.value;
                              },
                              child: Icon(Icons.keyboard_arrow_down)),
                        ],
                      ),
                    ),
                  ),
                )
              ]);
            }));
  }
}
