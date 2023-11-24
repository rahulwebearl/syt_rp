import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syt/screens/submittedrequestScreen.dart';

class AdditionalDetails extends StatefulWidget {
  const AdditionalDetails({Key? key}) : super(key: key);

  @override
  _AdditionalDetailsState createState() => _AdditionalDetailsState();
}

class _AdditionalDetailsState extends State<AdditionalDetails> {
  bool checkbox1 = false;
  bool checkbox2 = false;
  bool checkbox3 = false;
  bool checkbox4 = false;
  bool checkbox5 = false;
  bool checkbox6 = false;
  bool checkbox7 = false;
  bool checkbox8 = false;

  String radiogroup1 = "1";
  String radiogroup2 = "2";
  String radiogroup3 = "3";
  String radiogroup4 = "4";
  String radiogroup5 = "5";
  String radiogroup6 = "6";
  String radiogroup7 = "7";
  String radiogroup8 = "8";
  String radiogroup9 = "9";
  String radiogroup10 = "10";

  _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SubmittedRequest()));
                },
                child: Container(
                  height: 400.h,
                  width: 350.w,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        "How was your experiance?",
                        style: TextStyle(
                            fontFamily: "Franklin_Gothic",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      SizedBox(height: 20.h,),
                      Text(
                        "We want to improve your experiance on this platform",
                        style: TextStyle(
                            fontFamily: "Franklin_Gothic",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Container(
                        height: 100.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/review.png"),
                        )),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            size: 30.h,
                          ),
                          Icon(
                            Icons.star,
                            size: 30.h,
                          ),
                          Icon(
                            Icons.star,
                            size: 30.h,
                          ),
                          Icon(
                            Icons.star,
                            size: 30.h,
                          ),
                          Icon(
                            Icons.star_border,
                            size: 30.h,
                          ),
                        ],
                      ),
                      SizedBox(height: 30.h,),
                      Container(
                        height: 40.h,
                        width: 110.w,
                        decoration: BoxDecoration(
                          color: Color(0xff09646D),
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 3,
                                offset: Offset(1, 2))
                          ],
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: Text(
                              "Done",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "SegoeUI",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        height: 100.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TotalTraveller()));
              },
              child: Container(
                height: 35.h,
                width: 150.w,
                decoration: BoxDecoration(
                  color: Color(0xff09646D),
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 3, offset: Offset(1, 2))
                  ],
                ),
                child: Center(
                  child: Text(
                    "Next",
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Additional Details",
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
            Padding(
              padding: EdgeInsets.only(left: 26.w, right: 26.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Want To Book",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "SegoeUI",
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
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
                            "In 2 to 3 days",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 60.w,
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
                            "In this week",
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
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio(
                            activeColor: Color(0xff00555C),
                            value: "3",
                            groupValue: radiogroup1,
                            onChanged: (value) {
                              setState(() {
                                radiogroup1 = value.toString();
                                print(radiogroup1);
                              });
                            },
                          ),
                          Text(
                            "In this Month",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 60.w,
                      ),
                      Row(
                        children: [
                          Radio(
                            activeColor: Color(0xff00555C),
                            value: "4",
                            groupValue: radiogroup1,
                            onChanged: (value) {
                              setState(() {
                                radiogroup1 = value.toString();
                                print(radiogroup1);
                              });
                            },
                          ),
                          Text(
                            "Later",
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                        activeColor: Color(0xff00555C),
                        value: "5",
                        groupValue: radiogroup1,
                        onChanged: (value) {
                          setState(() {
                            radiogroup1 = value.toString();
                            print(radiogroup1);
                          });
                        },
                      ),
                      Text(
                        "Just checking price",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "SegoeUI",
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "What Is Your Age",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "SegoeUI",
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
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
                            "18 to 25 years",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 60.w,
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
                            "26 to 35 years",
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
                            "36 to 40 years",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 60.w,
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
                            "41 to 50 years",
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                        activeColor: Color(0xff00555C),
                        value: "5",
                        groupValue: radiogroup2,
                        onChanged: (value) {
                          setState(() {
                            radiogroup2 = value.toString();
                            print(radiogroup2);
                          });
                        },
                      ),
                      Text(
                        "Above 50 years",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "SegoeUI",
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Local Experiance",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "SegoeUI",
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Checkbox(
                                splashRadius: 5.r,
                                value: checkbox1,
                                activeColor: Color(0xff0A6A73),
                                onChanged: (value) {
                                  setState(() {
                                    this.checkbox1 = value!;
                                  });
                                },
                              ),
                            ),
                            Text(
                              "It is a long established fact that a reader",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              child: Checkbox(
                                splashRadius: 5.r,
                                value: checkbox2,
                                activeColor: Color(0xff0A6A73),
                                onChanged: (value) {
                                  setState(() {
                                    this.checkbox2 = value!;
                                  });
                                },
                              ),
                            ),
                            Text(
                              "There are many variations of Lorem Ipsum",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              child: Checkbox(
                                splashRadius: 5.r,
                                value: checkbox3,
                                activeColor: Color(0xff0A6A73),
                                onChanged: (value) {
                                  setState(() {
                                    this.checkbox3 = value!;
                                  });
                                },
                              ),
                            ),
                            Text(
                              "Garden of Lorem",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              child: Checkbox(
                                splashRadius: 5.r,
                                value: checkbox4,
                                activeColor: Color(0xff0A6A73),
                                onChanged: (value) {
                                  setState(() {
                                    this.checkbox4 = value!;
                                  });
                                },
                              ),
                            ),
                            Text(
                              "River Crossing",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              child: Checkbox(
                                splashRadius: 5.r,
                                value: checkbox5,
                                activeColor: Color(0xff0A6A73),
                                onChanged: (value) {
                                  setState(() {
                                    this.checkbox5 = value!;
                                  });
                                },
                              ),
                            ),
                            Text(
                              "Sky Diwing",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              child: Checkbox(
                                splashRadius: 5.r,
                                value: checkbox6,
                                activeColor: Color(0xff0A6A73),
                                onChanged: (value) {
                                  setState(() {
                                    this.checkbox6 = value!;
                                  });
                                },
                              ),
                            ),
                            Text(
                              "Scuba Diving",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              child: Checkbox(
                                splashRadius: 5.r,
                                value: checkbox7,
                                activeColor: Color(0xff0A6A73),
                                onChanged: (value) {
                                  setState(() {
                                    this.checkbox7 = value!;
                                  });
                                },
                              ),
                            ),
                            Text(
                              "Safari",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              child: Checkbox(
                                splashRadius: 5.r,
                                value: checkbox8,
                                activeColor: Color(0xff0A6A73),
                                onChanged: (value) {
                                  setState(() {
                                    this.checkbox8 = value!;
                                  });
                                },
                              ),
                            ),
                            Text(
                              "xyz",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Accommodations Would You Prefer In Holiday Plan",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "SegoeUI",
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
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
                            "Homestays",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 60.w,
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
                            "Resorts",
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
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio(
                            activeColor: Color(0xff00555C),
                            value: "3",
                            groupValue: radiogroup3,
                            onChanged: (value) {
                              setState(() {
                                radiogroup3 = value.toString();
                                print(radiogroup3);
                              });
                            },
                          ),
                          Text(
                            "Villas/Cottages",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 35.w,
                      ),
                      Row(
                        children: [
                          Radio(
                            activeColor: Color(0xff00555C),
                            value: "4",
                            groupValue: radiogroup3,
                            onChanged: (value) {
                              setState(() {
                                radiogroup3 = value.toString();
                                print(radiogroup3);
                              });
                            },
                          ),
                          Text(
                            "Hotels",
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
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),

                  Text(
                    "Preferred Mode Of Communication With Agents",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "SegoeUI",
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
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
                            "Call",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
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
                            "Email",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
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
                            "Whatsapp",
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
                    height: 14.h,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //
                  //     Radio(
                  //       activeColor: Color(0xff00555C),
                  //
                  //       value: "3",
                  //       groupValue: radiogroup4,
                  //       onChanged: (value) {
                  //         setState(() {
                  //           radiogroup4 = value.toString();
                  //           print(radiogroup4);
                  //         });
                  //       },
                  //     ),
                  //     Text(
                  //       "Whatsapp",
                  //       style: TextStyle(
                  //
                  //           fontSize: 14,
                  //           fontFamily: "SegoeUI",
                  //           fontWeight: FontWeight.bold,
                  //           color:Colors.black),
                  //     ),
                  //   ],
                  // ),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "This Week I Want To",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "SegoeUI",
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Radio(
                        activeColor: Color(0xff00555C),
                        value: "1",
                        groupValue: radiogroup5,
                        onChanged: (value) {
                          setState(() {
                            radiogroup5 = value.toString();
                            print(radiogroup5);
                          });
                        },
                      ),
                      Text(
                        "Have Idea about destination",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "SegoeUI",
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        activeColor: Color(0xff00555C),
                        value: "2",
                        groupValue: radiogroup5,
                        onChanged: (value) {
                          setState(() {
                            radiogroup5 = value.toString();
                            print(radiogroup5);
                          });
                        },
                      ),
                      Text(
                        "Have Idea about rates",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "SegoeUI",
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        activeColor: Color(0xff00555C),
                        value: "3",
                        groupValue: radiogroup5,
                        onChanged: (value) {
                          setState(() {
                            radiogroup5 = value.toString();
                            print(radiogroup5);
                          });
                        },
                      ),
                      Text(
                        "Book the package",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "SegoeUI",
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Cab For Local Sightseeing?",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "SegoeUI",
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio(
                            activeColor: Color(0xff00555C),
                            value: "1",
                            groupValue: radiogroup6,
                            onChanged: (value) {
                              setState(() {
                                radiogroup6 = value.toString();
                                print(radiogroup6);
                              });
                            },
                          ),
                          Text(
                            "Yes",
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
                            groupValue: radiogroup6,
                            onChanged: (value) {
                              setState(() {
                                radiogroup6 = value.toString();
                                print(radiogroup6);
                              });
                            },
                          ),
                          Text(
                            "No",
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
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Which Type Of Package Would You Preferred?",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "SegoeUI",
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio(
                            activeColor: Color(0xff00555C),
                            value: "1",
                            groupValue: radiogroup7,
                            onChanged: (value) {
                              setState(() {
                                radiogroup7 = value.toString();
                                print(radiogroup7);
                              });
                            },
                          ),
                          Text(
                            "Customizable Package",
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
                    children: [
                      Row(
                        children: [
                          Radio(
                            activeColor: Color(0xff00555C),
                            value: "2",
                            groupValue: radiogroup7,
                            onChanged: (value) {
                              setState(() {
                                radiogroup7 = value.toString();
                                print(radiogroup7);
                              });
                            },
                          ),
                          Text(
                            "Standard Package",
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
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Preferred Time To Call",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "SegoeUI",
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio(
                            activeColor: Color(0xff00555C),
                            value: "1",
                            groupValue: radiogroup8,
                            onChanged: (value) {
                              setState(() {
                                radiogroup8 = value.toString();
                                print(radiogroup8);
                              });
                            },
                          ),
                          Text(
                            "10 AM to 12 PM",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 25.w,
                      ),
                      Row(
                        children: [
                          Radio(
                            activeColor: Color(0xff00555C),
                            value: "2",
                            groupValue: radiogroup8,
                            onChanged: (value) {
                              setState(() {
                                radiogroup8 = value.toString();
                                print(radiogroup8);
                              });
                            },
                          ),
                          Text(
                            "12 to 2 PM",
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
                      Row(
                        children: [
                          Radio(
                            activeColor: Color(0xff00555C),
                            value: "3",
                            groupValue: radiogroup8,
                            onChanged: (value) {
                              setState(() {
                                radiogroup8 = value.toString();
                                print(radiogroup8);
                              });
                            },
                          ),
                          Text(
                            "2 to 4 PM",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 65.w,
                      ),
                      Row(
                        children: [
                          Radio(
                            activeColor: Color(0xff00555C),
                            value: "4",
                            groupValue: radiogroup8,
                            onChanged: (value) {
                              setState(() {
                                radiogroup8 = value.toString();
                                print(radiogroup8);
                              });
                            },
                          ),
                          Text(
                            "4 to 6 PM",
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
                      Row(
                        children: [
                          Radio(
                            activeColor: Color(0xff00555C),
                            value: "5",
                            groupValue: radiogroup8,
                            onChanged: (value) {
                              setState(() {
                                radiogroup8 = value.toString();
                                print(radiogroup8);
                              });
                            },
                          ),
                          Text(
                            "After 6",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 83.w,
                      ),
                      Row(
                        children: [
                          Radio(
                            activeColor: Color(0xff00555C),
                            value: "6",
                            groupValue: radiogroup8,
                            onChanged: (value) {
                              setState(() {
                                radiogroup8 = value.toString();
                                print(radiogroup8);
                              });
                            },
                          ),
                          Text(
                            "Anytime",
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
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Cab Services",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "SegoeUI",
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio(
                            activeColor: Color(0xff00555C),
                            value: "1",
                            groupValue: radiogroup9,
                            onChanged: (value) {
                              setState(() {
                                radiogroup9 = value.toString();
                                print(radiogroup9);
                              });
                            },
                          ),
                          Text(
                            "AC type",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 78.w,
                      ),
                      Row(
                        children: [
                          Radio(
                            activeColor: Color(0xff00555C),
                            value: "2",
                            groupValue: radiogroup9,
                            onChanged: (value) {
                              setState(() {
                                radiogroup9 = value.toString();
                                print(radiogroup9);
                              });
                            },
                          ),
                          Text(
                            "Size and Luxury",
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
                      Row(
                        children: [
                          Radio(
                            activeColor: Color(0xff00555C),
                            value: "3",
                            groupValue: radiogroup9,
                            onChanged: (value) {
                              setState(() {
                                radiogroup9 = value.toString();
                                print(radiogroup9);
                              });
                            },
                          ),
                          Text(
                            "Driver speaks",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 43.w,
                      ),
                      Row(
                        children: [
                          Radio(
                            activeColor: Color(0xff00555C),
                            value: "4",
                            groupValue: radiogroup9,
                            onChanged: (value) {
                              setState(() {
                                radiogroup9 = value.toString();
                                print(radiogroup9);
                              });
                            },
                          ),
                          Text(
                            "Vehicle type",
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

                  Divider(
                    color: Colors.grey,
                  ),

                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Type Of Tour You Want",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "SegoeUI",
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio(
                            activeColor: Color(0xff00555C),
                            value: "1",
                            groupValue: radiogroup10,
                            onChanged: (value) {
                              setState(() {
                                radiogroup10 = value.toString();
                                print(radiogroup10);
                              });
                            },
                          ),
                          Text(
                            "Honeymoon",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 50.w,
                      ),
                      Row(
                        children: [
                          Radio(
                            activeColor: Color(0xff00555C),
                            value: "2",
                            groupValue: 10,
                            onChanged: (value) {
                              setState(() {
                                radiogroup10 = value.toString();
                                print(radiogroup10);
                              });
                            },
                          ),
                          Text(
                            "Family",
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
                      Row(
                        children: [
                          Radio(
                            activeColor: Color(0xff00555C),
                            value: "3",
                            groupValue: radiogroup10,
                            onChanged: (value) {
                              setState(() {
                                radiogroup10 = value.toString();
                                print(radiogroup10);
                              });
                            },
                          ),
                          Text(
                            "Adventure",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 63.w,
                      ),
                      Row(
                        children: [
                          Radio(
                            activeColor: Color(0xff00555C),
                            value: "4",
                            groupValue: radiogroup10,
                            onChanged: (value) {
                              setState(() {
                                radiogroup10 = value.toString();
                                print(radiogroup10);
                              });
                            },
                          ),
                          Text(
                            "Offbeat",
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
                      Row(
                        children: [
                          Radio(
                            activeColor: Color(0xff00555C),
                            value: "5",
                            groupValue: radiogroup10,
                            onChanged: (value) {
                              setState(() {
                                radiogroup10 = value.toString();
                                print(radiogroup10);
                              });
                            },
                          ),
                          Text(
                            "Wildlife",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 80.w,
                      ),
                      Row(
                        children: [
                          Radio(
                            activeColor: Color(0xff00555C),
                            value: "6",
                            groupValue: radiogroup10,
                            onChanged: (value) {
                              setState(() {
                                radiogroup10 = value.toString();
                                print(radiogroup10);
                              });
                            },
                          ),
                          Text(
                            "Religious",
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
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Additional Requirements?",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "SegoeUI",
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    height: 112.h,
                    width: 322.w,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10,
                              offset: Offset(0, 3))
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: Color(0xff707070))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        maxLines: 4,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  InkWell(
                    onTap: () {
                      _showDialog();
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NavigationBar()));
                    },
                    child: Container(
                      height: 35.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: Color(0xff09646D),
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 3,
                              offset: Offset(1, 2))
                        ],
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 2),
                          child: Text(
                            "Next",
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
                    height: 50.h,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
