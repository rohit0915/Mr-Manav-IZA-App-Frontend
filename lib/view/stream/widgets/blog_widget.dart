import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BlogsWidget extends StatefulWidget {
  const BlogsWidget({super.key, required this.banner});

  final List<String> banner;

  @override
  State<BlogsWidget> createState() => _BlogsWidgetState();
}

class _BlogsWidgetState extends State<BlogsWidget> {
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
              itemCount: widget.banner.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  widget.banner[index],
                );
              },
            ),
          ),
          buildVspacer(2.h),
          SmoothPageIndicator(
            controller: controller,
            count: widget.banner.length,
            axisDirection: Axis.horizontal,
            effect: ExpandingDotsEffect(
                dotWidth: Adaptive.w(2),
                dotHeight: Adaptive.h(1),
                activeDotColor: grey),
          ),
          buildVspacer(2.h),
          // headingWidget("Must Read", "View All>"),
          blogWidget(),
          buildVspacer(1.h),
          blogWidget(),
          buildVspacer(1.h),
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
          buildVspacer(3.h),
        ],
      ),
    );
  }

  Column blogWidget() {
    return Column(
      children: [
        SizedBox(
          height: 245.px,
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                RxBool isFavorite = false.obs;
                return Container(
                  width: Adaptive.w(45),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black12)),
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
        buildVspacer(1.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildHspacer(1.w),
            ...List.generate(
                4,
                (index) => Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: CircleAvatar(
                        radius: 1.w,
                        backgroundColor: grey,
                      ),
                    ))
          ],
        ),
      ],
    );
  }
}
