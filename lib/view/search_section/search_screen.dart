import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iza_app/main.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/offer_section/widgets/deals_of_day.dart';
import 'package:iza_app/view/search_section/search_screen2.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          onTap: () {
          Get.to(()=>SearchScreen2());
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
                                title: "Search For serum",
                                size: 14.px,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey)
                          ],
                        ),
                      ),
        ),
        actions: [
          Image.asset('assets/images/search1.png'),
          buildHspacer(3.w)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Trending Searches
              Text(
                "Trending Searches",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5, // Replace with actual data count
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 8.0),
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Image.asset('assets/images/searchitems$index.png'),
                          Text(
                            "Plum Serum..",
                            style: TextStyle(fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
          
              // Categories
              Text(
                "Categories",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
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
              SizedBox(height: 16),
          
              // Recently Viewed
              Text(
                "Recently Viewed",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
             dealsOfDay()
            ],
          ),
        ),
      ),
    );
  }
}
