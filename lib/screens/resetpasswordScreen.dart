import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syt/screens/loginScreen.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    height: 333.38.h,
                    width: 414.w,
                    decoration: BoxDecoration(color: Colors.greenAccent),
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  Text(
                    "RESET PASSWORD",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "SegoeUI",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 76.h,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 40.w, right: 40.w),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter New Password",
                        hintStyle: TextStyle(fontSize: 12),
                        labelText: "Enter New Password",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                          borderSide: BorderSide(color: Color(0xff0A6A73)),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.r)),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff0A6A73)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 48.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40.w, right: 40.w),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Confirm New Password",
                        hintStyle: TextStyle(fontSize: 12),
                        labelText: "Confirm New Password",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                          borderSide: BorderSide(color: Color(0xff0A6A73)),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.r)),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff0A6A73)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 75.h,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    child: Container(
                      height: 35.h,
                      width: 170.w,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 3,
                                offset: Offset(1, 2))
                          ],
                          color: Color(0xff09646D),
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 2),
                          child: Text(
                            "Change Password",
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
            ],
          ),
        ),
      ),
    );
  }
}
