import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/button_widget.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/view/bottom_navigation/custom_bottom_navigator.dart';
import 'package:iza_app/view/login_section/widgets/screen_widget1.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import 'package:iza_app/controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
    final login = Get.put(LoginController());

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: Adaptive.w(4),
                          vertical: Adaptive.h(1),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.sp),
                            color: Color(0xff15151533)),
                        child: Center(
                          child: Text(
                            "Skip",
                            style: GoogleFonts.bitter(
                                fontWeight: FontWeight.w700,
                                fontSize: 16.px,
                                color: Colors.white70),
                          ),
                        ),
                      )
                    ],
                  ),
                  buildVspacer(3.h),
                  Image.asset(
                    'assets/images/splashLogo.png',
                    height: Adaptive.h(40),
                    fit: BoxFit.fill,
                  ),
                  // buildVspacer(2.h),
                ],
              ),
              Obx(() {
                log("isLoged:${login.isClicked.value}");
                return login.isClicked.value
                    ? Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                                onPressed: () {
                                  login.isClicked.value = false;
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
                            pinputAutovalidateMode:
                                PinputAutovalidateMode.onSubmit,
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
                              Get.to(() => BottomNavigationScreen());
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
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.grey),
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
                                padding: EdgeInsets.symmetric(
                                    horizontal: Adaptive.w(2)),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey.shade200)),
                                child: IconButton(
                                  icon: Image.asset(
                                      'assets/images/login-logo1.png'),
                                  iconSize: 40,
                                  onPressed: () {},
                                ),
                              ),
                              const SizedBox(width: 24.0),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Adaptive.w(2)),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey.shade200)),
                                child: IconButton(
                                  icon: Image.asset(
                                      'assets/images/login-logo2.png'),
                                  iconSize: 40,
                                  onPressed: () {},
                                ),
                              ),
                              const SizedBox(width: 24.0),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Adaptive.w(2)),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey.shade200)),
                                child: IconButton(
                                  icon: Image.asset(
                                      'assets/images/login-logo3.png'),
                                  iconSize: 40,
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                          buildVspacer(2.h)
                        ],
                      )
                    : LoginWidget1();
              })
            ],
          ),
        ),
      ),
    );
  }
}
