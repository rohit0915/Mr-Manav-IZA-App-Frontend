import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/button_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import 'package:iza_app/controller/login_controller.dart';

class LoginWidget1 extends StatelessWidget {
  const LoginWidget1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final login = Get.put(LoginController());

    return Column(
      children: [
        Text(
          "Login Or Signup",
          style: GoogleFonts.bitter(
            fontWeight: FontWeight.w300,
            fontSize: 24.px,
          ),
        ),
        buildVspacer(1.h),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Phone Number",
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.w400,
              fontSize: 15.px,
            ),
          ),
        ),
        buildVspacer(1.h),
        IntlPhoneField(
          decoration: InputDecoration(
            labelText: 'Phone Number',
            labelStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.grey), // Border color
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                  color: Colors.grey
                      .withOpacity(0.1)), // Border color when not focused
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                  color: Colors.grey, width: 1), // Border color when focused
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.flag, color: Colors.grey),
                  const SizedBox(width: 4),
                  Icon(Icons.arrow_drop_down, color: Colors.grey),
                  const SizedBox(width: 8),
                  Container(
                    height: 24,
                    width: 1,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
          ),
          initialCountryCode: 'IN',
          onChanged: (phone) {
            print(phone.completeNumber); // Handle phone input
          },
          showDropdownIcon: false,
          flagsButtonMargin: EdgeInsets.zero,
        ),
        const SizedBox(height: 24.0),
        CustomButton(
          onpress: () {
            login.isClicked.value = true;
            log("isCliked from:${login.isClicked.value}");
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
    );
  }
}
