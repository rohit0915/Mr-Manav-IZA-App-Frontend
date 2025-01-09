import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/custom_appbar.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/stream/widgets/common_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FaqQuestionSectionScreen extends StatelessWidget {
  const FaqQuestionSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Question",
      ),
      body: Padding(
        padding: normalPadding,
        child: Column(
          children: [
            faqItemMethodWidget(),
            buildVspacer(3.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/ugcwall1.png'),
                SizedBox(
                  width: Adaptive.w(80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildVspacer(2.h),
                      buildsTextManrope(
                          title: "Nancy Singh",
                          size: 14.px,
                          fontWeight: FontWeight.w600),
                      buildVspacer(2.h),
                      buildsTextManrope(
                          title:
                              "Norem ipsum dolor sit amet, consectetur adip\niscing elit. Nunc",
                          size: 13.px,
                          fontWeight: FontWeight.w400,
                          align: true),
                      buildVspacer(2.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/images/faqback.png'),
                              buildHspacer(2.w),
                              buildsTextManrope(
                                title: "Reply",
                                size: 12.px,
                                fontWeight: FontWeight.w500,
                              )
                            ],
                          ),
                          // Spacer(),
                          buildsTextManrope(
                              title: "16 Nov 2024",
                              size: 11.px,
                              fontWeight: FontWeight.w400,
                              color: grey.withOpacity(0.5))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            buildVspacer(3.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/ugcwall1.png'),
                SizedBox(
                  width: Adaptive.w(80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildVspacer(2.h),
                      buildsTextManrope(
                          title: "Nancy Singh",
                          size: 14.px,
                          fontWeight: FontWeight.w600),
                      buildVspacer(2.h),
                      buildsTextManrope(
                          title:
                              "Norem ipsum dolor sit amet, consectetur adip\niscing elit. Nunc",
                          size: 13.px,
                          fontWeight: FontWeight.w400,
                          align: true),
                      buildVspacer(2.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/images/faqback.png'),
                              buildHspacer(2.w),
                              buildsTextManrope(
                                title: "Reply",
                                size: 12.px,
                                fontWeight: FontWeight.w500,
                              )
                            ],
                          ),
                          // Spacer(),
                          buildsTextManrope(
                              title: "16 Nov 2024",
                              size: 11.px,
                              fontWeight: FontWeight.w400,
                              color: grey.withOpacity(0.5))
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        child: Column(

          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(
              color: grey.withOpacity(0.4),
            ),
            buildVspacer(5.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white10,
                // border: Border(top: BorderSide(color: Colors.grey.shade300)),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.attach_file, color: Colors.grey),
                    onPressed: () {
                      // Handle file attachment
                    },
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Type here...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Send',
                      style: GoogleFonts.manrope(
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
