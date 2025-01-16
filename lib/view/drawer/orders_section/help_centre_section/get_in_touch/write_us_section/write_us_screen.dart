import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:iza_app/utilz/text_constant.dart';

class WriteToUsScreen extends StatelessWidget {
  const WriteToUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 20.sp, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: buildsTextManrope(
          title: "Write to us",
          size: 18.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildsTextManrope(
              title: "Email",
              size: 16.sp,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 1.h),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter your email",
                hintStyle:
                    GoogleFonts.manrope(color: Colors.black26, fontSize: 14.px),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12)),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
              ),
            ),
            SizedBox(height: 2.h),
            buildsTextManrope(
              title: "Name",
              size: 16.sp,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 1.h),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter your name",
                hintStyle:
                    GoogleFonts.manrope(color: Colors.black26, fontSize: 14.px),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12)),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
              ),
            ),
            SizedBox(height: 2.h),
            buildsTextManrope(
              title: "Query",
              size: 16.sp,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 1.h),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Write your query",
                hintStyle:
                    GoogleFonts.manrope(color: Colors.black26, fontSize: 14.px),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12)),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              ),
            ),
            SizedBox(height: 2.h),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle image upload logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.black),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
                ),
                icon: Icon(Icons.add, color: Colors.black),
                label: buildsTextManrope(
                  title: "Upload Image",
                  size: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle form submission here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: buildsTextManrope(
                  title: "Send",
                  size: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
