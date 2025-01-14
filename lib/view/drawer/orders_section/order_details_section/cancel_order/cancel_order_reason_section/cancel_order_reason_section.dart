import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:iza_app/view/drawer/orders_section/order_details_section/cancel_order/cancel_order_reason_section/canceled_item_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class CancelReasonScreen extends StatefulWidget {
  CancelReasonScreen({required this.isCancel});

  final bool isCancel;
  @override
  _CancelReasonScreenState createState() => _CancelReasonScreenState();
}

class _CancelReasonScreenState extends State<CancelReasonScreen> {
  // Dropdown items and selected value
  final List<String> _reasons = [
    "Item not needed",
    "Ordered by mistake",
    "Found a better price",
    "Other"
  ];
  String? _selectedReason;

  // Text editing controller for comments
  final TextEditingController _commentsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildsTextManrope(
          title: "Reason",
          size: 18.px,
          fontWeight: FontWeight.w600,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdown for "Reason for cancellation"
            buildsTextManrope(
              title: "Reason for cancellation",
              size: 14.px,
              fontWeight: FontWeight.w500,
              align: true,
            ),
            SizedBox(height: 1.h),
            Container(
              width: Adaptive.w(95),
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedReason,
                  hint: buildsTextManrope(
                    title: "Select a reason",
                    size: 14.px,
                    color: Colors.grey,
                  ),
                  items: _reasons.map((reason) {
                    return DropdownMenuItem<String>(
                      value: reason,
                      child: buildsTextManrope(
                        title: reason,
                        size: 14.px,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedReason = value!;
                    });
                  },
                ),
              ),
            ),

            SizedBox(height: 3.h),

            // TextField for "Comments"
            buildsTextManrope(
              title: "Comments",
              size: 14.px,
              fontWeight: FontWeight.w500,
              align: true,
            ),
            SizedBox(height: 1.h),
            TextField(
              controller: _commentsController,
              maxLength: 200,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "Enter comments here...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            Spacer(),

            // "Cancel Item" Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle button click
                  if (_selectedReason == null ||
                      _commentsController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Please fill all fields."),
                    ));
                  } else {
                    Get.to(() => CanceledItemScreen(
                          isCancelled: widget.isCancel,
                        ));
                    // Submit action
                    print("Reason: $_selectedReason");
                    print("Comments: ${_commentsController.text}");
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _selectedReason == null ? Colors.grey : black,
                  padding: EdgeInsets.symmetric(vertical: 1.5.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: buildsTextManrope(
                  title: "Cancel Item",
                  size: 16.px,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
