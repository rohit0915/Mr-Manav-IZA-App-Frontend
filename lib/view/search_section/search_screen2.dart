import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/offer_section/widgets/deals_of_day.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchScreen2 extends StatelessWidget {
  const SearchScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      "Loreal Paris",
      "My Glamm",
      "Loreal Paris",
      "My Glamm"
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        title: GestureDetector(
          onTap: () {},
          child: SizedBox(
            height: Adaptive.h(5),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                hintText: "Serum",
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                // suffixIcon: Icon(Icons.mic, color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
        actions: [Image.asset('assets/images/search1.png'), buildHspacer(3.w)],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(4)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildVspacer(2.h),
              recentlyItem(),
              buildVspacer(2.h),
              recentlyItem(),
              buildVspacer(2.h),
              recentlyItem(),
              buildVspacer(2.h),
              recentlyItem(),
              buildVspacer(2.h),
              recentlyItem(),
              buildVspacer(2.h),
              buildsTextBitter(
                  title: "Categories",
                  size: 15.px,
                  fontWeight: FontWeight.w600,
                  align: true),
              SizedBox(height: 8),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: List.generate(6, (index) {
                  return Chip(
                    label: Text("Serum & Essence"),
                    backgroundColor: Colors.white,
                    shape: StadiumBorder(
                      side: BorderSide(color: Colors.black),
                    ),
                  );
                }),
              ),
              buildVspacer(2.h),
              buildsTextBitter(
                  title: "Brands",
                  size: 14.px,
                  fontWeight: FontWeight.w500,
                  align: true),
              buildVspacer(2.h),
              SizedBox(
                height: Adaptive.h(10),
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Image.asset('assets/images/loral_logo.png.png'),
                          // buildVspacer(2.h),
                          buildsTextManrope(
                              title: titles[index],
                              size: 10.px,
                              fontWeight: FontWeight.w500)
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => buildHspacer(4.w),
                    itemCount: titles.length),
              ),
              buildVspacer(2.h),
              buildsTextBitter(
                  title: "Product Suggestion",
                  size: 14.px,
                  fontWeight: FontWeight.w500,
                  align: true),
              buildVspacer(2.h),
              Row(
                children: [
                  Image.asset('assets/images/searchitems4.png'),
                  buildHspacer(2.h),
                  buildsTextManrope(
                      title:
                          "Jorem ipsum dolor sit amet, consectetur\nadipiscing elit.",
                      size: 12.px,
                      align: true,
                      fontWeight: FontWeight.w500)
                ],
              ),
               buildVspacer(2.h),
              Row(
                children: [
                  Image.asset('assets/images/searchitems4.png'),
                  buildHspacer(2.h),
                  buildsTextManrope(
                      title:
                          "Jorem ipsum dolor sit amet, consectetur\nadipiscing elit.",
                      size: 12.px,
                      align: true,
                      fontWeight: FontWeight.w500)
                ],
              ),
               buildVspacer(2.h),
              Row(
                children: [
                  Image.asset('assets/images/searchitems4.png'),
                  buildHspacer(2.h),
                  buildsTextManrope(
                      title:
                          "Jorem ipsum dolor sit amet, consectetur\nadipiscing elit.",
                      size: 12.px,
                      align: true,
                      fontWeight: FontWeight.w500)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Row recentlyItem() {
    return Row(
      children: [
        Icon(
          Icons.search_outlined,
          color: grey.withOpacity(0.4),
        ),
        buildHspacer(3.w),
        buildsTextManrope(
          title: "Plum Goodness Serum",
          size: 12.px,
          fontWeight: FontWeight.w500,
        )
      ],
    );
  }
}
