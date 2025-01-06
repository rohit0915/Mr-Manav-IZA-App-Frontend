import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/custom_appbar.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Notifacation"),
      body: Padding(
        padding: normalPadding,
        child: Column(
          children: [
            Divider(
              color: grey.withOpacity(0.4),
            ),
            SizedBox(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(12.sp),
                      child: Column(
                        children: [
                          buildsTextManrope(
                              title: "Your order is shipped",
                              size: 14.px,
                              fontWeight: FontWeight.w500,
                              align: true),
                          buildVspacer(1.h),
                          buildsTextManrope(
                            title:
                                "Forem ipsum dolor sit amet, consectetur adipiscing elit.",
                            size: 12.px,
                            color: grey.withOpacity(0.5),
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                        color: grey.withOpacity(0.4),
                        thickness: 1,
                      ),
                  itemCount: 2 ),
            )
          ],
        ),
      ),
    );
  }
}
