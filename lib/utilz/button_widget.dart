import 'package:flutter/material.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.onpress, this.width, this.height, this.title});
  final String? title;
  final double? width;
  final double? height;
  final Function() onpress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height ?? Adaptive.h(6),
      child: ElevatedButton(
        onPressed: onpress,
        style: ElevatedButton.styleFrom(
          backgroundColor: black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          minimumSize: const Size(double.infinity, 50),
        ),
        child: Text(
          title ?? 'Continue',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
