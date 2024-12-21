import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/view/login_section/login_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/landing.png',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Adaptive.w(3)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildVspacer(30.h),
                Stack(
                  children: [
                    Text(
                      "Discover a world of \nbeauty ",
                      style: GoogleFonts.cormorant(
                          fontWeight: FontWeight.w700,
                          fontSize: 30.px,
                          color: white),
                    ),
                    Positioned(
                        right: 0,
                        bottom: 1.h,
                        child: Image.asset(
                          'assets/images/landing2.png',
                          width: Adaptive.w(40),
                          fit: BoxFit.fill,
                        ))
                  ],
                ),
                buildVspacer(1.h),
                Text(
                  "tailored just for you.",
                  style: GoogleFonts.cormorant(
                      fontWeight: FontWeight.w700,
                      fontSize: 30.px,
                      color: white),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: Adaptive.h(8)),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ));
          },
          child: Container(
            height: Adaptive.h(6),
            width: Adaptive.w(80),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xffF8069D), Color(0xff000000)]),
                borderRadius: BorderRadius.circular(12.sp)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Get Started ",
                  style: GoogleFonts.bitter(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.px,
                      color: white),
                ),
                buildHspacer(1.w),
                Image.asset('assets/images/landing3.png')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
