import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gif/gif.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/button_widget.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/custom_appbar.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/bottom_navigation/custom_bottom_navigator.dart';
import 'package:iza_app/view/drawer/personal_details/chat_section/chat_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CompleteReviewOfQuizScreen extends StatefulWidget {
  const CompleteReviewOfQuizScreen({super.key});

  @override
  State<CompleteReviewOfQuizScreen> createState() =>
      _CompleteReviewOfQuizScreenState();
}

class _CompleteReviewOfQuizScreenState extends State<CompleteReviewOfQuizScreen>
    with TickerProviderStateMixin {
  GifController? _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = GifController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        title: "Build My Profile",
      ),
      body: Padding(
        padding: normalPadding,
        child: Column(
          children: [
            Center(
              child: Gif(
                autostart: Autostart.loop,
                duration: Duration(seconds: 3),
                placeholder: (context) =>
                    const Center(child: CircularProgressIndicator()),
                image: const AssetImage('assets/lottie/profile_json.gif'),
                height: Adaptive.h(16),
                // width: Adaptive.w(50),
                //  fit: BoxFit.scaleDown,
              ),
            ),
            // buildVspacer(1.h),
            buildsTextManrope(
              title: "Thank you for your inputs!",
              size: 17.px,
              fontWeight: FontWeight.w600,
            ),
            buildVspacer(1.h),
            buildsTextManrope(
              title:
                  "Jorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.",
              size: 15.px,
              fontWeight: FontWeight.w400,
            ),
            buildVspacer(1.h),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Adaptive.w(4),
                vertical: Adaptive.h(2),
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromARGB(255, 214, 143, 187),
                Color(0xffFFF7F7)
              ])),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/Traced Image.png'),
                  buildsTextManrope(
                    title: "75 points added to your loyalty program",
                    size: 14.px,
                    fontWeight: FontWeight.w400,
                  ),
                  Icon(
                    Icons.info_outline,
                    color: grey,
                  )
                ],
              ),
            ),
            // buildVspacer(2.h),
            Spacer(),
            Container(
              padding: normalPadding,
              decoration: BoxDecoration(
                  color: Color(0xffEDEDED),
                  borderRadius: BorderRadius.circular(12.sp)),
              child: Row(
                children: [
                  Image.asset('assets/images/profile2.png'),
                  buildHspacer(3.w),
                  Column(
                    children: [
                      buildsTextManrope(
                        title: "Need Personalized Help?",
                        size: 16.px,
                        fontWeight: FontWeight.w500,
                      ),
                      buildsTextManrope(
                        title: "Chat with a Beauty Expert!",
                        fontWeight: FontWeight.w300,
                        size: 15.px,
                      ),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => ChatScreen());
                    },
                    child: buildsTextManrope(
                        title: "Chat Now >", size: 15.px, color: primarys),
                  )
                ],
              ),
            ),
            buildVspacer(2.h),
            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  child: CustomButton(
                    onpress: () {
                      Get.offAll(() => BottomNavigationScreen());
                    },
                    title: "Go to homepage",
                    color: white,
                    textColor: black,
                  ),
                ),
                buildHspacer(3.w),
                Expanded(
                  child: CustomButton(
                    onpress: () {
                      // Get.to(() => CompleteReviewOfQuizScreen());
                    },
                    title: "Explore",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
