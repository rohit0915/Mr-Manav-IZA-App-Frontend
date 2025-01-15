import 'package:flutter/material.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/utilz/text_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void selectQuantityBottom(BuildContext context) {
  List<String> sortList = [
    "1",
    "2",
    "3",
    "4",
  ];
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(16),
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildsTextManrope(
                title: "Select Quantity",
                size: 19.px,
                fontWeight: FontWeight.w600,
                align: true),
            ...List.generate(
              sortList.length,
              (index) {
                return ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: CircleAvatar(
                    radius: Adaptive.w(3),
                    backgroundColor: black,
                    child: Center(
                      child: CircleAvatar(
                        radius: 2.5.w,
                        backgroundColor: white,
                        child: Center(
                          child: CircleAvatar(
                            radius: Adaptive.w(1.6),
                            backgroundColor: index == 0 ? primarys : white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  title: buildsTextManrope(
                      title: sortList[index],
                      size: 15.px,
                      align: true,
                      fontWeight: FontWeight.w500),
                  onTap: () {
                    // Handle Sort by Popularity
                    Navigator.pop(context); // Close the bottom sheet
                  },
                );
              },
            )
          ],
        ),
      );
    },
  );
}
