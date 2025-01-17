import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iza_app/utilz/app_constants.dart';
import 'package:iza_app/utilz/colors.dart';
import 'package:iza_app/view/drawer/address_section/widget/address_location_dialogue.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showLocationPermissionDialog(context);
    });
  }

  RxBool isOtherClicked = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          "Add Address",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 20.sp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 20.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage("assets/images/map.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 2.h),

              // Flat/House/Building No. field
              _buildTextField("Flat/ House/ Building No.", "278/aw"),

              SizedBox(height: 2.h),

              // Road/Colony/Street Name field
              _buildTextField("Road/ Colony/ Street Name", "Abc colony"),

              SizedBox(height: 2.h),

              // Pincode field
              _buildTextField("Pincode", "9847575",
                  keyboardType: TextInputType.number),

              SizedBox(height: 3.h),

              // Save As
              Text(
                "Save as",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 1.h),
              Row(
                children: [
                  _buildCheckbox("Home"),
                  SizedBox(width: 4.w),
                  _buildCheckbox("Work"),
                  SizedBox(width: 4.w),
                  _buildCheckbox("Other"),
                ],
              ),
              SizedBox(height: 4.h),
              Column(
                children: [
                  Obx(() {
                    return isOtherClicked.value
                        ? _buildTextField("Address Name", "Address Name")
                        : SizedBox();
                  }),
                  _buildTextField("Name", "Harshit Gurmani"),
                  buildVspacer(2.h),
                  _buildTextField("Contact Number", "1234567890"),
                  buildVspacer(2.h),
                  _buildTextField("Email(Optional)", "email@gmail.com"),
                ],
              ),

              // Save Button
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Adaptive.h(2), horizontal: Adaptive.w(3)),
        child: SizedBox(
          width: double.infinity,
          height: 6.h,
          child: ElevatedButton(
            onPressed: () {
              // Handle Save action
              Get.back();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Text(
              "Save",
              style: TextStyle(fontSize: 16.sp, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  // Text Field Builder
  Widget _buildTextField(String label, String hint,
      {TextInputType? keyboardType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 15.sp, color: grey),
        ),
        SizedBox(height: 1.h),
        TextField(
          keyboardType: keyboardType ?? TextInputType.text,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.manrope(fontSize: 14.px),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ],
    );
  }

  // Checkbox Builder
  Widget _buildCheckbox(String title) {
    RxBool isChecked = false.obs;
    return Obx(() {
      return Row(
        children: [
          Checkbox(
            value: isChecked.value,
            onChanged: (value) {
              if (title == "Other") {
                isOtherClicked.value = !isOtherClicked.value;
              }
              isChecked.value = value ?? false;
            },
            activeColor: Colors.pink,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 14.sp, color: Colors.black),
          ),
        ],
      );
    });
  }
}
