import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/cart/coupon_section/coupon_screen.dart';
import 'package:iza_app/view/drawer/about_us_section/about_us_screen.dart';
import 'package:iza_app/view/drawer/about_us_section/privacy_plicy_policy/privacy_policy_screen.dart';
import 'package:iza_app/view/drawer/about_us_section/terms_and_condition/terms_and_condition.dart';
import 'package:iza_app/view/drawer/address_section/address_screen.dart';
import 'package:iza_app/view/drawer/membership/membership_section.dart';
import 'package:iza_app/view/drawer/notification/notification_screen.dart';
import 'package:iza_app/view/drawer/orders_section/help_centre_section/help_centre_screen.dart';
import 'package:iza_app/view/drawer/orders_section/orders_screen.dart';
import 'package:iza_app/view/drawer/payment_section/payment_screen.dart';
import 'package:iza_app/view/drawer/personal_details/personal_details_screen.dart';
import 'package:iza_app/view/drawer/refer_and_earn/refer_and_earn.dart';
import 'package:iza_app/view/drawer/wallet_section/wallet_screen.dart';
import 'package:iza_app/view/wishlist_section/wishlist_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 5.h),
              color: Colors.pink.shade100,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 6.w,
                    child: Center(
                      child: Icon(
                        Icons.person_2,
                        color: grey,
                      ),
                    ),
                  ),
                  SizedBox(width: 3.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildsTextManrope(
                        title: "Hey, Harshita",
                        size: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();

                          Get.to(() => PersonalDetailsScreen());
                        },
                        child: buildsTextManrope(
                          title: "Account",
                          size: 15.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        Get.back();
                        Get.to(() => NotificationScreen());
                      },
                      child: Image.asset('assets/images/drawer0.png')),
                ],
              ),
            ),

            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                  horizontal: Adaptive.w(2), vertical: Adaptive.h(2)),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Adaptive.w(2), vertical: Adaptive.h(1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/drawer1.png', width: 6.w),
                          SizedBox(width: 4.w),
                          buildsTextManrope(
                            title: "Light Mode",
                            size: 14.sp,
                          ),
                        ],
                      ),
                      Icon(
                        Icons.toggle_off_outlined,
                        color: grey,
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(
                //       horizontal: Adaptive.w(2), vertical: Adaptive.h(1)),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Row(
                //         children: [
                //           buildsTextManrope(
                //               title: "makeup Vanity", size: 12.px),
                //           buildHspacer(1.h),
                //           Icon(Icons.keyboard_arrow_down_sharp)
                //         ],
                //       ),
                //       buildsTextManrope(
                //           title: "Diamand", size: 10.px, color: grey)
                //     ],
                //   ),
                // ),
                GestureDetector(
                    onTap: () {
                      Get.back();
                      Get.to(() => WishlistScreen());
                    },
                    child: _buildDrawerItem(
                        "Wishlist", "assets/images/drawer2.png")),
                GestureDetector(
                    onTap: () {
                      Get.back();

                      Get.to(() => OrdersScreen());
                    },
                    child: _buildDrawerItem(
                        "Orders", "assets/images/drawer3.png")),
                _buildDrawerItem(
                    "Loyalty Program", "assets/images/drawer4.png"),
                GestureDetector(
                    onTap: () {
                      Get.back();
                      Get.to(() => MembershipSectionScreen());
                    },
                    child: _buildDrawerItem(
                        "Membership", "assets/images/drawer5.png")),
                _buildDrawerItem(
                    "My Beauty Profile", "assets/images/drawer6.png"),
                GestureDetector(
                    onTap: () {
                      Get.back();
                      Get.to(() => IzaWalletScreen());
                    },
                    child: _buildDrawerItem(
                        "IZA Wallet", "assets/images/drawer7.png")),
                GestureDetector(
                    onTap: () {
                      Get.back();
                      Get.to(() => AddressScreen());
                    },
                    child: _buildDrawerItem(
                        "Address", "assets/images/drawer8.png")),
                GestureDetector(
                    onTap: () {
                      Get.back();
                      Get.to(() => PaymentScreen());
                    },
                    child: _buildDrawerItem(
                        "Payment", "assets/images/drawer9.png")),
                GestureDetector(
                    onTap: () {
                      Get.to(() => CouponScreen());
                    },
                    child: _buildDrawerItem(
                        "Coupons", "assets/images/drawer10.png")),
                GestureDetector(
                  onTap: () {
                    Get.back();
                    Get.to(() => ReferAndEarnScreen());
                  },
                  child: _buildDrawerItem(
                      "Refer and Earn", "assets/images/drawer11.png"),
                ),
                GestureDetector(
                    onTap: () {
                      Get.back();
                      Get.to(() => HelpCenterScreen());
                    },
                    child: _buildDrawerItem(
                        "Help Center", "assets/images/drawer12.png")),
                GestureDetector(
                    onTap: () {
                      Get.back();
                      Get.to(() => AboutUsScreen());
                    },
                    child: _buildDrawerItem(
                        "About", "assets/images/drawer13.png")),
                _buildDrawerItem(
                    "Become a Vendor", "assets/images/drawer14.png"),
                GestureDetector(
                    onTap: () {
                      Get.back();
                      Get.to(() => ReferAndEarnScreen());
                    },
                    child: _buildDrawerItem(
                        "Settings", "assets/images/drawer15.png")),
              ],
            ),

            const Divider(),

            // Footer Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.sp),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 10.w),
                    ),
                    icon: Icon(
                      Icons.logout,
                      size: 18.sp,
                      color: white,
                    ),
                    label: buildsTextManrope(
                      title: "Logout",
                      size: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildsTextManrope(
                        title: "Language",
                        size: 12.sp,
                        color: Colors.grey,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                          Get.to(() => TermsAndConditionScreen());
                        },
                        child: buildsTextManrope(
                          title: "T & C",
                          size: 12.sp,
                          color: Colors.grey,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                          Get.to(() => PrivacyPolicyScreen());
                        },
                        child: buildsTextManrope(
                          title: "Privacy Policy",
                          size: 12.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(String title, String iconPath, [String? subtitle]) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Adaptive.w(2), vertical: Adaptive.h(1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(iconPath, width: 6.w),
          SizedBox(width: 4.w),
          buildsTextManrope(
            title: title,
            size: 14.sp,
          ),
        ],
      ),
    );
  }
}
