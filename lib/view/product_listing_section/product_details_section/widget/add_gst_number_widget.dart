import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/button_widget.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/view/bottom_navigation/custom_bottom_navigator.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void showGstDetailsBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drag Handle
            Center(
              child: Container(
                width: 10.w,
                height: 0.5.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 2.h),

            // Header
            Center(
              child: Text(
                "Add GST Details",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 1.h),

            // Sub-header
            Center(
              child: Text(
                "If you’re a business owner, add your GST details\nand get GST invoice on your orders",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey,
                  height: 1.5,
                ),
              ),
            ),
            SizedBox(height: 2.h),

            // GST Number Input Field
            Text(
              "GST Number",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 1.h),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter GST Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey[400]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.black),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
              ),
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 3.h),

            // Confirm Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Confirm action
                  Get.back();
                  showOtpSectionBottomSheet(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 1.5.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Confirm",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 1.h),

            // Terms & Conditions
            Center(
              child: Text(
                "By Continuing you agree to our Terms & Conditions",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 2.h),
          ],
        ),
      );
    },
  );
}

void showOtpSectionBottomSheet(BuildContext context) {
  final defaultPinTheme = PinTheme(
    width: 46,
    height: 46,
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(10),
    ),
  );
  final focusedPinTheme = defaultPinTheme.copyDecorationWith(
    border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
    borderRadius: BorderRadius.circular(0),
  );

  final submittedPinTheme = defaultPinTheme.copyWith(
    decoration: defaultPinTheme.decoration!.copyWith(
      color: Color.fromRGBO(234, 239, 243, 1),
    ),
  );
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                    onPressed: () {
                      // login.isClicked.value = false;
                    },
                    icon: Icon(
                      Icons.arrow_back_rounded,
                    )),
              ),
              buildVspacer(2.h),
              Pinput(
                length: 6,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                validator: (s) {
                  return s == '2222' ? null : 'Pin is incorrect';
                },
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin) {
                  print(pin);
                },
              ),
              buildVspacer(2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Edit Number",
                    style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w500,
                        color: primarys,
                        fontSize: 15.px),
                  ),
                  Text(
                    "Resend OTP ",
                    style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w500,
                        color: primarys,
                        fontSize: 15.px),
                  ),
                ],
              ),
              buildVspacer(2.h),
              const SizedBox(height: 24.0),
              CustomButton(
                onpress: () {
                  Get.offAll(() => BottomNavigationScreen());
                },
              ),
              const SizedBox(height: 16.0),
              Row(
                children: const [
                  Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'OR',
                      style: TextStyle(fontSize: 14.0, color: Colors.grey),
                    ),
                  ),
                  Expanded(child: Divider(thickness: 1)),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade200)),
                    child: IconButton(
                      icon: Image.asset('assets/images/login-logo1.png'),
                      iconSize: 40,
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 24.0),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade200)),
                    child: IconButton(
                      icon: Image.asset('assets/images/login-logo2.png'),
                      iconSize: 40,
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 24.0),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade200)),
                    child: IconButton(
                      icon: Image.asset('assets/images/login-logo3.png'),
                      iconSize: 40,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              buildVspacer(2.h)
            ],
          ));
    },
  );
}
