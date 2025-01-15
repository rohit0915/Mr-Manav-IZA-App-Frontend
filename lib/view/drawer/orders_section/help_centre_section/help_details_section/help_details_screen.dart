import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HelpCenterDetailsScreen extends StatelessWidget {
  const HelpCenterDetailsScreen({Key? key}) : super(key: key);

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
                fontSize: size ?? 14.sp,
                fontWeight: fontWeight ?? FontWeight.w400,
                color: color ?? Colors.black,
              ),
            ),
          )
        : Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.manrope(
              fontSize: size ?? 14.sp,
              fontWeight: fontWeight ?? FontWeight.w400,
              color: color ?? Colors.black,
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: buildsTextManrope(
          title: "Order Related",
          size: 18.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 20.sp, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First ExpansionTile
            buildsTextManrope(
              title: "Details",
              size: 16.sp,
              fontWeight: FontWeight.w600,
              align: true,
            ),
            SizedBox(height: 2.h),
            ExpansionTile(
              title: buildsTextManrope(
                title: "Forem ipsum dolor sit",
                size: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              trailing: Icon(
                Icons.arrow_drop_down,
                size: 20.sp,
                color: Colors.grey,
              ),
              children: [
                buildsTextManrope(
                  title: "Detailed description goes here. Add more text to explain this item.",
                  size: 12.sp,
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(height: 2.h),
            // Second ExpansionTile
            ExpansionTile(
              title: buildsTextManrope(
                title: "Forem ipsum dolor sit",
                size: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              trailing: Icon(
                Icons.arrow_drop_down,
                size: 20.sp,
                color: Colors.grey,
              ),
              children: [
                buildsTextManrope(
                  title: "Detailed description goes here. Add more text to explain this item.",
                  size: 12.sp,
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
