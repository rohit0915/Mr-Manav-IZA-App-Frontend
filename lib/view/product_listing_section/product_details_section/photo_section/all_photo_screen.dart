import 'package:flutter/material.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/custom_appbar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AllPhotoScreen extends StatelessWidget {
  const AllPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Photos"),
      body: Padding(
        padding: normalPadding,
        child: Column(
          children: [
            Row(
              spacing: 2.w,
              children: [
                Image.asset('assets/images/photo1.png'),
                Image.asset('assets/images/photo2.png'),
                Image.asset('assets/images/photo1.png')
              ],
            )
          ],
        ),
      ),
    );
  }
}
