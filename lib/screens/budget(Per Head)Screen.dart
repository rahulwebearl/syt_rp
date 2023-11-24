import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BudgetPerHead extends StatefulWidget {
  @override
  _BudgetPerHeadState createState() => _BudgetPerHeadState();
}

class _BudgetPerHeadState extends State<BudgetPerHead> {
  String radiogroup1 = "1";
  String radiogroup2 = "2";
  String radiogroup3 = "3";
  String radiogroup4 = "4";
  RangeValues values = RangeValues(1000, 200000);
  RangeValues values2 = RangeValues(1, 12);
  double start = 1000;
  double end=3000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
          icon: Icon(Icons.arrow_back,color:Color(0xff004351) ,),
        ),
        title: Text(
          ""
              "Sort By",
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
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10.w, left: 10.w),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Radio(
                                  activeColor: Color(0xff00555C),
                                  value: "1",
                                  groupValue: radiogroup4,
                                  onChanged: (value) {
                                    setState(() {
                                      radiogroup4 = value.toString();
                                      print(radiogroup4);
                                    });
                                  },
                                ),
                                Text(
                                  "Price Low to High",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "₹₹",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Icon(
                                  Icons.arrow_right_alt,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                Text(
                                  "₹₹₹",
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
                          width: 20.w,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Radio(
                                  activeColor: Color(0xff00555C),
                                  value: "2",
                                  groupValue: radiogroup4,
                                  onChanged: (value) {
                                    setState(() {
                                      radiogroup4 = value.toString();
                                      print(radiogroup4);
                                    });
                                  },
                                ),
                                Text(
                                  "Price High to Low",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "₹₹₹",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Icon(
                                  Icons.arrow_right_alt,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                Text(
                                  "₹₹",
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
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      activeColor: Color(0xff00555C),
                      value: "3",
                      groupValue: radiogroup4,
                      onChanged: (value) {
                        setState(() {
                          radiogroup4 = value.toString();
                          print(radiogroup4);
                        });
                      },
                    ),
                    Text(
                      "Number of Trips",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "SegoeUI",
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "Budget (Per Head)",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "SegoeUI",
                      fontWeight: FontWeight.bold,
                      color: Color(0xff004351)),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "1,000",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "SegoeUI",
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Container(
                      width: 280.w,
                      child:
                      // RangeSlider(
                      //   values: RangeValues(start, end),
                      //   labels: RangeLabels(start.toString(), end.toString()),
                      //   onChanged: (value) {
                      //     setState(() {
                      //       start = value.start ;
                      //       end = value.end  ;
                      //     });
                      //   },
                      //   min: 1000,
                      //   max: 80.0,
                      // ),

                      RangeSlider(
                        divisions: 100,
                        values: values,
                        onChanged: (value) {
                          setState(() {
                            this.values = value;
                          });
                        },
                        activeColor: Color(0xff00555C),
                        inactiveColor: Colors.grey,
                        max: 200000,
                        min: 1000,
                      ),
                    ),
                    Text(
                      "2,00,000",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "SegoeUI",
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: Color(0xffF5F5F5),
                        borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(color: Color(0xff005057)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 3,
                              offset: Offset(1, 2))
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "${values.start.toInt()}",
                          // start.toString(),
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "SegoeUI",
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Text(
                      "to",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "SegoeUI",
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    SizedBox(width: 20.w),
                    Container(
                      width: 120.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: Color(0xffF5F5F5),
                        borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(color: Color(0xff005057)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 3,
                              offset: Offset(1, 2))
                        ],
                      ),
                      child: Center(
                        child: Text(
                          // end.toString(),
                          "${values.end.toInt()}",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "SegoeUI",
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Want to Travel For",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "SegoeUI",
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Radio(
                          activeColor: Color(0xff00555C),
                          value: "1",
                          groupValue: radiogroup1,
                          onChanged: (value) {
                            setState(() {
                              radiogroup1 = value.toString();
                              print(radiogroup1);
                            });
                          },
                        ),
                        Text(
                          "India",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "SegoeUI",
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 100.w,
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: Color(0xff00555C),
                          value: "2",
                          groupValue: radiogroup1,
                          onChanged: (value) {
                            setState(() {
                              radiogroup1 = value.toString();
                              print(radiogroup1);
                            });
                          },
                        ),
                        Text(
                          "International",
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
                  height: 20.h,
                ),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Duration (Days)",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "SegoeUI",
                      fontWeight: FontWeight.bold,
                      color: Color(0xff004351)),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "1 Day",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "SegoeUI",
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Container(
                      width: 250.w,
                      child: RangeSlider(
                        divisions: 12,
                        values: values2,
                        onChanged: (value) {
                          setState(() {
                            this.values2 = value;
                          });
                        },
                        activeColor: Color(0xff00555C),
                        inactiveColor: Colors.grey,
                        max: 12,
                        min: 1,
                      ),
                    ),
                    Text(
                      "12 Day",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "SegoeUI",
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 80.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: Color(0xffF5F5F5),
                        borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(color: Color(0xff005057)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 3,
                              offset: Offset(1, 2))
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "${values2.start.toInt()}",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "SegoeUI",
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Text(
                      "to",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "SegoeUI",
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    SizedBox(width: 20.w),
                    Container(
                      width: 80.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: Color(0xffF5F5F5),
                        borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(color: Color(0xff005057)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 3,
                              offset: Offset(1, 2))
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "${values2.end.toInt()}",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "SegoeUI",
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 20.h,
                ),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Want to Travel Between?",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "SegoeUI",
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Radio(
                          activeColor: Color(0xff00555C),
                          value: "1",
                          groupValue: radiogroup2,
                          onChanged: (value) {
                            setState(() {
                              radiogroup2 = value.toString();
                              print(radiogroup2);
                            });
                          },
                        ),
                        Text(
                          "Jan - Mar",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "SegoeUI",
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 100.w,
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: Color(0xff00555C),
                          value: "2",
                          groupValue: radiogroup2,
                          onChanged: (value) {
                            setState(() {
                              radiogroup2 = value.toString();
                              print(radiogroup2);
                            });
                          },
                        ),
                        Text(
                          "Apr - Jun",
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Radio(
                          activeColor: Color(0xff00555C),
                          value: "3",
                          groupValue: radiogroup2,
                          onChanged: (value) {
                            setState(() {
                              radiogroup2 = value.toString();
                              print(radiogroup2);
                            });
                          },
                        ),
                        Text(
                          "Jul - Sep",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "SegoeUI",
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 100.w,
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: Color(0xff00555C),
                          value: "4",
                          groupValue: radiogroup2,
                          onChanged: (value) {
                            setState(() {
                              radiogroup2 = value.toString();
                              print(radiogroup2);
                            });
                          },
                        ),
                        Text(
                          "Oct - Dec",
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
                  height: 20.h,
                ),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Activities to Do",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "SegoeUI",
                      fontWeight: FontWeight.bold,
                      color: Color(0xff004351)),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Radio(
                          activeColor: Color(0xff00555C),
                          value: "1",
                          groupValue: radiogroup3,
                          onChanged: (value) {
                            setState(() {
                              radiogroup3 = value.toString();
                              print(radiogroup3);
                            });
                          },
                        ),
                        Text(
                          "Nature",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "SegoeUI",
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: Color(0xff00555C),
                          value: "2",
                          groupValue: radiogroup3,
                          onChanged: (value) {
                            setState(() {
                              radiogroup3 = value.toString();
                              print(radiogroup3);
                            });
                          },
                        ),
                        Text(
                          "Beach",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "SegoeUI",
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 30.w,
                        ),
                        Radio(
                          activeColor: Color(0xff00555C),
                          value: "5",
                          groupValue: radiogroup3,
                          onChanged: (value) {
                            setState(() {
                              radiogroup3 = value.toString();
                              print(radiogroup3);
                            });
                          },
                        ),
                        Text(
                          "Lifestyle",
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
                  height: 40.h,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 40.h,
                    width: 120.w,
                    decoration: BoxDecoration(
                      color: Color(0xff09646D),
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3.r,
                            offset: Offset(1, 2))
                      ],
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 2.h),
                        child: Text(
                          "Apply Filter",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "SegoeUI",
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
