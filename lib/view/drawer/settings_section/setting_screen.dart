import 'package:flutter/material.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notificationsEnabled = false;
  bool optimizedImageQuality = true;
  bool optimizedCheckoutFlow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildsTextManrope(
          title: 'Settings',
          size: 18.sp,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Notifications Section
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildsTextManrope(
                      title: 'Notifications',
                      size: 16.sp,
                      fontWeight: FontWeight.bold,
                      align: true,
                    ),
                    buildsTextManrope(
                      title: 'Get notification on all updates',
                      size: 14.sp,
                      color: Colors.grey,
                      align: true,
                    ),
                  ],
                ),
                Spacer(),
                Checkbox(
                  activeColor: primarys,
                  value: notificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      notificationsEnabled = value!;
                    });
                  },
                )
              ],
            ),

            // Optimized Experience Section
            buildsTextManrope(
              title: 'Optimized Experience',
              size: 16.sp,
              fontWeight: FontWeight.bold,
              align: true,
            ),
            buildsTextManrope(
              title: 'For internet connection quality',
              size: 14.sp,
              color: Colors.grey,
              align: true,
            ),
            CheckboxListTile(
              activeColor: primarys,
              contentPadding: EdgeInsets.zero,
              title: buildsTextManrope(
                title: 'Optimized Image Quality',
                size: 14.sp,
                align: true,
              ),
              value: optimizedImageQuality,
              onChanged: (value) {
                setState(() {
                  optimizedImageQuality = value ?? false;
                });
              },
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            CheckboxListTile(
              activeColor: primarys,
              contentPadding: EdgeInsets.zero,
              title: buildsTextManrope(
                title: 'Optimized Checkout Flow',
                size: 14.sp,
                align: true,
              ),
              value: optimizedCheckoutFlow,
              onChanged: (value) {
                setState(() {
                  optimizedCheckoutFlow = value ?? false;
                });
              },
              controlAffinity: ListTileControlAffinity.trailing,
            ),
          ],
        ),
      ),
    );
  }
}
