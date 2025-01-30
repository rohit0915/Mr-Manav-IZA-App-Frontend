import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iza_app/controller/bottom_controller.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/app_titile_widget.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/bottom_navigation/custom_bottom_navigator.dart';
import 'package:iza_app/view/drawer/notification/notification_screen.dart';
import 'package:iza_app/view/drawer/personal_details/chat_section/chat_screen.dart';
import 'package:iza_app/view/drawer/personal_details/quiz_section/quiz_review_answer/quiz.dart';
import 'package:iza_app/view/offer_section/widgets/deals_of_day.dart';
import 'package:iza_app/view/stream/stream_video_section/stream_video_screen.dart';
import 'package:iza_app/view/wishlist_section/wishlist_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileExploreScreen extends StatefulWidget {
  const ProfileExploreScreen({super.key});

  @override
  State<ProfileExploreScreen> createState() => _ProfileExploreScreenState();
}

class _ProfileExploreScreenState extends State<ProfileExploreScreen> {
  final controller = Get.find<BottomNavigationController>();

  @override
  Widget build(BuildContext context) {
    List<String> items = ["Dry Skin", "Treating acne", "Wavy Hair", "Dry Skin"];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back)),
        actions: [
          GestureDetector(
              onTap: () {
                Get.to(() => NotificationScreen());
              },
              child: Image.asset('assets/images/drawer0.png')),
          buildHspacer(2.w),
          GestureDetector(
              onTap: () {
                Get.to(() => WishlistScreen());
              },
              child: Image.asset('assets/images/offerappbar2.png')),
          buildHspacer(2.w),
          Image.asset('assets/images/offerappbar3.png'),
          buildHspacer(2.w),
        ],
      ),
      body: Padding(
        padding: normalPadding,
        child: SingleChildScrollView(
          child: Column(
            spacing: 2.h,
            children: [
              Image.asset('assets/images/profileexpolore.png'),
              buildsTextManrope(
                  title: "Hi, Harshita",
                  size: 19.px,
                  fontWeight: FontWeight.w500,
                  align: true),
              buildsTextManrope(
                  title:
                      "Now tha you’ve built your profile, you will see all content tailor-made for you. you can change your answers by editing your selection here",
                  size: 13.px,
                  fontWeight: FontWeight.w500,
                  align: true),
              profileBuilderMethod(),
              PicksForYouMethod(items),
              dealsOfDay(),
              mainTitleWidget("Offers You will Love"),
              buildVspacer(1.h),
              SizedBox(
                height: Adaptive.h(30),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Image.asset(
                          'assets/images/offers.jpg',
                          height: Adaptive.h(20),
                          width: Adaptive.w(70),
                          fit: BoxFit.cover,
                        ),
                        buildVspacer(1.h),
                        buildsTextBitter(
                          title:
                              "Up to 25% off on modern\nayurvadic skin & air must -\nhaves",
                          size: 15.px,
                          align: true,
                          fontWeight: FontWeight.w500,
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => buildHspacer(3.w),
                  itemCount: 3,
                ),
              ),
              mainTitleWidget("Iza Stream"),
              GestureDetector(
                  onTap: () {
                    Get.to(() => StreamVideoScreen());
                  },
                  child: Image.asset('assets/images/stream4.png')),
              mainTitleWidget("Deals Of The Day"),
              dealsOfDay(),
              _reviewAndTips(),
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(() {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(
              vertical: Adaptive.h(1.2)), // Padding around Row
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem('assets/images/bottom0.png', 0, "Home"),
              _buildNavItem('assets/images/bottom1.png', 1, "Shop"),
              _buildNavItem('assets/images/bottom2.png', 2, "ChatBot"),
              _buildNavItem('assets/images/bottom3.png', 3, "Offers"),
              _buildNavItem('assets/images/bottom4.png', 4, "Stream"),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildNavItem(String assetPath, int index, String title) {
    return GestureDetector(
      onTap: () {
        log("Tapped on item: $index");

        controller.currentIndex.value = index;
        Get.offAll(() => BottomNavigationScreen(
              initialIndex: index,
            ));
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            assetPath,
            color: controller.currentIndex.value == index
                ? primarys
                : Colors.black,
            height: 24.sp,
            width: 24.sp,
          ),
          buildVspacer(1.h),
          buildsTextManrope(
            title: title,
            size: 11.px,
            fontWeight: FontWeight.w400,
            color: controller.currentIndex.value == index
                ? primarys
                : Colors.black,
          )
          // SizedBox(height: 5), // Space between icon and indicator
        ],
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
                "Reviews and Tips",
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
                    width: Adaptive.w(50),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12)),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      color: white,
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
                                size: 24.px,
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

  Column PicksForYouMethod(List<String> items) {
    return Column(
      children: [
        buildsTextBitter(
            title: "Only Picks for you",
            size: 23.px,
            fontWeight: FontWeight.w400,
            align: true),
        buildVspacer(2.h),
        SizedBox(
          height: 5.h,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return IntrinsicWidth(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: Adaptive.w(3)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.sp),
                        color: index == 0 ? black : white,
                        border: Border.all(color: Colors.black26)),
                    child: Center(
                      child: buildsTextManrope(
                        title: items[index],
                        size: 11.px,
                        color: index == 0 ? white : black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => buildHspacer(3.w),
              itemCount: items.length),
        ),
      ],
    );
  }

  Container profileBuilderMethod() {
    return Container(
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(color: Color(0xffFFF1F8)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildsTextManrope(
                  title: "Profile Builder",
                  size: 16.px,
                  fontWeight: FontWeight.w500),
              GestureDetector(
                onTap: () {
                  Get.off(() => QuizReviewSectionScreen());
                },
                child: buildsTextManrope(
                    title: "Edit >", size: 16.px, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          buildVspacer(1.h),
          SizedBox(
            height: 6.h,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return IntrinsicWidth(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: Adaptive.w(3)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.sp),
                        color: white,
                      ),
                      child: Center(
                        child: buildsTextManrope(
                          title: "Oily & Greesy",
                          size: 11.px,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => buildHspacer(2.w),
                itemCount: 4),
          )
        ],
      ),
    );
  }
}
