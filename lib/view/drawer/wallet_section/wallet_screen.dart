import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class IzaWalletScreen extends StatelessWidget {
  const IzaWalletScreen({Key? key}) : super(key: key);

  Widget buildsTextManrope({
    required String title,
    double? size,
    FontWeight? fontWeight,
    Color? color,
    bool align = false,
  }) {
    return align
        ? Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: GoogleFonts.manrope(
                fontSize: size ?? 14,
                fontWeight: fontWeight ?? FontWeight.w400,
                color: color ?? Colors.black,
              ),
            ),
          )
        : Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.manrope(
              fontSize: size ?? 14,
              fontWeight: fontWeight ?? FontWeight.w400,
              color: color ?? Colors.black,
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildsTextManrope(
          title: "IZA Wallet",
          size: 18.sp,
          fontWeight: FontWeight.w600,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 20.sp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          // Wallet Balance Section
          Container(
            color: Colors.pink.shade50,
            padding: EdgeInsets.symmetric(vertical: 4.h),
            width: double.infinity,
            child: Column(
              children: [
                buildsTextManrope(
                  title: "Wallet Balance",
                  size: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                SizedBox(height: 1.h),
                buildsTextManrope(
                  title: "₹ 0.0",
                  size: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          // Wallet History Section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildsTextManrope(
                  title: "Wallet History",
                  size: 16.sp,
                  fontWeight: FontWeight.w600,
                  align: true,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to wallet history screen
                  },
                  child: buildsTextManrope(
                    title: "View",
                    size: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.pink,
                  ),
                ),
              ],
            ),
          ),
          Divider(color: Colors.grey.shade300, thickness: 1),
          // IZA Wallet Benefits Section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            child: buildsTextManrope(
              title: "IZA Wallet Benefits",
              size: 16.sp,
              fontWeight: FontWeight.w600,
              align: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Quick Refunds Benefit
                walletBenefitItem(
                  icon: "wallet1",
                  label: "Quick Refunds",
                ),
                // One-Tap Payment Benefit
                walletBenefitItem(
                  icon: "wallet2",
                  label: "One-Tap Payment",
                ),
                // Special Discount Benefit
                walletBenefitItem(
                  icon: "wallet3",
                  label: "Special Discount",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget walletBenefitItem({required String icon, required String label}) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.all(1.h),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Image.asset('assets/images/$icon.png',
                ),
                SizedBox(height: 1.h),
                buildsTextManrope(
                  title: label,
                  size: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ],
            )),
      ],
    );
  }
}
