import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/app_titile_widget.dart';
import 'package:iza_app/view/stream/stream_video_section/stream_video_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StreamWidget extends StatelessWidget {
  const StreamWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: normalPadding,
      child: SingleChildScrollView(
        child: Column(
          children: [
            mainTitleWidget("Tutorials"),
            buildVspacer(2.h),
            SizedBox(
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Get.to(() => StreamVideoScreen());
                        },
                        child: Image.asset('assets/images/stream4.png'));
                  },
                  separatorBuilder: (context, index) => buildVspacer(2.h),
                  itemCount: 3),
            )
          ],
        ),
      ),
    );
  }
}
