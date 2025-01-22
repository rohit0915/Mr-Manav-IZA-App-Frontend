import 'dart:async';

import 'package:iza_app/utilz/certificate_widget.dart';
import 'package:iza_app/view/drawer/drawer_screen.dart';
import 'package:iza_app/view/wishlist_section/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/stream/widgets/all_widget.dart';
import 'package:iza_app/view/stream/widgets/blog_widget.dart';
import 'package:iza_app/view/stream/widgets/faq_stream_widget.dart';
import 'package:iza_app/view/stream/widgets/stream_widget.dart';
import 'package:iza_app/view/stream/widgets/ugc_wall_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StreamScreen extends StatefulWidget {
  const StreamScreen({super.key});

  @override
  State<StreamScreen> createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  GlobalKey<ScaffoldState> keyhome = GlobalKey();
  Timer? _timer;

  PageController controller = PageController();
  PageController controller2 = PageController();

  void initState() {
    super.initState();
    _startAutoScroll();
  }

  preCacheimages() {
    precacheImage(AssetImage('assets/images/stream2.png'), context);
    precacheImage(AssetImage('assets/images/stream3.png'), context);
    precacheImage(AssetImage('assets/images/stream4.png'), context);
    precacheImage(AssetImage('assets/images/stream5.png'), context);
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

  RxInt selectedIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    List<String> streamItems = [
      "ALL",
      "BLOGS",
      "STREAM",
      "UGC WALL",
      "FAQ",
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
          GestureDetector(
              onTap: () {
                Get.to(() => WishlistScreen());
              },
              child: Image.asset('assets/images/offerappbar2.png')),
          buildHspacer(2.w),
          Image.asset('assets/images/offerappbar3.png'),
          buildHspacer(2.w),
        ],
        // elevation: 3,
        // backgroundColor: white,
        // surfaceTintColor: white,
      ),
      drawer: SizedBox(width: Adaptive.w(70), child: DrawerMenu()),
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
                  color: grey,
                  letterSpacing: 1.w),
            ),
            buildVspacer(1.h),
            Container(
              height: Adaptive.h(8),
              padding: EdgeInsets.symmetric(
                  horizontal: Adaptive.w(2), vertical: Adaptive.h(1)),
              width: double.infinity,
              decoration: BoxDecoration(
                color: primarys.withOpacity(0.12),
              ),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                separatorBuilder: (context, index) => buildHspacer(6.w),
                itemBuilder: (context, index) {
                  return Obx(() {
                    return GestureDetector(
                      onTap: () {
                        selectedIndex.value = index;
                        controller2.animateToPage(selectedIndex.value,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.bounceIn);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Text widget for the title
                          buildsTextManrope(
                            title: streamItems[index],
                            size: 15.px,
                            fontWeight: FontWeight.w600,
                          ),
                          // SizedBox(height: Adaptive.h(1)), // Add spacing

                          SizedBox(
                            width: _calculateTextWidth(
                                context,
                                streamItems[index],
                                const TextStyle(fontSize: 16.0)),
                            child: Divider(
                              thickness: 4,
                              color: selectedIndex.value == index
                                  ? black
                                  : Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    );
                  });
                },
                itemCount: streamItems.length,
              ),
            ),

            buildVspacer(2.h),
            Expanded(
              child: PageView(
                physics: AlwaysScrollableScrollPhysics(),
                controller: controller2,
                allowImplicitScrolling: true,
                onPageChanged: (value) {
                  selectedIndex.value = value;
                },
                children: [
                  StreamAllWidget(banner: banner),
                  BlogsWidget(banner: banner),
                  StreamWidget(),
                  UgcWallWidget(),
                  FaqStreamWidget()
                ],
              ),
            ),
            buildVspacer(1.h),
            // CertificateWidget(),
          ],
        ),
      ),
    );
  }

  double _calculateTextWidth(
      BuildContext context, String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.width;
  }
}
