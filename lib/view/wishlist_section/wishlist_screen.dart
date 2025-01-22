import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/button_widget.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RxInt totalIndex = 10.obs;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back)),
        title: buildsTextManrope(
            title: "Wishlist", size: 19.px, fontWeight: FontWeight.w600),
        actions: [
          Image.asset('assets/images/offerappbar3.png'),
          buildHspacer(2.w),
        ],
      ),
      body: Obx(() {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: Adaptive.w(3),
            mainAxisSpacing: Adaptive.h(4),
            childAspectRatio: 0.55,
          ),
          itemCount: totalIndex.value,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/offer1.png'),
                      SizedBox(height: 1.h),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Adaptive.w(1)),
                        child: Column(
                          children: [
                            buildsTextManrope(
                              title: "Streax",
                              size: 13.px,
                              fontWeight: FontWeight.w300,
                              align: true,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 1.h),
                            buildsTextManrope(
                              title:
                                  "Streax Hair Serum\nEnriched With Vitamin E",
                              size: 12.px,
                              align: true,
                              fontWeight: FontWeight.w500,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                buildsTextBitter(
                                  title: "₹ 150",
                                  size: 15.px,
                                  fontWeight: FontWeight.w700,
                                ),
                                Text(
                                  "₹ 299",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.px,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Colors.grey,
                                    color: Colors.grey,
                                  ),
                                ),
                                buildsTextManrope(
                                  title: "40% off",
                                  size: 12.px,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.lightGreen,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                ...List.generate(
                                  4,
                                  (index) => Icon(Icons.star),
                                ),
                                buildsTextManrope(
                                  title: "(100)",
                                  color: grey,
                                )
                              ],
                            ),
                            SizedBox(height: 1.h),
                            CustomButton(
                              onpress: () {},
                              title: "Add To Bag",
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    right: 3.w,
                    child: Container(
                      height: Adaptive.h(6),
                      padding: EdgeInsets.all(8.sp),
                      decoration:
                          BoxDecoration(color: Colors.grey.withOpacity(0.1)),
                      child: Center(
                        child: GestureDetector(
                            onTap: () {
                              // isFavorite.value = !isFavorite.value;
                              totalIndex.value = totalIndex.value - 1;
                            },
                            child: Icon(Icons.delete_outline)),
                      ),
                    )),
              ],
            );
          },
        );
      }),
    );
  }
}
