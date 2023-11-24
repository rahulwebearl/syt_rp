import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopRatedHotels extends StatefulWidget {
  @override
  _TopRatedHotelsState createState() => _TopRatedHotelsState();
}

class _TopRatedHotelsState extends State<TopRatedHotels> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back,color: Colors.black,),
      ),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Top Rated Hotels In Alberta",
          style: TextStyle(
              fontSize: 18,
              fontFamily: "SegoeUI",
              fontWeight: FontWeight.bold,
              color: Color(0xff004351)),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 200.h,
                    width: 400.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3.r,
                            offset: Offset(0, 2)),
                      ],
                      color: Colors.red,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 200.h,
                          width: 230.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15.r),
                                  topLeft: Radius.circular(15.r)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                AssetImage("assets/Baga Beach.jpg"),
                              )),
                        ),
                        Container(
                          height: 200.h,
                          width: 170.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(15.r),
                                topRight: Radius.circular(15.r)),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xff00778F),
                                  Color(0xff000405),
                                ]),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.w,top: 10.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Rose Velley Resort Alberta",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffFFFFFF)),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    Icon(
                                      Icons.star_border,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.add_location,
                                      size: 12,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      "Alberta",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffFFFFFF)),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Price/Night",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffFFFFFF)),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "₹ 19,000/Person",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff94F5A4)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 200.h,
                    width: 400.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3.r,
                            offset: Offset(0, 2)),
                      ],
                      color: Colors.red,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 200.h,
                          width: 230.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15.r),
                                  topLeft: Radius.circular(15.r)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                AssetImage("assets/Baga Beach.jpg"),
                              )),
                        ),
                        Container(
                          height: 200.h,
                          width: 170.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(15.r),
                                topRight: Radius.circular(15.r)),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xff00778F),
                                  Color(0xff000405),
                                ]),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.w,top: 10.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Rose Velley Resort Alberta",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffFFFFFF)),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    Icon(
                                      Icons.star_border,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.add_location,
                                      size: 12,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      "Alberta",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffFFFFFF)),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Price/Night",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffFFFFFF)),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "₹ 19,000/Person",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff94F5A4)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 200.h,
                    width: 400.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3.r,
                            offset: Offset(0, 2)),
                      ],
                      color: Colors.red,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 200.h,
                          width: 230.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15.r),
                                  topLeft: Radius.circular(15.r)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                AssetImage("assets/Baga Beach.jpg"),
                              )),
                        ),
                        Container(
                          height: 200.h,
                          width: 170.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(15.r),
                                topRight: Radius.circular(15.r)),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xff00778F),
                                  Color(0xff000405),
                                ]),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.w,top: 10.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Rose Velley Resort Alberta",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffFFFFFF)),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    Icon(
                                      Icons.star_border,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.add_location,
                                      size: 12,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      "Alberta",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffFFFFFF)),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Price/Night",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffFFFFFF)),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "₹ 19,000/Person",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff94F5A4)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 200.h,
                    width: 400.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3.r,
                            offset: Offset(0, 2)),
                      ],
                      color: Colors.red,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 200.h,
                          width: 230.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15.r),
                                  topLeft: Radius.circular(15.r)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                AssetImage("assets/Baga Beach.jpg"),
                              )),
                        ),
                        Container(
                          height: 200.h,
                          width: 170.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(15.r),
                                topRight: Radius.circular(15.r)),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xff00778F),
                                  Color(0xff000405),
                                ]),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.w,top: 10.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Rose Velley Resort Alberta",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffFFFFFF)),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    Icon(
                                      Icons.star_border,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.add_location,
                                      size: 12,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      "Alberta",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffFFFFFF)),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Price/Night",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffFFFFFF)),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "₹ 19,000/Person",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff94F5A4)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 200.h,
                    width: 400.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3.r,
                            offset: Offset(0, 2)),
                      ],
                      color: Colors.red,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 200.h,
                          width: 230.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15.r),
                                  topLeft: Radius.circular(15.r)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                AssetImage("assets/Baga Beach.jpg"),
                              )),
                        ),
                        Container(
                          height: 200.h,
                          width: 170.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(15.r),
                                topRight: Radius.circular(15.r)),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xff00778F),
                                  Color(0xff000405),
                                ]),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.w,top: 10.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Rose Velley Resort Alberta",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffFFFFFF)),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    Icon(
                                      Icons.star_border,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.add_location,
                                      size: 12,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      "Alberta",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffFFFFFF)),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Price/Night",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffFFFFFF)),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "₹ 19,000/Person",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff94F5A4)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 200.h,
                    width: 400.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3.r,
                            offset: Offset(0, 2)),
                      ],
                      color: Colors.red,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 200.h,
                          width: 230.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15.r),
                                  topLeft: Radius.circular(15.r)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                AssetImage("assets/Baga Beach.jpg"),
                              )),
                        ),
                        Container(
                          height: 200.h,
                          width: 170.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(15.r),
                                topRight: Radius.circular(15.r)),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xff00778F),
                                  Color(0xff000405),
                                ]),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.w,top: 10.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Rose Velley Resort Alberta",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffFFFFFF)),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    Icon(
                                      Icons.star_border,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.add_location,
                                      size: 12,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      "Alberta",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffFFFFFF)),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Price/Night",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffFFFFFF)),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "₹ 19,000/Person",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff94F5A4)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 200.h,
                    width: 400.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3.r,
                            offset: Offset(0, 2)),
                      ],
                      color: Colors.red,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 200.h,
                          width: 230.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15.r),
                                  topLeft: Radius.circular(15.r)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                AssetImage("assets/Baga Beach.jpg"),
                              )),
                        ),
                        Container(
                          height: 200.h,
                          width: 170.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(15.r),
                                topRight: Radius.circular(15.r)),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xff00778F),
                                  Color(0xff000405),
                                ]),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.w,top: 10.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Rose Velley Resort Alberta",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffFFFFFF)),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    Icon(
                                      Icons.star_border,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.add_location,
                                      size: 12,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      "Alberta",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffFFFFFF)),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Price/Night",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffFFFFFF)),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "₹ 19,000/Person",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff94F5A4)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
