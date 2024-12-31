import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/stream/widgets/all_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StreamScreen extends StatefulWidget {
  StreamScreen({super.key});

  @override
  State<StreamScreen> createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  GlobalKey<ScaffoldState> keyhome = GlobalKey();
  Timer? _timer;

  PageController controller = PageController();

  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  List<String> banner = [
    "assets/images/stream1.png",
    "assets/images/offer_banner.png",
    "assets/images/stream1.png",
  ];
  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (controller.hasClients) {
        int nextPage = (controller.page?.toInt() ?? 0) + 1;
        if (nextPage >= banner.length) {
          nextPage = 0; // Loop back to the first page
        }
        controller.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> streamItems = [
      "ALL",
      "BLOGS",
      "STREAM",
      "UGC WALL",
      "FAQ",
      ""
    ];
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        surfaceTintColor: white,
        leading: GestureDetector(
            onTap: () {
              keyhome.currentState!.openDrawer();
            },
            child: Image.asset('assets/images/offerappbar1.png')),
        title: Image.asset('assets/images/stream0.png'),
        actions: [
          Icon(Icons.search),
          buildHspacer(2.w),
          Image.asset('assets/images/offerappbar2.png'),
          buildHspacer(2.w),
          Image.asset('assets/images/offerappbar3.png'),
          buildHspacer(2.w),
        ],
        // elevation: 3,
        // backgroundColor: white,
        // surfaceTintColor: white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Adaptive.w(2), vertical: Adaptive.h(1)),
        child: Column(
          children: [
            Divider(
              color: grey.withOpacity(0.4),
              thickness: 2,
            ),
            buildVspacer(2.h),
            // buildsTextBitter(
            //     title: "Your Beauty Space",
            //     size: 20.px,
            //     color: grey.withOpacity(0.3))
            Text(
              "Your Beauty Space",
              style: GoogleFonts.bitter(
                  fontWeight: FontWeight.w400,
                  fontSize: 20.px,
                  color: grey.withOpacity(0.3),
                  letterSpacing: 1.w),
            ),
            buildVspacer(1.h),
            Container(
              height: Adaptive.h(8),
              padding: EdgeInsets.symmetric(
                  horizontal: Adaptive.w(2), vertical: Adaptive.h(1)),
              width: double.infinity,
              decoration: BoxDecoration(
                color: primary.withOpacity(0.12),
              ),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                separatorBuilder: (context, index) => buildHspacer(6.w),
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildsTextManrope(
                          title: streamItems[index],
                          size: 15.px,
                          fontWeight: FontWeight.w600)
                    ],
                  );
                },
                itemCount: streamItems.length,
              ),
            ),
            buildVspacer(2.h),
            Expanded(
              child: PageView(
                allowImplicitScrolling: true,
                children: [
                  StreamAllWidget(controller: controller, banner: banner)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
