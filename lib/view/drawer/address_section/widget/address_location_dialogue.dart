import 'package:flutter/material.dart';
import 'package:iza_app/utilz/button_widget.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<void> showLocationPermissionDialog(BuildContext context) async {
  showDialog(
    context: context,
    // Prevent dismissing the dialog by tapping outside
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Rounded edges
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.location_on_outlined,
                color: Colors.blue,
                size: 8.h,
              ),
              SizedBox(height: 2.h),
              buildsTextManrope(
                title: "Allow Maps to access this device’s precise location?",
                size: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              SizedBox(height: 2.h),
              Image.asset(
                'assets/images/Precise.png', // Replace with your map asset
                height: 20.h,
              ),
              SizedBox(height: 3.h),
              CustomButton(
                title: "While using the app",
                color: Colors.blue,
                textColor: Colors.white,
                onpress: () {
                  Navigator.of(context).pop(); // Close the dialog
                  // Add your logic here
                },
              ),
              SizedBox(height: 1.h),
              CustomButton(
                title: "Only this time",
                color: Colors.blue,
                textColor: Colors.white,
                onpress: () {
                  Navigator.of(context).pop(); // Close the dialog
                  // Add your logic here
                },
              ),
              SizedBox(height: 1.h),
              CustomButton(
                title: "Don’t allow",
                color: Colors.grey.shade300,
                textColor: Colors.black,
                onpress: () {
                  Navigator.of(context).pop(); // Close the dialog
                  // Add your logic here
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
