import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/custom_appbar.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Payment"),
      body: Padding(
        padding: normalPadding,
        child: Column(
          children: [
            Divider(
              color: grey.withOpacity(0.4),
            ),
            SizedBox(
              height: Adaptive.h(10),
              child: ListTile(
                leading: Image.asset('assets/images/paymentscreen1.png'),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildsTextManrope(
                      title: "Phonepe",
                      size: 14.px,
                      fontWeight: FontWeight.w400,
                    ),
                    buildsTextManrope(
                        title: "6467748575@paytm",
                        size: 14.px,
                        fontWeight: FontWeight.w400,
                        color: grey.withOpacity(0.5)),
                  ],
                ),
                trailing: Icon(Icons.delete_outline),
              ),
            ),
            SizedBox(
              height: Adaptive.h(10),
              child: ListTile(
                leading: Image.asset('assets/images/paymentscreen1.png'),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildsTextManrope(
                      title: "Phonepe",
                      size: 14.px,
                      fontWeight: FontWeight.w400,
                    ),
                    buildsTextManrope(
                        title: "6467748575@paytm",
                        size: 14.px,
                        fontWeight: FontWeight.w400,
                        color: grey.withOpacity(0.5)),
                  ],
                ),
                trailing: Icon(Icons.delete_outline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
