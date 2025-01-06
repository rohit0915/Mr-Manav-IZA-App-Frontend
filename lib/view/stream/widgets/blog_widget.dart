
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BlogsWidget extends StatelessWidget {
   const BlogsWidget({super.key,required this. controller,required this.banner});
 

   final PageController controller;
  final List<String> banner;
  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}