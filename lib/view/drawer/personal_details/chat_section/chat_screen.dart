import 'package:flutter/material.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/custom_appbar.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Chat"),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              children: [
                Center(
                  child: buildsTextManrope(
                    title: "Today",
                    size: 12.px,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 2.h),
                // Left-aligned message
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(2.h),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10.px),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildsTextManrope(
                          title:
                              "Vorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac",
                          size: 14.px,
                          align: true,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 1.h),
                buildsTextManrope(
                  title: "12:32",
                  size: 12.px,
                  align: true,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                ),
                SizedBox(height: 2.h),
                // Right-aligned message
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.all(2.h),
                    decoration: BoxDecoration(
                      color: Colors.pink.shade100,
                      borderRadius: BorderRadius.circular(10.px),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildsTextManrope(
                          title: "Forem ipsum dolor sit amet",
                          size: 14.px,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 1.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    buildsTextManrope(
                      title: "12:38",
                      size: 12.px,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: grey.withOpacity(0.4),
          ),
          buildVspacer(2.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(1.h),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8.px),
                  ),
                  child:
                      Icon(Icons.attachment, size: 20.px, color: Colors.grey),
                ),
                SizedBox(width: 2.w),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type here...",
                      hintStyle: TextStyle(fontSize: 14.px),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.px),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                    ),
                  ),
                ),
                SizedBox(width: 2.w),
                buildsTextManrope(
                  title: "Send",
                  size: 14.px,
                  fontWeight: FontWeight.w600,
                  color: Colors.pink,
                ),
              ],
            ),
          ),
          buildVspacer(5.h)
        ],
      ),
    );
  }
}
