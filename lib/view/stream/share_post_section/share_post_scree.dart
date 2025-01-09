import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SharePostScreen extends StatelessWidget {
  const SharePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> items = [
      "Skincare",
      "Makeup",
      "Fashion",
      "skincare",
      "skincare"
    ];
    RxBool isClicked = false.obs;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
            )),
        title: buildsTextManrope(
            title: "Create a question",
            size: 19.px,
            fontWeight: FontWeight.w600),
        centerTitle: true,
        actions: [
          Obx(() {
            return GestureDetector(
              onTap: () {
                if (isClicked.value) {
                  Get.back();
                }
              },
              child: Container(
                height: Adaptive.h(5),
                padding: EdgeInsets.symmetric(
                    vertical: Adaptive.h(0.1), horizontal: Adaptive.w(5)),
                decoration: BoxDecoration(
                  color: isClicked.value ? black : grey,
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                child: Center(
                  child: buildsTextManrope(
                      title: "Post",
                      size: 15.px,
                      fontWeight: FontWeight.w500,
                      color: white),
                ),
              ),
            );
          }),
          buildHspacer(3.w)
        ],
      ),
      body: Padding(
        padding: normalPadding,
        child: Column(
          children: [
            Divider(
              color: grey.withOpacity(0.4),
            ),
            buildVspacer(2.h),
            Obx(() {
              return SizedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/images/faq1.png'),
                        buildHspacer(5.w),
                        isClicked.value
                            ? buildsTextManrope(
                                title:
                                    "Jorem ipsum dolor sit amet, consectetur adi pis\ncing elit.",
                                size: 12.px,
                                align: true,
                                fontWeight: FontWeight.w500)
                            : buildsTextManrope(
                                title: "Share your Posts",
                                size: 13.px,
                                fontWeight: FontWeight.w500)
                      ],
                    ),
                    buildVspacer(15.h),
                    isClicked.value
                        ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Container(
                                  width: 20.w,
                                  height: 20.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/post2.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      // Handle delete action
                                    },
                                    child: CircleAvatar(
                                      radius: 10.sp,
                                      backgroundColor: grey.withOpacity(0.5),
                                      child: Icon(Icons.close,
                                          size: 12.sp, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: List.generate(3, (index) {
                                                  return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Container(
                                  width: 20.w,
                                  height: 20.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/post1.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      // Handle delete action
                                    },
                                    child: CircleAvatar(
                                      radius: 10.sp,
                                      backgroundColor: grey.withOpacity(0.5),
                                      child: Icon(Icons.close,
                                          size: 12.sp, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                                                  );
                                                }),
                              ),
                          ],
                        )
                        : SizedBox(),
                    buildVspacer(3.h),
                    SizedBox(
                      height: Adaptive.h(5),
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Adaptive.w(2),
                                    vertical: Adaptive.h(0.1)),
                                decoration: BoxDecoration(
                                    color: Color(0xffF4ACD9).withOpacity(0.2),
                                    border: Border.all(
                                      color: Color(0xffF4ACD9),
                                    ),
                                    borderRadius:
                                        BorderRadius.circular(12.sp)),
                                child: Center(
                                  child: buildsTextManrope(
                                    title: items[index],
                                    size: 11.px,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ));
                          },
                          separatorBuilder: (context, index) =>
                              buildHspacer(2.5.w),
                          itemCount: items.length),
                    ),
                    buildVspacer(2.h),
                    Divider(
                      color: grey.withOpacity(0.4),
                    ),
                    buildVspacer(4.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showAddProductsBottomSheet(context);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: Adaptive.h(0.5),
                              horizontal: Adaptive.w(3),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: black),
                                borderRadius: BorderRadius.circular(14.sp)),
                            child: Row(
                              children: [
                                Icon(Icons.add),
                                buildVspacer(2.w),
                                buildsTextManrope(
                                    title: "Add Products",
                                    size: 13.px,
                                    fontWeight: FontWeight.w500)
                              ],
                            ),
                          ),
                        ),
                        buildHspacer(4.w),
                        GestureDetector(
                          onTap: () {
                            isClicked.value=true;
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: Adaptive.h(0.5),
                              horizontal: Adaptive.w(3),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: black),
                                borderRadius: BorderRadius.circular(14.sp)),
                            child: Row(
                              children: [
                                Icon(Icons.add),
                                buildVspacer(2.w),
                                buildsTextManrope(
                                    title: "Add Photos",
                                    size: 13.px,
                                    fontWeight: FontWeight.w500)
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  void showAddProductsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20), // Rounded corners for the top
        ),
      ),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildsTextManrope(
                        title: "Add Products",
                        size: 16.sp,
                        fontWeight: FontWeight.w600,
                        align: false,
                      ),
                      IconButton(
                        icon: Icon(Icons.mic, size: 22.sp, color: Colors.black),
                        onPressed: () {
                          // Handle microphone icon action
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  // Search Field
                  Container(
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle:
                            TextStyle(fontSize: 14.sp, color: Colors.grey),
                        prefixIcon:
                            Icon(Icons.search, size: 18.sp, color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(2.sp),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  // Product Cards (Mock Data for Now)
                  Wrap(
                    spacing: 4.w,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    runSpacing: 2.h,
                    alignment: WrapAlignment.start,
                    children: List.generate(3, (index) {
                      return Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                            width: 20.w,
                            height: 20.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage('assets/images/post1.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                // Handle delete action
                              },
                              child: CircleAvatar(
                                radius: 10.sp,
                                backgroundColor: grey.withOpacity(0.5),
                                child: Icon(Icons.close,
                                    size: 12.sp, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                  SizedBox(height: 2.h),
                ],
              ),
            ),

            // Done Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close bottom sheet
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: grey.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  child: buildsTextManrope(
                    title: "Done",
                    size: 16.px,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
