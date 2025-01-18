import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iza_app/utilz/button_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PostReviewScreen extends StatelessWidget {
  const PostReviewScreen({Key? key}) : super(key: key);

  Widget buildsTextManrope({
    required String title,
    double? size,
    FontWeight? fontWeight,
    Color? color,
    bool align = false,
  }) {
    return align
        ? Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: GoogleFonts.manrope(
                fontSize: size ?? 14,
                fontWeight: fontWeight ?? FontWeight.w400,
                color: color ?? Colors.black,
              ),
            ),
          )
        : Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.manrope(
              fontSize: size ?? 14,
              fontWeight: fontWeight ?? FontWeight.w400,
              color: color ?? Colors.black,
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildsTextManrope(
          title: 'Post a review',
          size: 18.sp,
          fontWeight: FontWeight.bold,
          align: true,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Information
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset('assets/images/image_product.png'),
                ),
                SizedBox(width: 4.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildsTextManrope(
                      title: 'Streax',
                      size: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 0.5.h),
                    buildsTextManrope(
                        title:
                            'Lorem ipsum dolor sit amet Lorem\nipsum dolor sit amet',
                        size: 14.sp,
                        align: true),
                  ],
                ),
              ],
            ),
            SizedBox(height: 3.h),

            // Star Rating
            Row(
              children: List.generate(
                5,
                (index) => IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.star_border,
                      size: 28, color: Colors.grey),
                ),
              ),
            ),
            buildsTextManrope(
              title: 'Rate',
              size: 14.sp,
              color: Colors.grey,
            ),
            SizedBox(height: 2.h),

            // Write a Review
            buildsTextManrope(
              title: 'Write a review',
              size: 14.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 1.h),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText:
                    'Would you like to write anything about this product?',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 2.h),

            // Upload Image Button
            Align(
              alignment: Alignment.centerRight,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add, color: Colors.black),
                label: buildsTextManrope(
                  title: 'Upload Image',
                  size: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.black),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const Spacer(),

            // Submit Button
            CustomButton(
              onpress: () {
                Get.back();
              },
              title: 'Submit Review',
              color: Colors.black,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
