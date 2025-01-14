import 'package:flutter/material.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:order_tracker_zen/order_tracker_zen.dart';

class TrackOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Track Order"),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 2.h),
                Text(
                  "Expected delivery by",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 0.5.h),
                Text(
                  "Sunday, 8th Dec",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
                  decoration: BoxDecoration(
                    color: Colors.pink[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dispatched",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.pink,
                        ),
                      ),
                      SizedBox(height: 0.5.h),
                      Text(
                        "Last Update : Today, 10:18",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                Expanded(
                  child: OrderTrackerZen(
                    success_color: primarys,
                    background_color: primarys,
                    tracker_data: [
                      /*  TrackerData(
                        title: "Order Confirmed, Jan 5, 2024",
                        subtitle:
                            "Your order has been placed.\nSeller has processed your order.\nYour item has been picked by courier partner.",
                        date: "Mon, 5th Dec 24 - 7:30pm",
                      ),
                      StatusData(
                        title: "Shipped, Jan 6, 2024",
                        subtitle:
                            "Logistic - FMPG2145796325558\nYour item has been shipped.\nYour item has been received in the hub nearest to you.",
                        date: "Mon, 5th Dec 24 - 7:30pm",
                      ),
                      StatusData(
                        title: "Out For Delivery, Jan 7, 2024",
                        subtitle: "Your item is out for delivery.",
                        date: "Mon, 5th Dec 24 - 7:30pm",
                      ),
                      StatusData(
                        title: "Delivered, Jan 7, 2024",
                        subtitle: "Your item has been delivered.",
                        date: "Mon, 5th Dec 24 - 7:30pm",
                      ), */
                      TrackerData(
                        title: "Order Confirmed,",
                        date: " Jan 5, 2024",
                        // Provide an array of TrackerDetails objects to display more details about this step.
                        tracker_details: [
                          // TrackerDetails contains detailed information about a specific event in the order tracking process.
                          TrackerDetails(
                            title: "Your order has been placed.",
                            datetime: "Sat, 8 Apr '22 - 17:17",
                          ),
                          TrackerDetails(
                            title: "Seller has processed your order.",
                            datetime: "Sat, 8 Apr '22 - 17:17",
                          ),
                          TrackerDetails(
                            title:
                                "Your item has been picked by courier partner.",
                            datetime: "Sat, 8 Apr '22 - 17:17",
                            
                          ),
                        ],
                      ),
                      TrackerData(
                        title: "Order Confirmed,",
                        date: " Jan 5, 2024",
                        // Provide an array of TrackerDetails objects to display more details about this step.
                        tracker_details: [
                          // TrackerDetails contains detailed information about a specific event in the order tracking process.
                          TrackerDetails(
                            title:
                                "Your order has been placed.\nSeller has processed your order.\nYour item has been picked by courier partner.",
                            datetime: "Sat, 8 Apr '22 - 17:17",
                          ),
                        ],
                      ),
                      TrackerData(
                        title: "Order Confirmed,",
                        date: " Jan 5, 2024",
                        // Provide an array of TrackerDetails objects to display more details about this step.
                        tracker_details: [
                          // TrackerDetails contains detailed information about a specific event in the order tracking process.
                          TrackerDetails(
                            title:
                                "Your order has been placed.\nSeller has processed your order.\nYour item has been picked by courier partner.",
                            datetime: "Sat, 8 Apr '22 - 17:17",
                          ),
                        ],
                      ),
                      TrackerData(
                        title: "Order Confirmed,",
                        date: " Jan 5, 2024",
                        // Provide an array of TrackerDetails objects to display more details about this step.
                        tracker_details: [
                          // TrackerDetails contains detailed information about a specific event in the order tracking process.
                          TrackerDetails(
                            title:
                                "Your order has been placed.\nSeller has processed your order.\nYour item has been picked by courier partner.",
                            datetime: "Sat, 8 Apr '22 - 17:17",
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
      },
    );
  }
}
