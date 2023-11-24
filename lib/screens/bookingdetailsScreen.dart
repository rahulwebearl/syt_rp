import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingDetails extends StatefulWidget {
  @override
  _BookingDetailsState createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: EdgeInsets.all(0),
            backgroundColor: Colors.transparent,
            child: Container(
              height: 580.h,
              width: double.infinity,
              color: Colors.transparent,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  Container(
                      margin: EdgeInsets.only(
                        right: 20.w,
                      ),
                      height: 573.h,
                      width: 360.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                        //border: Border.all(color: Color(0xff707070))
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                right: 10.w, top: 10.h, left: 10.w),
                            height: 160.h,
                            width: 356.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        "assets/Canada Arrival and Free day1.png")),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.r),
                                    topRight: Radius.circular(10.r))),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Canada: Arrival and Free day",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 45.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 25.w, left: 25.w),
                            child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has beenthe industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "SegoeUI",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Text(
                            "Other Benifits",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 54.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Container(
                                      height: 60.h,
                                      width: 60.w,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.orangeAccent),
                                      child: Center(
                                          child: Icon(
                                        Icons.wifi,
                                        color: Colors.white,
                                      ))),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Text(
                                    "Free Wi-Fi",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 60.h,
                                    width: 60.w,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.orangeAccent),
                                    child: Center(
                                      child: Icon(
                                        Icons.local_parking,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Text(
                                    "Free Parking",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 60.h,
                                    width: 60.w,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.orangeAccent),
                                    child: Center(
                                      child: Icon(Icons.shopping_cart,
                                          color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Text(
                                    "Free Laundry",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 33.2.h,
                                  ),
                                  Container(
                                    height: 28.h,
                                    width: 61.w,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.only(
                                            bottomRight:
                                                Radius.circular(10.r))),
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 4.h),
                                        child: Text(
                                          "Day 1",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: "SegoeUI",
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      )),
                  Container(
                      margin: EdgeInsets.only(
                        right: 20.w,
                      ),
                      height: 573.h,
                      width: 360.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                        //border: Border.all(color: Color(0xff707070))
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                right: 10.w, top: 10.h, left: 10.w),
                            height: 160.h,
                            width: 356.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage("assets/CN Tower.png")),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.r),
                                    topRight: Radius.circular(10.r))),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Canada: Arrival and Free day",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 45.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 25.w, left: 25.w),
                            child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has beenthe industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "SegoeUI",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Text(
                            "Other Benifits",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 54.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Container(
                                      height: 60.h,
                                      width: 60.w,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.orangeAccent),
                                      child: Center(
                                          child: Icon(
                                        Icons.wifi,
                                        color: Colors.white,
                                      ))),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Text(
                                    "Free Wi-Fi",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 60.h,
                                    width: 60.w,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.orangeAccent),
                                    child: Center(
                                      child: Icon(
                                        Icons.local_parking,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Text(
                                    "Free Parking",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 60.h,
                                    width: 60.w,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.orangeAccent),
                                    child: Center(
                                      child: Icon(Icons.shopping_cart,
                                          color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Text(
                                    "Free Laundry",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 33.2.h,
                                  ),
                                  Container(
                                    height: 28.h,
                                    width: 61.w,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.only(
                                            bottomRight:
                                                Radius.circular(10.r))),
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 4.h),
                                        child: Text(
                                          "Day 2",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: "SegoeUI",
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      )),
                  Container(
                      margin: EdgeInsets.only(
                        right: 20.w,
                      ),
                      height: 573.h,
                      width: 360.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                        //border: Border.all(color: Color(0xff707070))
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                right: 10.w, top: 10.h, left: 10.w),
                            height: 160.h,
                            width: 356.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "assets/Niagra Falls (Canada).png")),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.r),
                                    topRight: Radius.circular(10.r))),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Canada: Arrival and Free day",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 45.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 25.w, left: 25.w),
                            child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has beenthe industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "SegoeUI",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Text(
                            "Other Benifits",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 54.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Container(
                                      height: 60.h,
                                      width: 60.w,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.orangeAccent),
                                      child: Center(
                                          child: Icon(
                                        Icons.wifi,
                                        color: Colors.white,
                                      ))),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Text(
                                    "Free Wi-Fi",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 60.h,
                                    width: 60.w,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.orangeAccent),
                                    child: Center(
                                      child: Icon(
                                        Icons.local_parking,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Text(
                                    "Free Parking",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 60.h,
                                    width: 60.w,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.orangeAccent),
                                    child: Center(
                                      child: Icon(Icons.shopping_cart,
                                          color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Text(
                                    "Free Laundry",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 33.2.h,
                                  ),
                                  Container(
                                    height: 28.h,
                                    width: 61.w,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.only(
                                            bottomRight:
                                                Radius.circular(10.r))),
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 4.h),
                                        child: Text(
                                          "Day 3",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: "SegoeUI",
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      )),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff004351),
          ),
        ),
        title: Text(
          "Booking Details",
          style: TextStyle(
              fontSize: 14,
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
                Container(
                  height: 135.h,
                  child: Stack(
                    children: [
                      Container(
                        width: 373.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xff037491),
                                  Color(0xff000000)
                                ])),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 8.h),
                              child: Text(
                                "Ahmedabad To Goa",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "SegoeUI",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          top: 35.h,
                          left: 3.w,
                          child: Container(
                            width: 367.w,
                            height: 84.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(color: Color(0xff01576D))),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 8.w, top: 8.h, right: 8.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Trip/package ID: 2548756523",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: "SegoeUI",
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Text(
                                        "Booking Date: 27/02/2021",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: "SegoeUI",
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Text(
                                        "Total Person: 2",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: "SegoeUI",
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Text(
                                        "Agency Contact No: 96244**4*0",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: "SegoeUI",
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Text(
                                        "Contact Person: Tour Bharat",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: "SegoeUI",
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )),
                      Positioned(
                        top: 107.h,
                        right: 6.w,
                        child: Container(
                          width: 117.w,
                          height: 28.h,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xff037491),
                                    Color(0xff013846)
                                  ]),
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: Color(0xff01576D))),
                          child: Center(
                            child: Text(
                              "Awaiting",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "SegoeUI",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30.w,
                    ),
                    Text(
                      "Agency Address: Tour Bharat, 302, Gujarat",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "SegoeUI",
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30.w,
                    ),
                    Text(
                      "Agency Address: Tour Bharat, 302, Gujarat",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "SegoeUI",
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30.w,
                    ),
                    Text(
                      "Price/Person: ₹ 4000",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "SegoeUI",
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(top: 30.h),
                    width: 392.w,
                    height: 267.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xff013C43),
                              Color(0xff18676D),
                            ])),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          "Package Details",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "SegoeUI",
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Overview",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "Lorem Ipsum",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 40.h),
                                Text(
                                  "Breakfast",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "Include",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 40.h),
                                Text(
                                  "SightSeeing",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "Include",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 30.h),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hotel Type",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "3 star",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 40.h),
                                Text(
                                  "Lunch",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "Include",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 40.h),
                                Text(
                                  "Flight",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "Include",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 30.h),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total Days",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "5D/6N",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 40.h),
                                Text(
                                  "Dinner",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "Include",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 40.h),
                                Text(
                                  "Cab",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "Include",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 30.h),
                              ],
                            ),
                          ],
                        )
                      ],
                    )),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30.w,
                    ),
                    Text(
                      "Inclusions:",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "SegoeUI",
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30.w,
                    ),
                    Container(
                      width: 331.w,
                      child: Text(
                        "Lorem ipsum adajdhfb fhoir feifja ytfeiuoae uag jyaegek kaunee oaehi ieqhii iueqi hdsu",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "SegoeUI",
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30.w,
                    ),
                    Text(
                      "Exclusions:",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "SegoeUI",
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 30.w,
                ),
                Container(
                  width: 331.w,
                  child: Text(
                    "Lorem ipsum adajdhfb fhoir feifja ytfeiuoae uag jyaegek kaunee oaehi ieqhii iueqi hdsu",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "SegoeUI",
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
            Container(
              margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
              height: 245.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 7.h, right: 20.w, bottom: 7.h),
                    height: 238.h,
                    width: 352.w,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3,
                            offset: Offset(0, 2))
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      //border: Border.all(color: Color(0xff707070))
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 53.w,
                              height: 27.h,
                              decoration: BoxDecoration(
                                color: Color(0xff005158),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(9.r)),
                              ),
                              child: Center(
                                child: Text(
                                  "Day 1",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "SegoeUI",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 21.w,
                            ),
                            Container(
                              width: 205.w,
                              height: 27.h,
                              decoration: BoxDecoration(
                                  color: Color(0xff262626),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15.r),
                                      bottomRight: Radius.circular(15.r))),
                              child: Center(
                                child: Text(
                                  "Canada: Arrival and Free day",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "SegoeUI",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 17.h,
                        ),
                        Container(
                          height: 75.h,
                          width: 305.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.r),
                                bottomRight: Radius.circular(15.r)),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "assets/Canada Arrival and Free day.png",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        // Row(
                        //   children: [
                        //     SizedBox(width: 23.w),
                        //     Text(
                        //       "* Water Activities",
                        //       style: TextStyle(
                        //         fontSize: 12,
                        //         fontFamily: "SegoeUI",
                        //         fontWeight: FontWeight.bold,
                        //         color: Colors.black,
                        //       ),
                        //     ),
                        //     SizedBox(width: 86.w),
                        //     Text(
                        //       "* Water Activities",
                        //       style: TextStyle(
                        //         fontSize: 12,
                        //         fontFamily: "SegoeUI",
                        //         fontWeight: FontWeight.bold,
                        //         color: Colors.black,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(
                          height: 15.h,
                        ),
                        // Row(
                        //   children: [
                        //     SizedBox(width: 23.w),
                        //     Text(
                        //       "* Spa and relaxation treatment",
                        //       style: TextStyle(
                        //         fontSize: 12,
                        //         fontFamily: "SegoeUI",
                        //         fontWeight: FontWeight.bold,
                        //         color: Colors.black,
                        //       ),
                        //     ),
                        //     SizedBox(width: 14.w),
                        //     Text(
                        //       "* Spa and relaxation...",
                        //       style: TextStyle(
                        //         fontSize: 12,
                        //         fontFamily: "SegoeUI",
                        //         fontWeight: FontWeight.bold,
                        //         color: Colors.black,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: 15.h,
                        // ),
                        Row(
                          children: [
                            SizedBox(width: 23.w),
                            Text(
                              "* Private Beach area",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 150.w),
                            InkWell(
                              onTap: () {
                                _showDialog();
                              },
                              child: Text(
                                "More Details",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "SegoeUI",
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffFF0000),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 7.h, right: 20.w, bottom: 7.h),
                    height: 238.h,
                    width: 352.w,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3,
                            offset: Offset(0, 2))
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      //border: Border.all(color: Color(0xff707070))
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 53.w,
                              height: 27.h,
                              decoration: BoxDecoration(
                                color: Color(0xff005158),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(9.r)),
                              ),
                              child: Center(
                                child: Text(
                                  "Day 2",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "SegoeUI",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 21.w,
                            ),
                            Container(
                              width: 205.w,
                              height: 27.h,
                              decoration: BoxDecoration(
                                  color: Color(0xff262626),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15.r),
                                      bottomRight: Radius.circular(15.r))),
                              child: Center(
                                child: Text(
                                  "Canada: CN Tower",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "SegoeUI",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 17.h,
                        ),
                        Container(
                          height: 75.h,
                          width: 305.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.r),
                                bottomRight: Radius.circular(15.r)),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "assets/CN Tower.png",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Row(
                          children: [
                            SizedBox(width: 23.w),
                            Text(
                              "* Water Activities",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 86.w),
                            Text(
                              "* Water Activities",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            SizedBox(width: 23.w),
                            Text(
                              "* Spa and relaxation treatment",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 14.w),
                            Text(
                              "* Spa and relaxation...",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            SizedBox(width: 23.w),
                            Text(
                              "* Private Beach area",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 150.w),
                            Text(
                              "More Details",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Color(0xffFF0000),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 7.h, right: 20.w, bottom: 7.h),
                    height: 238.h,
                    width: 352.w,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3,
                            offset: Offset(0, 2))
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      //border: Border.all(color: Color(0xff707070))
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 53.w,
                              height: 27.h,
                              decoration: BoxDecoration(
                                color: Color(0xff005158),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(9.r)),
                              ),
                              child: Center(
                                child: Text(
                                  "Day 3",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "SegoeUI",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 21.w,
                            ),
                            Container(
                              width: 205.w,
                              height: 27.h,
                              decoration: BoxDecoration(
                                  color: Color(0xff262626),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15.r),
                                      bottomRight: Radius.circular(15.r))),
                              child: Center(
                                child: Text(
                                  "Canada:Niagra Falls",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "SegoeUI",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 17.h,
                        ),
                        Container(
                          height: 75.h,
                          width: 305.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.r),
                                bottomRight: Radius.circular(15.r)),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "assets/Niagra Falls (Canada).png",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Row(
                          children: [
                            SizedBox(width: 23.w),
                            Text(
                              "* Water Activities",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 86.w),
                            Text(
                              "* Water Activities",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            SizedBox(width: 23.w),
                            Text(
                              "* Spa and relaxation treatment",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 14.w),
                            Text(
                              "* Spa and relaxation...",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            SizedBox(width: 23.w),
                            Text(
                              "* Private Beach area",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 150.w),
                            Text(
                              "More Details",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Color(0xffFF0000),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
