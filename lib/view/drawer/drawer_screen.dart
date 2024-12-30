import 'package:flutter/material.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                  backgroundImage: AssetImage('assets/drawer0.png'),
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
                    buildsTextManrope(
                      title: "Account",
                      size: 14.sp,
                      color: Colors.grey,
                    ),
                  ],
                ),
                const Spacer(),
                Icon(Icons.notifications, size: 20.sp),
              ],
            ),
          ),
          // Light Mode Toggle
          ListTile(
            leading: Image.asset('assets/drawer1.png', width: 6.w),
            title: buildsTextManrope(
              title: "Light Mode",
              size: 14.sp,
            ),
            trailing: Switch(
              value: false,
              onChanged: (value) {},
            ),
          ),
          const Divider(),

          // Menu Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(
                    "Makeup Vanity", "assets/drawer2.png", "Silver"),
                _buildDrawerItem("Wishlist", "assets/drawer3.png"),
                _buildDrawerItem("Orders", "assets/drawer4.png"),
                _buildDrawerItem("Loyalty Program", "assets/drawer5.png"),
                _buildDrawerItem("Membership", "assets/drawer6.png"),
                _buildDrawerItem("My Beauty Profile", "assets/drawer7.png"),
                _buildDrawerItem("IZA Wallet", "assets/drawer8.png"),
                _buildDrawerItem("Address", "assets/drawer9.png"),
                _buildDrawerItem("Payment", "assets/drawer10.png"),
                _buildDrawerItem("Coupons", "assets/drawer11.png"),
                _buildDrawerItem("Refer and Earn", "assets/drawer12.png"),
                _buildDrawerItem("Help Center", "assets/drawer13.png"),
                _buildDrawerItem("About", "assets/drawer14.png"),
                _buildDrawerItem("Become a Vendor", "assets/drawer15.png"),
                _buildDrawerItem("Settings", "assets/drawer16.png"),
              ],
            ),
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
                  icon: Icon(Icons.logout, size: 18.sp),
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
                    buildsTextManrope(
                      title: "T & C",
                      size: 12.sp,
                      color: Colors.grey,
                    ),
                    buildsTextManrope(
                      title: "Privacy Policy",
                      size: 12.sp,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(String title, String iconPath, [String? subtitle]) {
    return ListTile(
      leading: Image.asset(iconPath, width: 6.w),
      title: buildsTextManrope(
        title: title,
        size: 14.sp,
      ),
      subtitle: subtitle != null
          ? buildsTextManrope(
              title: subtitle,
              size: 12.sp,
              color: Colors.grey,
            )
          : null,
      onTap: () {
        // Define the action for each item here
      },
    );
  }
}
