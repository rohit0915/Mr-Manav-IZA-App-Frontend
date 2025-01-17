import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gif/gif.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/cart_payment_address_section/confirmation_section/confirmartion_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CompleteMessageScreen extends StatefulWidget {
  const CompleteMessageScreen({super.key});

  @override
  State<CompleteMessageScreen> createState() => _CompleteMessageScreenState();
}

class _CompleteMessageScreenState extends State<CompleteMessageScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 2),
      () {
        Get.to(() => ConfirmationScreen());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Adaptive.h(100),
        width: Adaptive.w(100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Gif(
                autostart: Autostart.loop,
                duration: Duration(seconds: 3),
                placeholder: (context) =>
                    const Center(child: CircularProgressIndicator()),
                image: const AssetImage('assets/lottie/figmagif.gif'),
                height: Adaptive.h(16),
                // width: Adaptive.w(50),
                //  fit: BoxFit.scaleDown,
              ),
            ),
            buildVspacer(1.h),
            buildsTextManrope(
                title: "Congratulation!",
                size: 24.px,
                color: primarys,
                fontWeight: FontWeight.w600),
            buildVspacer(1.h),
            buildsTextManrope(
                title: "Your order has been placed successfully",
                size: 15.px,
                color: primarys,
                fontWeight: FontWeight.w600)
          ],
        ),
      ),
    );
  }
}
