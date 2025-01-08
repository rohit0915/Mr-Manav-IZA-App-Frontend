import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/app_titile_widget.dart';
import 'package:iza_app/utilz/button_widget.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/stream/stream_video_section/stream_video_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class StreamAllWidget extends StatelessWidget {
  const StreamAllWidget({
    super.key,
    required this.banner,
  });

  final List<String> banner;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    return SingleChildScrollView(
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
          buildVspacer(2.h),
          SmoothPageIndicator(
            controller: controller,
            count: banner.length,
            axisDirection: Axis.horizontal,
            effect: ExpandingDotsEffect(
                dotWidth: Adaptive.w(2),
                dotHeight: Adaptive.h(1),
                activeDotColor: grey),
          ),
          buildVspacer(2.h),
          headingWidget("Must Read", "View All>"),
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
          buildVspacer(3.h),
          Text(
            "Your Looks, Our Products",
            style: GoogleFonts.bitter(
              fontWeight: FontWeight.w400,
              fontSize: 20.px,
              color: grey.withOpacity(0.8),
              letterSpacing: 1.w,
            ),
          ),
          buildVspacer(2.h),
          SizedBox(
            height: 271.px,
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: Adaptive.w(48),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset('assets/images/stream3.png'),
                          buildVspacer(2.h),
                          buildsTextManrope(
                              title: "Your New Bodycare Routine",
                              size: 11.px,
                              align: true,
                              fontWeight: FontWeight.w500),
                          buildsTextManrope(
                            title:
                                "Lorem ipsum dolor sit amet, cons ectetur adipiscing elit. ",
                            size: 10.px,
                            align: true,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => buildHspacer(2.w),
                itemCount: 2),
          ),
          buildVspacer(2.h),
          mainTitleWidget("Tutorials"),
          buildVspacer(2.h),
          GestureDetector(
              onTap: () {
                Get.to(() => StreamVideoScreen());
              },
              child: Image.asset('assets/images/stream4.png')),
          buildVspacer(1.h),
          buildsTextBitter(
            title: "Influencer Recomendation",
            size: 24.px,
            align: true,
            fontWeight: FontWeight.w500,
          ),
          buildVspacer(1.h),
          buildsTextBitter(
            title: "I’ll have what they are having",
            size: 14.px,
            align: true,
            fontWeight: FontWeight.w400,
          ),
          buildVspacer(1.h),
          SizedBox(
            height: Adaptive.h(16),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/stream5.png'),
                    buildVspacer(1.h),
                    buildsTextBitter(
                      title: "Riya Sharma",
                      size: 13.px,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) => buildHspacer(3.w),
              itemCount: 4,
            ),
          ),
          buildVspacer(2.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Reviews and Tips",
              style: GoogleFonts.bitter(
                fontWeight: FontWeight.w400,
                fontSize: 20.px,
                color: grey.withOpacity(0.8),
                letterSpacing: 1.w,
              ),
            ),
          ),
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
                              size: 24.px,
                              align: true,
                              fontWeight: FontWeight.w500),
                          buildsTextManrope(
                            title: "Bollywood Makeup Stylish and Influencer",
                            size: 10.px,
                            align: true,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => buildHspacer(2.w),
                itemCount: 2),
          ),
        ],
      ),
    );
  }
}
