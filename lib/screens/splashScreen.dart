import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:syt/screens/homeScreen.dart';

import 'package:syt/screens/loginScreen.dart';
import 'package:syt/screens/navigationbar.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? UserId = prefs.getString('UserId');
    if (UserId == null) {
      print("move to login page");
      Future.delayed(Duration(milliseconds: 3000), () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    } else {
      print("move to home page");
      Future.delayed(Duration(milliseconds: 3000), () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => NavigationBars()));
      });
    }
    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => NavigationBars()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50.h,
        child: Center(
          child: Text(
            "Produce By WebEarl Technologies Pvt Ltd",
            style: TextStyle(
              fontSize: 12,
              fontFamily: "SegoeUI",
              fontWeight: FontWeight.bold,
              color: Color(0xff09646D),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300.h,
                width: 500.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/splashscreen.jpg"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
