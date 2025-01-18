import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FilterByScreen extends StatefulWidget {
  const FilterByScreen({Key? key}) : super(key: key);

  @override
  _FilterByScreenState createState() => _FilterByScreenState();
}

class _FilterByScreenState extends State<FilterByScreen> {
  String? selectedCategory;
  Map<String, bool> selectedFilters = {
    "Rs. 0 - Rs. 499": false,
    "Rs. 500 - Rs. 999": false,
    "Rs. 1000 - Rs. 1499": false,
  };

  Widget buildsTextManrope({
    required String title,
    double? size,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return Text(
      title,
      style: GoogleFonts.manrope(
        fontSize: size ?? 14.sp,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color ?? Colors.black,
      ),
    );
  }

  Widget categoryTile(String title, {bool isSelected = false}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = title;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
        color:
            selectedCategory == title ? Colors.white : Colors.transparent,
        child: Row(
          children: [
            buildsTextManrope(
              title: title,
              size: 14.sp,
              color: selectedCategory == title ? Colors.black : Colors.grey,
              fontWeight:
                  selectedCategory == title ? FontWeight.bold : FontWeight.normal,
            ),
          ],
        ),
      ),
    );
  }

  Widget filterOption(String title) {
    return CheckboxListTile(
      contentPadding: EdgeInsets.all(0),
      value: selectedFilters[title],
      onChanged: (value) {
        setState(() {
          selectedFilters[title] = value ?? false;
        });
      },
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildsTextManrope(title: title, size: 14.sp),
          buildsTextManrope(title: "120", size: 12.sp, color: Colors.grey),
        ],
      ),
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Colors.pink,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildsTextManrope(
          title: 'Filter by',
          size: 18.sp,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                selectedCategory = null;
                selectedFilters.updateAll((key, value) => false);
              });
            },
            child: buildsTextManrope(
              title: 'Reset',
              size: 14.px,
              color: Colors.pink,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: horizontalPadding,
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  // Categories List
                  Container(
                    width: Adaptive.w(40),
                    color: Colors.grey[100],
                    child: ListView(
                      children: [
                        categoryTile('Price'),
                        categoryTile('Category'),
                        categoryTile('Discount'),
                        categoryTile('Color'),
                        categoryTile('Skin Type'),
                        categoryTile('Brand'),
                        categoryTile('Preference'),
                        categoryTile('Concern'),
                        categoryTile('Formulation'),
                        categoryTile('Skin Tone'),
                        categoryTile('Gender'),
                        categoryTile('Benefits'),
                      ],
                    ),
                  ),
                  // Filter Options
                  Expanded(
                    child: selectedCategory == 'Price'
                        ? ListView(
                            // padding: EdgeInsets.symmetric(horizontal: 4.w),
                            children: selectedFilters.keys
                                .map((filter) => filterOption(filter))
                                .toList(),
                          )
                        : Center(
                            child: buildsTextManrope(
                              title: 'Select a category to view options',
                              size: 14.sp,
                              color: Colors.grey,
                            ),
                          ),
                  ),
                ],
              ),
            ),
            // Apply Button
            Container(
              padding: EdgeInsets.all(2.h),
              color: Colors.white,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: Size(double.infinity, 6.h),
                ),
                child: buildsTextManrope(
                  title: 'Apply',
                  size: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
