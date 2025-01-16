import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/button_widget.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/custom_appbar.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/cart_payment_address_section/complete_message_section/complete_message_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CartPaymentScreen extends StatelessWidget {
  const CartPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F4F4),
      appBar: CustomAppBar(title: "Address & Payment"),
      body: Padding(
        padding: normalPadding,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8.sp),
              margin: EdgeInsets.all(8.sp),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.sp), color: white),
              child: Column(
                children: [
                  buildsTextManrope(
                      title: "Payment Method",
                      size: 17.px,
                      fontWeight: FontWeight.w600,
                      align: true),
                  buildVspacer(1.h),
                  buildsTextManrope(
                      title: "Reccomended Payment Options",
                      size: 13.px,
                      color: textGreyColor,
                      fontWeight: FontWeight.w600,
                      align: true),
                  buildVspacer(2.h),
                  Row(
                    children: [
                      Image.asset('assets/images/payment1.png'),
                      buildHspacer(4.w),
                      buildsTextManrope(
                          title: "Phonepay",
                          size: 15.px,
                          fontWeight: FontWeight.w600),
                      Spacer(),
                      CircleAvatar(
                        radius: Adaptive.w(2.5),
                        backgroundColor: grey,
                        child: CircleAvatar(
                          radius: Adaptive.w(2),
                          backgroundColor: white,
                        ),
                      )
                    ],
                  ),
                  buildVspacer(3.h),
                  buildsTextManrope(
                      title: "Other Payment Options",
                      size: 13.px,
                      color: textGreyColor,
                      fontWeight: FontWeight.w600,
                      align: true),
                  buildVspacer(3.h),
                  addresspaymentMethodWidget(
                      image: "payment2", title: "UPI (Pay via any app)"),
                  buildVspacer(2.h),
                  addresspaymentMethodWidget(
                      image: "payment3", title: "wallet"),
                  buildVspacer(2.h),
                  addresspaymentMethodWidget(
                      image: "payment4", title: "Net Banking"),
                  buildVspacer(2.h),
                  addresspaymentMethodWidget(
                      image: "payment5", title: "Credit Card"),
                  buildVspacer(2.h),
                  addresspaymentMethodWidget(
                      image: "payment6", title: "Cash on Delivery"),
                  buildVspacer(2.h),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: Adaptive.w(100),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(
                thickness: 2,
                color: Colors.grey.withOpacity(0.2),
              ),
              buildVspacer(2.h),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildsTextManrope(
                          title: "₹ 159",
                          size: 19.px,
                          fontWeight: FontWeight.w600),
                      buildVspacer(1.h),
                      buildsTextManrope(
                          title: "Grand Total",
                          size: 18.px,
                          fontWeight: FontWeight.w600),
                    ],
                  ),
                  buildHspacer(5.w),
                  Expanded(
                    child: CustomButton(
                      onpress: () {
                        Get.to(() => CompleteMessageScreen());
                      },
                      title: "Proceed to pay",
                    ),
                  )
                ],
              ),
              buildVspacer(1.h),
            ],
          ),
        ),
      ),
    );
  }

  Row addresspaymentMethodWidget({
    required String image,
    required String title,
  }) {
    return Row(
      children: [
        Image.asset('assets/images/$image.png'),
        buildHspacer(4.w),
        buildsTextManrope(
            title: title, size: 15.px, fontWeight: FontWeight.w600),
        Spacer(),
        Icon(Icons.keyboard_arrow_down)
      ],
    );
  }
}
