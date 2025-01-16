import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTxtFormField extends StatelessWidget {
  CustomTxtFormField(
      {super.key,
      required this.title,
      required this.hintText,
      this.width,
      this.controller,
      this.icon,
      this.fieldsColor,
      this.borderColor,
      this.borderRadius,
      this.contentPadding,
      this.type,
      this.heights});

  final String hintText;
  final double? width;
  final double? heights;
  TextEditingController? controller;
  final Widget? icon;
  final String title;
  final Color? fieldsColor;
  final Color? borderColor; // Custom border color option
  final double? borderRadius; // Custom border radius option
  final EdgeInsetsGeometry? contentPadding; // Custom content padding
  final TextInputType? type;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: buildsTextManrope(
              title: title,
              size: 16.px,
              fontWeight: FontWeight.w500,
              color: lightBlack),
        ),
        Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(12.sp),
          child: SizedBox(
            height: heights ?? Adaptive.h(6),
            width: width ?? double.infinity,
            child: TextField(
              controller: controller,
              keyboardType: type ?? TextInputType.text,
              decoration: InputDecoration(
                contentPadding: contentPadding ?? EdgeInsets.all(12.sp),
                fillColor: fieldsColor ?? white,
                filled: true,
                suffixIcon: icon ?? const SizedBox(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: borderColor ??
                          white),
                  borderRadius: BorderRadius.circular(
                      borderRadius ?? 12.sp), // Custom or default border radius
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor ?? white),
                  borderRadius: BorderRadius.circular(borderRadius ?? 12.sp),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor ?? white),
                  borderRadius: BorderRadius.circular(borderRadius ?? 12.sp),
                ),
                hintText: hintText,
                hintStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 13.px,
                  color: lightBlack,
                ),
              ),
              onChanged: (value) {
                if (controller != null) {
                  controller!.text = value;

                  log("checking controller:$controller");
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
