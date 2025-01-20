import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onpress,
    this.width,
    this.height,
    this.textColor,
    this.title,
    this.color,
    this.borderColor,
    this.textSize,
    this.radious
  });

  final String? title;
  final double? width;
  final double? height;
    final double? textSize;
    final double? radious;

  final Function() onpress;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? Adaptive.h(6), // Responsive height using responsive_sizer
      child: ElevatedButton(
        onPressed: onpress,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Colors.black, // Replaces `primary`
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radious??8.0),
            side: BorderSide(color: borderColor ?? Colors.black),
          ),
          minimumSize: const Size(double.infinity, 50), // Ensures button size
        ),
        child: Text(
          title ?? 'Continue',
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize:textSize?? 16.sp, 
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
