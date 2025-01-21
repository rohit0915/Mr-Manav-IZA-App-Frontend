import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/app_titile_widget.dart';
import 'package:iza_app/utilz/button_widget.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/cart/cart_screen.dart';
import 'package:iza_app/view/drawer/drawer_screen.dart';
import 'package:iza_app/view/drawer/personal_details/chat_section/chat_screen.dart';
import 'package:iza_app/view/drawer/personal_details/quiz_section/quiz_section.dart';
import 'package:iza_app/view/offer_section/widgets/deals_of_day.dart';
import 'package:iza_app/view/search_section/search_screen.dart';
import 'package:iza_app/view/stream/stream_video_section/stream_video_screen.dart';
import 'package:iza_app/view/wishlist_section/wishlist_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> keyhome = GlobalKey();

  Timer? _timer;
  PageController controller = PageController();
  void initState() {
    super.initState();
    _startAutoScroll();
  }

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
  void dispose() {
    _timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  List<String> banner = [
    'assets/images/homebanner.png',
    'assets/images/homebanner.png',
    'assets/images/homebanner.png',
  ];
  List<String> catTitle = [
    "Makeup",
    "Hair Care",
    "Skin Care",
    "Body Care",
    "Body Care",
    "Hair Styling",
    "Skin Care",
    "Skin Care"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: keyhome,
      drawer: SizedBox(width: Adaptive.w(70), child: DrawerMenu()),
      body: SafeArea(
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
                  GestureDetector(
                      onTap: () {
                        Get.to(() => WishlistScreen());
                      },
                      child: Image.asset('assets/images/offerappbar2.png')),
                  buildHspacer(2.w),
                  GestureDetector(
                      onTap: () {
                        Get.to(() => CartScreen());
                      },
                      child: Image.asset('assets/images/offerappbar3.png')),
                ],
              ),
              buildVspacer(2.h),
              Padding(
                padding: normalPadding,
                child: Column(
                  children: [
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
                    mainTitleWidget("Categories"),
                    buildVspacer(2.h),
                    _gridviewCategoryMethod(),
                    buildVspacer(2.h),
                    mainTitleWidget("Deals Of The Day"),
                    buildVspacer(2.h),
                    dealsOfDay(),
                    buildVspacer(2.h),
                    featuredProducMethod(),
                    buildVspacer(2.h),
                    Image.asset('assets/images/offer_poster.png'),
                    buildVspacer(2.h),
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
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) => buildHspacer(3.w),
                        itemCount: 3,
                      ),
                    ),
                    buildVspacer(2.h),
                    mainTitleWidget("Iza Stream"),
                    buildVspacer(2.h),
                    GestureDetector(
                        onTap: () {
                          Get.to(() => StreamVideoScreen());
                        },
                        child: Image.asset('assets/images/stream4.png')),
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
                    _reviewAndTips(),
                    buildVspacer(1.h),
                    Image.asset('assets/images/homebeauty.png'),
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
                                title: "Chat Now >",
                                size: 15.px,
                                color: primarys),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _reviewAndTips() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Adaptive.w(3)),
      decoration: BoxDecoration(color: Color(0xffFC83CE).withOpacity(0.2)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Your Beauty Space",
                style: GoogleFonts.bitter(
                    fontWeight: FontWeight.w400,
                    fontSize: 20.px,
                    letterSpacing: 1.w),
              ),
              Icon(
                Icons.arrow_right_alt,
                size: 22.sp,
              )
            ],
          ),
          SizedBox(
            height: 245.px,
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  RxBool isFavorite = false.obs;
                  return Container(
                    width: Adaptive.w(45),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset('assets/images/stream2.png'),
                          buildVspacer(2.h),
                          buildsTextManrope(
                              title:
                                  "How to Choose\nperfect shade for\nyour skin",
                              size: 12.px,
                              align: true,
                              fontWeight: FontWeight.w600),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              buildsTextManrope(
                                title: "2 min read",
                                size: 11.px,
                                fontWeight: FontWeight.w400,
                              ),
                              buildHspacer(4.w),
                              buildsTextManrope(title: "."),
                              buildsTextManrope(
                                title: "20 Dec 24",
                                size: 11.px,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => buildHspacer(2.w),
                itemCount: 2),
          ),
          buildVspacer(2.h),
          SizedBox(
            height: 295.px,
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: Adaptive.w(45),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset('assets/images/stream6.png'),
                            buildsTextManrope(
                                title: "REVIEWS",
                                size: 11.px,
                                align: true,
                                fontWeight: FontWeight.w500),
                            // buildVspacer(2.h),
                            buildsTextManrope(
                                title: "Sharad Nanita",
                                size: 20.px,
                                align: true,
                                fontWeight: FontWeight.w500),
                            buildsTextManrope(
                              title: "Bollywood Makeup Stylish and Influencer",
                              size: 10.px,
                              align: true,
                              fontWeight: FontWeight.w400,
                            ),
                          ]),
                    ),
                  );
                },
                separatorBuilder: (context, index) => buildHspacer(2.w),
                itemCount: 2),
          ),
          buildVspacer(2.h),
          buildsTextManrope(
              title: "ViewAll >", size: 15.px, fontWeight: FontWeight.w500),
          buildVspacer(2.h),
        ],
      ),
    );
  }

  Container featuredProducMethod() {
    List<String> featureProduct = [
      "Streax",
      "Recode",
      "Loreal Paris",
      "Swiss baeuty"
    ];
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
                        color: primarys,
                      ),
                      borderRadius: BorderRadius.circular(8.sp),
                    ),
                    child: Center(
                      child: buildsTextManrope(
                        title: featureProduct[index],
                        size: 13.px,
                        color: primarys,
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

  SizedBox _gridviewCategoryMethod() {
    return SizedBox(
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _calculateCrossAxisCount(), // Responsive count
          crossAxisSpacing: 2.w,
          mainAxisSpacing: 2.w,
          childAspectRatio: 0.9, // Adjust ratio based on content
        ),
        itemCount: 8, // Number of grid items
        itemBuilder: (context, index) {
          return Column(
            children: [
              Image.asset('assets/images/homecat$index.png'),
              buildVspacer(1.h),
              buildsTextBitter(
                title: catTitle[index],
                size: 13.px,
                fontWeight: FontWeight.w300,
              )
            ],
          );
        },
      ),
    );
  }

  int _calculateCrossAxisCount() {
    if (Device.width > 600) {
      return 4; // Large phones show 4 items
    } else if (Device.width > 400) {
      return 4; // Medium phones show 3 items
    } else {
      return 4; // Small phones show 2 items
    }
  }
}
