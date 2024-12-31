import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/app_titile_widget.dart';
import 'package:iza_app/utilz/button_widget.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/drawer/drawer_screen.dart';
import 'package:iza_app/view/offer_section/widgets/deals_of_day.dart';
import 'package:iza_app/view/search_section/search_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({super.key});

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  Timer? _timer;

  PageController controller = PageController();
  GlobalKey<ScaffoldState> keyhome = GlobalKey();
  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  List<String> banner = [
    "assets/images/offer_banner.png",
    "assets/images/offer_banner.png",
    "assets/images/offer_banner.png"
  ];
  List<String> featureProduct = [
    "Streax",
    "Recode",
    "Loreal Paris",
    "Swiss baeuty"
  ];
  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (controller.hasClients) {
        int nextPage = (controller.page?.toInt() ?? 0) + 1;
        if (nextPage >= banner.length) {
          nextPage = 0; // Loop back to the first page
        }
        controller.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: keyhome,
      drawer: SizedBox(width: Adaptive.w(70), child: DrawerMenu()),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildVspacer(1.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                        onTap: () {
                          keyhome.currentState!.openDrawer();
                        },
                        child: Image.asset('assets/images/offerappbar1.png')),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => SearchScreen());
                      },
                      child: Container(
                        height: Adaptive.h(5),
                        width: Adaptive.w(60),
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
                    ),
                    buildHspacer(2.w),
                    Image.asset('assets/images/offerappbar2.png'),
                    buildHspacer(2.w),
                    Image.asset('assets/images/offerappbar3.png')
                  ],
                ),
                SizedBox(
                  height: 200, // Adjust the height as needed
                  child: PageView.builder(
                    controller: controller,
                    itemCount: banner.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        banner[index],
                      );
                    },
                  ),
                ),
                buildVspacer(1.h),
                SmoothPageIndicator(
                  controller: controller,
                  count: banner.length,
                  axisDirection: Axis.horizontal,
                  effect: ExpandingDotsEffect(
                      dotWidth: Adaptive.w(2),
                      dotHeight: Adaptive.h(1),
                      activeDotColor: black),
                ),
                buildVspacer(2.h),
                mainTitleWidget("Deals Of The Day"),
                buildVspacer(2.h),
                dealsOfDay(),
                buildVspacer(2.h),
                Image.asset('assets/images/offer_poster.png'),
                buildVspacer(3.h),
                buildsTextBitter(
                  title: "Offers You will Love",
                  size: 24.px,
                  align: true,
                  fontWeight: FontWeight.w300,
                ),
                buildVspacer(2.h),
                SizedBox(
                  height: Adaptive.h(16),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Image.asset('assets/images/offerdeal.png'),
                          buildVspacer(1.h),
                          buildsTextBitter(
                            title: "MakeUp",
                            size: 13.px,
                            fontWeight: FontWeight.w500,
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => buildHspacer(3.w),
                    itemCount: 3,
                  ),
                ),
                buildVspacer(2.h),
                buildsTextBitter(
                  title: "Deals to Steal",
                  size: 24.px,
                  align: true,
                  fontWeight: FontWeight.w300,
                ),
                buildVspacer(2.h),
                SizedBox(
                  height: Adaptive.h(25),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Image.asset('assets/images/offer_poster2.png'),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => buildHspacer(3.w),
                    itemCount: 2,
                  ),
                ),
                buildVspacer(2.h),
                featuredProducMethod(),
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
                      title: "Brand Offers",
                      size: 24.px,
                      fontWeight: FontWeight.w300,
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
                  height: Adaptive.h(25),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Image.asset(
                              'assets/images/brandlogo${index + 1}.png'),
                          buildVspacer(1.h),
                          buildsTextManrope(
                              title: "50% Off",
                              size: 15.px,
                              fontWeight: FontWeight.w500)
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => buildHspacer(3.w),
                    itemCount: 2,
                  ),
                ),
                buildVspacer(3.h),
                buildsTextBitter(
                  title: "Must Haves",
                  size: 24.px,
                  align: true,
                  fontWeight: FontWeight.w300,
                ),
                buildVspacer(2.h),
                SizedBox(
                  height: Adaptive.h(34),
                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        RxBool isFavorite = false.obs;

                        return Stack(
                          children: [
                            Container(
                              width: Adaptive.w(45),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                      'assets/images/offer${index + 1}.png'),
                                  buildVspacer(1.h),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Adaptive.w(1)),
                                    child: Column(
                                      children: [
                                        buildsTextManrope(
                                          title: "Streax",
                                          size: 13.px,
                                          fontWeight: FontWeight.w300,
                                          align: true,
                                          color: textGreyColor,
                                        ),
                                        buildVspacer(1.h),
                                        buildsTextManrope(
                                          title:
                                              "Streax Hair Serum\nEnriched With Vitamin E",
                                          size: 12.px,
                                          align: true,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            buildsTextBitter(
                                                title: "₹ 150",
                                                size: 15.px,
                                                fontWeight: FontWeight.w700),
                                            Text(
                                              "₹ 299",
                                              style: GoogleFonts.manrope(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16.px,
                                                  decoration:
                                                      TextDecoration.overline,
                                                  decorationColor: grey,
                                                  color: grey),
                                            ),
                                            buildsTextManrope(
                                                title: "40% off",
                                                size: 12.px,
                                                fontWeight: FontWeight.w500,
                                                color: lightGreen)
                                          ],
                                        ),
                                        buildVspacer(1.h),
                                        index % 2 == 0
                                            ? Wrap(
                                                direction: Axis.horizontal,
                                                // runSpacing: 2.h,
                                                spacing: 3.w,
                                                children: [
                                                  IntrinsicWidth(
                                                    child: Container(
                                                      height: 3.h,
                                                      padding:
                                                          EdgeInsets.all(5.sp),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                            color:
                                                                textFieldColor,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.sp)),
                                                      child: Center(
                                                        child:
                                                            buildsTextManrope(
                                                                title: "30 ml",
                                                                color: grey),
                                                      ),
                                                    ),
                                                  ),
                                                  IntrinsicWidth(
                                                    child: Container(
                                                      height: 3.h,
                                                      padding:
                                                          EdgeInsets.all(5.sp),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                            color:
                                                                textFieldColor,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.sp)),
                                                      child: Center(
                                                        child:
                                                            buildsTextManrope(
                                                                title: "30 ml",
                                                                color: grey),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                            : Image.asset(
                                                'assets/images/offerColor.png'),
                                        buildVspacer(1.h),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 3.w,
                              child: Obx(() {
                                return Container(
                                  height: Adaptive.h(6),
                                  padding: EdgeInsets.all(8.sp),
                                  decoration: BoxDecoration(
                                      color: grey.withOpacity(0.2)),
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        isFavorite.value = !isFavorite.value;
                                      },
                                      child: Image.asset(
                                        'assets/images/offerappbar2.png',
                                        color: isFavorite.value
                                            ? Colors.red
                                            : null,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            )
                          ],
                        );
                      },
                      separatorBuilder: (context, index) => buildHspacer(2.w),
                      itemCount: 2),
                ),
                buildVspacer(2.h),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Container featuredProducMethod() {
    return Container(
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(color: Color(0xffFEE6F5)),
      child: Column(
        children: [
          buildVspacer(1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildsTextBitter(
                title: "Featured Products",
                size: 23.px,
                fontWeight: FontWeight.w300,
              ),
              buildsTextBitter(
                  title: "View All >", size: 13.px, fontWeight: FontWeight.w400)
            ],
          ),
          buildVspacer(2.h),
          SizedBox(
            height: Adaptive.h(5),
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 3.sp, horizontal: Adaptive.w(2)),
                    decoration: BoxDecoration(
                      color: white,
                      border: Border.all(
                        color: primary,
                      ),
                      borderRadius: BorderRadius.circular(8.sp),
                    ),
                    child: Center(
                      child: buildsTextManrope(
                        title: featureProduct[index],
                        size: 13.px,
                        color: primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => buildHspacer(3.w),
                itemCount: featureProduct.length),
          ),
          buildVspacer(2.h),
          SizedBox(
            height: Adaptive.h(35),
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: Adaptive.w(45),
                    decoration: BoxDecoration(
                        color: white,
                        border: Border.all(color: Colors.black12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildVspacer(2.h),
                        Center(
                          child: buildsTextBitter(
                            title: "Keral Botox",
                            size: 17.px,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Center(
                            child: Image.asset('assets/images/offer_item.png')),
                        buildVspacer(1.h),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Adaptive.w(1)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              buildVspacer(1.h),
                              Center(
                                child: buildsTextManrope(
                                  title: "Up to 40% off",
                                  size: 12.px,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              buildsTextBitter(
                                  title: "Free Gift on ₹ 150",
                                  size: 15.px,
                                  fontWeight: FontWeight.w700),
                              buildVspacer(1.h),
                              CustomButton(
                                onpress: () {},
                                title: "Shop Now",
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => buildHspacer(2.w),
                itemCount: 2),
          )
        ],
      ),
    );
  }
}
