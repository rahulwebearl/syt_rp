import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syt/screens/demo/pacakgedetaildemooo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'honeymoondestinationsScreen.dart';

class BudgetPerHead extends StatefulWidget {
  @override
  _BudgetPerHeadState createState() => _BudgetPerHeadState();
}

class _BudgetPerHeadState extends State<BudgetPerHead> {
  late SharedPreferences prefs;
  String radiogroup1 = "1";
  String radiogroup3 = "3";
  String radiogroup4 = "4";

  RangeValues values2 = RangeValues(1, 12);
  double start = 1000;
  double end = 3000;
  String dropdownvalue = "January";

  var months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  // Function to reset selected radio buttons
  void resetRadioButtons() {
    setState(() {
      radiogroup1 = ""; // Reset radiogroup1
      radiogroup3 = "";
      radiogroup4 = ""; // Reset radiogroup4

      // You might need to reset other state variables or values as well if needed
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initsharedPrefs();
  }

  _initsharedPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  void _savetoPrefs() {
    if (prefs != null) {
      prefs.setString("radiogroup1", radiogroup1);
      prefs.setString("radiogroup3", radiogroup3);
      prefs.setString("radiogroup4", radiogroup4);

      prefs.setString("RangeValues1", values2.toString());
      prefs.setString("dropdownvalue", dropdownvalue);
    } else {
      print("shared prefers is invalid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HoneymoonDestinations(),
                ));
          },
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff004351),
          ),
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
                      "Popularity",
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
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                  child: Row(
                    children: [
                      Radio(
                        activeColor: Color(0xff00555C),
                        value: "10000",
                        groupValue: radiogroup3,
                        onChanged: (value) {
                          setState(() {
                            radiogroup3 = value.toString();
                            print(radiogroup3);
                          });
                        },
                      ),
                      Text(
                        "Less than 10000",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "SegoeUI",
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Radio(
                        activeColor: Color(0xff00555C),
                        value: "10000 to 20000",
                        groupValue: radiogroup3,
                        onChanged: (value) {
                          setState(() {
                            radiogroup3 = value.toString();
                            print(radiogroup3);
                          });
                        },
                      ),
                      Text(
                        "10000 to 20000",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "SegoeUI",
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                  child: Row(
                    children: [
                      Radio(
                        activeColor: Color(0xff00555C),
                        value: "20000 to 40000",
                        groupValue: radiogroup3,
                        onChanged: (value) {
                          setState(() {
                            radiogroup3 = value.toString();
                            print(radiogroup3);
                          });
                        },
                      ),
                      Text(
                        "20000 to 40000",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "SegoeUI",
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Radio(
                        activeColor: Color(0xff00555C),
                        value: "40000 to 60000",
                        groupValue: radiogroup3,
                        onChanged: (value) {
                          setState(() {
                            radiogroup3 = value.toString();
                            print(radiogroup3);
                          });
                        },
                      ),
                      Text(
                        "40000 to 60000",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "SegoeUI",
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                  child: Row(
                    children: [
                      Radio(
                        activeColor: Color(0xff00555C),
                        value: "60000 to 80000",
                        groupValue: radiogroup3,
                        onChanged: (value) {
                          setState(() {
                            radiogroup3 = value.toString();
                            print(radiogroup3);
                          });
                        },
                      ),
                      Text(
                        "60000 to 80000",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "SegoeUI",
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      Radio(
                        activeColor: Color(0xff00555C),
                        value: "80000",
                        groupValue: radiogroup3,
                        onChanged: (value) {
                          setState(() {
                            radiogroup3 = value.toString();
                            print(radiogroup3);
                          });
                        },
                      ),
                      Text(
                        "Above 80000",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "SegoeUI",
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
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
                  "Type of Destination",
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
                  "Which month Do you Want Travel?",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "SegoeUI",
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 20.h,
                ),
                DropdownButton(
                  value: dropdownvalue,
                  items: months.map((String months) {
                    return DropdownMenuItem(
                        value: months,
                        child: Text(
                          months,
                          style: TextStyle(color: Colors.black),
                        ));
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      dropdownvalue = value!;
                    });
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          resetRadioButtons();
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
                                "Reset",
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
                      InkWell(
                        onTap: () {
                          _savetoPrefs();
                          resetRadioButtons();

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HoneymoonDestinations(),
                              ));
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
                    ],
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
