import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget buildsTextBitter(
    {required String title,
    double? size,
    FontWeight? fontWeight,
    Color? color,
    bool align = false}) {
  return align
      ? Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            // overflow: TextOverflow.fade,
            style: GoogleFonts.bitter(
                fontSize: size ?? 14,
                fontWeight: fontWeight ?? FontWeight.w400,
                // fontFamily: 'sen',
                color: color ?? Colors.black),
          ),
        )
      : Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.bitter(
              fontSize: size ?? 14,
              fontWeight: fontWeight ?? FontWeight.w400,
              // fontFamily: 'sen',
              color: color ?? Colors.black),
        );
}

Widget buildsTextCormarant(
    {required String title,
    double? size,
    FontWeight? fontWeight,
    Color? color,
    bool align = false}) {
  return align
      ? Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            // overflow: TextOverflow.fade,
            style: GoogleFonts.cormorant(
                fontSize: size ?? 14,
                fontWeight: fontWeight ?? FontWeight.w400,
                // fontFamily: 'sen',
                color: color ?? Colors.black),
          ),
        )
      : Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.cormorant(
              fontSize: size ?? 14,
              fontWeight: fontWeight ?? FontWeight.w400,
              // fontFamily: 'sen',
              color: color ?? Colors.black),
        );
}

Widget buildsTextManrope(
    {required String title,
    double? size,
    FontWeight? fontWeight,
    Color? color,
    bool align = false}) {
  return align
      ? Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            // overflow: TextOverflow.fade,
            style: GoogleFonts.manrope(
                fontSize: size ?? 14,
                fontWeight: fontWeight ?? FontWeight.w400,
                // fontFamily: 'sen',
                color: color ?? Colors.black),
          ),
        )
      : Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.manrope(
              fontSize: size ?? 14,
              fontWeight: fontWeight ?? FontWeight.w400,
              // fontFamily: 'sen',
              color: color ?? Colors.black),
        );
}

Row headingWidget(String title1, String title2) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      buildsTextBitter(
          title: title1,
          size: 24.px,
          fontWeight: FontWeight.w600,
          color: Colors.black),
      buildsTextBitter(
          title: title2,
          size: 14.px,
          fontWeight: FontWeight.w600,
          color: Colors.black),
    ],
  );
}
