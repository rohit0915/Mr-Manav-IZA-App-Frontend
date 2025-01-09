

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back button
          },
        ),
        title: Text(
          "Face",
          style: TextStyle(color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Handle search
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite_outline, color: Colors.black),
            onPressed: () {
              // Handle favorites
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {
              // Handle cart
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Banner
          Container(
            width: double.infinity,
            color: Colors.pink[50],
            padding: EdgeInsets.all(2.h),
            child: Text(
              "Enjoy Rs.1000 off. Use code : 12345",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 14.sp),
            ),
          ),
          // Product Grid Section
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 2.h),
                    // Product Count
                    Text(
                      "Showing all products (1234 Items)",
                      style: TextStyle(fontSize: 14.sp, color: Colors.black),
                    ),
                    SizedBox(height: 2.h),
                    // Product Grid
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 6, // Change this count as needed
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 2.w,
                        mainAxisSpacing: 2.h,
                      ),
                      itemBuilder: (context, index) {
                        return ProductCard();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Sort and Filter Section
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Sort Button
                TextButton.icon(
                  onPressed: () {
                    // Handle sort
                  },
                  icon: Icon(Icons.sort, color: Colors.black, size: 18.sp),
                  label: Text(
                    "Sort",
                    style: TextStyle(fontSize: 14.sp, color: Colors.black),
                  ),
                ),
                // Filter Button
                TextButton.icon(
                  onPressed: () {
                    // Handle filter
                  },
                  icon: Icon(Icons.filter_alt_outlined, color: Colors.black, size: 18.sp),
                  label: Text(
                    "Filter",
                    style: TextStyle(fontSize: 14.sp, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(2.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image with Favorite Icon
            Stack(
              children: [
                Container(
                  height: 15.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/product_image.png'), // Replace with actual image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 1.w,
                  right: 1.w,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 10.sp,
                    child: Icon(Icons.favorite_border, size: 14.sp, color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.h),
            // Product Name
            Text(
              "Streax Hair Serum Enriched With Vit...",
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 1.h),
            // Product Price and Discount
            Row(
              children: [
                Text(
                  "₹159",
                  style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600, color: Colors.green),
                ),
                SizedBox(width: 1.w),
                Text(
                  "₹299",
                  style: TextStyle(
                    fontSize: 10.sp,
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 1.w),
                Text(
                  "40% off",
                  style: TextStyle(fontSize: 10.sp, color: Colors.green),
                ),
              ],
            ),
            SizedBox(height: 1.h),
            // Product Options Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Size/Shade Options
                Wrap(
                  spacing: 1.w,
                  children: List.generate(2, (index) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.5.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Text(
                        index == 0 ? "30 ml" : "10 ml", // Replace with actual options
                        style: TextStyle(fontSize: 10.sp),
                      ),
                    );
                  }),
                ),
                // Select Button
                ElevatedButton(
                  onPressed: () {
                    // Handle select action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(
                    "Select Size",
                    style: TextStyle(fontSize: 10.sp, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
