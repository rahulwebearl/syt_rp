import 'dart:async';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:syt/screens/otpScreen.dart';

import '../Api.dart';
import '../models/mobile_no_mach_model.dart';
import 'forgot_password_with_otp.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String countrycode = "+91";

  TextEditingController _Phonecontroller = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Form(
          key: _formkey,
          child: ListView(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 30.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    "assets/undraw_Traveling_re_weve.png"))),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Color(0xff004351),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    "FORGOT PASSWORD",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontFamily: "SegoeUI",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 42,
                      right: 40,
                    ),
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Mobile No is required";
                        }
                        if (value.length < 10) {
                          return "Enter valid Mobile No.";
                        }
                      },
                      decoration: InputDecoration(
                        counterText: "",
                        hintText: "Mobile No",
                        hintStyle: TextStyle(fontSize: 12),
                        labelText: "Mobile Number",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Color(0xff0A6A73)),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff0A6A73)),
                        ),
                      ),
                      controller: _Phonecontroller,
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1,
                    child: Text(
                      "We will send you an OTP to your registered mobile number",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "SegoeUI",
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  // RichText(
                  //     text: TextSpan(
                  //       children: [
                  //         TextSpan(
                  //           text: "Send OTP again in ",
                  //           style: TextStyle(
                  //               fontSize: 16.sp,
                  //               fontFamily: "SegoeUI",
                  //               fontWeight: FontWeight.bold,
                  //               color: Colors.grey),
                  //         ),
                  //         TextSpan(
                  //           text: "00:$start",
                  //           style: TextStyle(
                  //               fontSize: 16.sp,
                  //               fontFamily: "SegoeUI",
                  //               fontWeight: FontWeight.bold,
                  //               color: Colors.redAccent),
                  //         ),
                  //         TextSpan(
                  //           text: " sec ",
                  //           style: TextStyle(
                  //               fontSize: 16.sp,
                  //               fontFamily: "SegoeUI",
                  //               fontWeight: FontWeight.bold,
                  //               color: Colors.grey),
                  //         ),
                  //       ],
                  //     )),
                  SizedBox(
                    height: 5.h,
                  ),
                  InkWell(
                    onTap: () {
                      if (!_formkey.currentState!.validate()) {
                        return;
                      } else {
                        continueClick();
                      }
                    },
                    child: Container(
                      height: 5.h,
                      width: 22.w,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 3,
                                offset: Offset(1, 2))
                          ],
                          color: Color(0xff09646D),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 0.8.h),
                          child: Text(
                            "Send",
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

  continueClick() async {
    final SharedPreferences prefs = await _prefs;

    String phone = _Phonecontroller.text.trim();

    prefs.setString("phone", phone);

    String mobile_number = phone;
    mobileno_mach_model data = await MobileMach().MobileMachdata(mobile_number);
    if (data.message.toString() == "mobilenumber is not matched") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('mobilenumber is not matched'),
        backgroundColor: Colors.red,

        // && data.message =="mobilenumber is not matched"
      ));
    } else {
      print(data.message.toString() + " ++++++++++++++++++++++++++++++++");
      print("Forward to class OtpScreen");
      FocusScope.of(context).requestFocus(new FocusNode());
      //Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen(phone: _Phonecontroller.text.trim(), countrycode: "+91",),
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OtpScreen(
            phone: _Phonecontroller.text.trim(),
            countrycode: "+91",
          ),
        ),
      );
    }
  }
}
