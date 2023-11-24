import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:syt/screens/Blog/blogScreen.dart';
import 'package:syt/screens/bookedmarkScreen.dart';
import 'package:syt/screens/bookedpackages.dart';
import 'package:syt/screens/demo/Review&commentScreen.dart';
import 'package:syt/screens/loginScreen.dart';
import 'package:syt/screens/navigationbar.dart';
import 'package:syt/screens/privacypolicyScreen.dart';
import 'package:syt/screens/termsandconditionScreen.dart';
import 'package:url_launcher/url_launcher.dart';

import 'ContectScreen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String id = "";

  @override
  void initState() {
    super.initState();
    loaddata();
  }

  void loaddata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //  this line is syntex of sharedprefrences and all page have same syntex line like this------> SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      id = (prefs.getString("UserId"))!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: double.infinity,
          width: 270.w,
          // height: MediaQuery.of(context).size.height / 1,
          // width: MediaQuery.of(context).size.width / 1.5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10.r),
                  topRight: Radius.circular(10.r)),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff005C63),
                    Color(0xff2F939A),
                  ])),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 14.w, right: 14.w),
                child: ListTile(
                  onTap: () {
                    print("Forward to NavigationBarScreen");
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => NavigationBars()));
                  },
                  leading: Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 25,
                  ),
                  title: Padding(
                    padding: EdgeInsets.zero,
                    child: Text(
                      "Home",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "SegoeUI",
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 14.w, right: 14.w),
                child: ListTile(
                  onTap: () {
                    print("Forward to BookedPages");
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BookedPackages()));
                  },
                  leading: Image.asset(
                    "assets/Booked Packages.png",
                  ),
                  title: Padding(
                    padding: EdgeInsets.zero,
                    child: Text(
                      "My Booking",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "SegoeUI",
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(
              //     left: 14.w,
              //     right: 14.w,
              //   ),
              //   child: ListTile(
              //     onTap: () {
              //       // Navigator.of(context).push(
              //       //     MaterialPageRoute(builder: (context) => BookedMark()));
              //     },
              //     leading: Icon(Icons.bookmark, color: Colors.white,size: 30.sp,),
              //     title: Padding(
              //       padding: EdgeInsets.only(left: 20.w),
              //       child: Text(
              //         "Wish List",
              //         style: TextStyle(
              //             fontSize: 18.sp,
              //             fontFamily: "SegoeUI",
              //             fontWeight: FontWeight.bold,
              //             color: Colors.white),
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.only(left: 14.w, right: 14.w),
                child: ListTile(
                  onTap: () {
                    print("Forward to Class RatingPage");
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => RatingPage()));
                  },
                  leading: Image.asset("assets/Rate The App.png"),
                  title: Padding(
                    padding: EdgeInsets.zero,
                    child: Text(
                      "Rate The App",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "SegoeUI",
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 14.w, right: 14.w),
                child: ListTile(
                  onTap: () {
                    print("Forward to Bolg");
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Blog()));
                  },
                  leading: Image.asset("assets/blogs.png"),
                  title: Padding(
                    padding: EdgeInsets.zero,
                    child: Text(
                      "Blog",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "SegoeUI",
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 14.w, right: 14.w),
                child: ListTile(
                  onTap: () {
                    print("Forward to Privacy Policy");
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PrivacyPolicy()));
                  },
                  leading: Icon(
                    Icons.insert_drive_file_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                  title: Padding(
                    padding: EdgeInsets.zero,
                    child: Text(
                      "Privacy Policy",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "SegoeUI",
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 14.w, right: 14.w),
                child: ListTile(
                  onTap: () {
                    print("Forward to TermsAndCondition");
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TermsAndCondition()));
                  },
                  leading: Icon(
                    Icons.insert_drive_file_sharp,
                    color: Colors.white,
                    size: 30,
                  ),
                  title: Padding(
                    padding: EdgeInsets.zero,
                    child: Text(
                      "Terms & Condition",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "SegoeUI",
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 14.w,
                  right: 14.w,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.call,
                    color: Colors.white,
                    size: 30,
                  ),
                  title: Padding(
                    padding: EdgeInsets.zero,
                    child: InkWell(
                      onTap: () {
                        launch("tel://+919033251903");
                        //Navigator.of(context).push(MaterialPageRoute(builder: (Context)=>ContactScreen()));
                      },
                      child: Text(
                        "24*7 Call Us",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "SegoeUI",
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(
              //     left: 14.w,
              //     right: 14.w,
              //   ),
              //   child: ListTile(
              //     leading: Icon(Icons.mail, color: Colors.white,size: 30,),
              //     title: Padding(
              //       padding: EdgeInsets.only(left: 20.w),
              //       child: Text(
              //         "Contact Us",
              //         style: TextStyle(
              //             fontSize: 18.sp,
              //             fontFamily: "SegoeUI",
              //             fontWeight: FontWeight.bold,
              //             color: Colors.white),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              // Expanded(
              //   child: Container(),
              // ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.remove("UserId");
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                          (route) => false);
                      print("UserId");
                      print("log out");
                    },
                    child: Container(
                      height: 40.h,
                      width: 140.w,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(15.r),
                        border: Border.all(color: Colors.white),
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 3.h),
                          child: Text(
                            "Log Out",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "SegoeUI",
                                // fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   height: 30.h,
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
