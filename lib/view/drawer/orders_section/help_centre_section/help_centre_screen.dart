import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/drawer/orders_section/help_centre_section/help_details_section/help_details_screen.dart';
import 'package:iza_app/view/drawer/personal_details/chat_section/chat_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: buildsTextManrope(
          title: "Help Center",
          size: 18.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 20.sp, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Adaptive.h(5),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: GoogleFonts.manrope(fontSize: 14.sp),
                  prefixIcon:
                      Icon(Icons.search, size: 20.sp, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                ),
              ),
            ),
            SizedBox(height: 4.h),
            // Browse Topics Section
            buildsTextManrope(
              title: "Browse topic",
              size: 16.sp,
              fontWeight: FontWeight.w600,
              align: true,
            ),
            SizedBox(height: 2.h),
            // Grid Items
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 4.w,
              mainAxisSpacing: 2.h,
              childAspectRatio: 3 / 2,
              physics: NeverScrollableScrollPhysics(),
              children: [
                GestureDetector(
                  onTap: (){
                                    Get.to(() => HelpCenterDetailsScreen());

                  },
                  child: helpTopicItem(
                    icon: "help1",
                    label: "Order Related",
                  ),
                ),
                helpTopicItem(
                  icon: "help2",
                  label: "Shopping",
                ),
                helpTopicItem(
                  icon: "help3",
                  label: "Payments",
                ),
                helpTopicItem(
                  icon: "help1",
                  label: "Account",
                ),
              ],
            ),
            SizedBox(height: 4.h),
            // Need More Help Section
            buildsTextManrope(
              title: "Need more help?",
              size: 16.sp,
              fontWeight: FontWeight.w600,
              align: true,
            ),
            SizedBox(height: 2.h),
            // Help Options
            GestureDetector(
              onTap: () {
                Get.to(() => ChatScreen());
              },
              child: helpOptionItem(
                icon: Icons.chat_bubble_outline,
                title: "Chat with us",
                subtitle: "Lorem ipsum dolor sit",
              ),
            ),
            SizedBox(height: 1.h),
            helpOptionItem(
              icon: Icons.headset_mic,
              title: "Get in touch",
              subtitle: "",
            ),
          ],
        ),
      ),
    );
  }

  Widget helpTopicItem({required String icon, required String label}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/$icon.png'),
          SizedBox(height: 1.h),
          buildsTextManrope(
            title: label,
            size: 14.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  Widget helpOptionItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: EdgeInsets.all(2.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(icon, size: 22.sp, color: Colors.grey),
          SizedBox(width: 4.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildsTextManrope(
                title: title,
                size: 15.px,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              if (subtitle.isNotEmpty)
                buildsTextManrope(
                  title: subtitle,
                  size: 12.px,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
