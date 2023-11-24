import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:syt/models/change_profile_model.dart';

import '../Api.dart';
import 'loginScreen.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool password = true;
  bool newpassword = true;
  bool oldpassword = true;
  String phone = "";
  String pwd = "";
  String countrycode = "+91";
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _oldPasswordController = TextEditingController();

  FocusNode _passwordFocus = FocusNode();
  FocusNode _confirmPasswordFocus = FocusNode();
  FocusNode _oldPasswordFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    loaddata();
  }

  void loaddata() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      print("inside new pwd");
      phone = prefs.getString("mnum").toString();
      pwd = prefs.getString("pwd").toString();
      print(prefs.getString("mnum").toString());
    });
    setState(() {});
  }

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
                        //padding: EdgeInsets.only(bottom: 3.h),
                        height: 32.h,
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
                    height: 2.h,
                  ),
                  Text(
                    "CHANGE PASSWORD",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: "SegoeUI",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8.w,
                      right: 8.w,
                    ),
                    child: TextFormField(
                      style: TextStyle(fontSize: 12, color: Colors.black),
                      maxLength: 10,
                      //keyboardType: TextInputType.number,
                      obscureText: oldpassword,
                      focusNode: _oldPasswordFocus,

                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return "Mobile No is required";
                      //   }
                      //   if (value.length < 10) {
                      //     return "Enter valid Mobile No.";
                      //   }
                      // },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              print(oldpassword.toString() +
                                  "1111111111111111111111111111");
                              oldpassword = !oldpassword;
                            });
                          },
                          icon: Icon((oldpassword != true)
                              ? Icons.remove_red_eye_rounded
                              : Icons.remove_red_eye_outlined),
                        ),
                        counterText: "",
                        hintText: "Old Password",
                        hintStyle: TextStyle(fontSize: 12),
                        labelText: "Old Password",
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
                      controller: _oldPasswordController,
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),

                  /// [new password box]
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8.w,
                      right: 8.w,
                    ),
                    child: TextFormField(
                      style: TextStyle(fontSize: 12, color: Colors.black),
                      maxLength: 10,
                      //keyboardType: TextInputType.number,
                      obscureText: password,
                      focusNode: _confirmPasswordFocus,

                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return "Mobile No is required";
                      //   }
                      //   if (value.length < 10) {
                      //     return "Enter valid Mobile No.";
                      //   }
                      // },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              print(password.toString() +
                                  "1111111111111111111111111111");
                              password = !password;
                            });
                          },
                          icon: Icon((password != true)
                              ? Icons.remove_red_eye_rounded
                              : Icons.remove_red_eye_outlined),
                        ),
                        counterText: "",
                        hintText: "New Password",
                        hintStyle: TextStyle(fontSize: 12),
                        labelText: "New Password",
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
                      controller: _passwordController,
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),

                  /// [confirm password box]
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8.w,
                      right: 8.w,
                    ),
                    child: TextFormField(
                      style: TextStyle(fontSize: 12, color: Colors.black),
                      maxLength: 10,
                      obscureText: newpassword,
                      //  keyboardType: TextInputType.text,
                      focusNode: _passwordFocus,
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return "Mobile No is required";
                      //   }
                      //   if (value.length < 10) {
                      //     return "Enter valid Mobile No.";
                      //   }
                      // },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              newpassword = !newpassword;
                            });
                          },
                          icon: Icon((newpassword != true)
                              ? Icons.remove_red_eye_rounded
                              : Icons.remove_red_eye_outlined),
                        ),
                        counterText: "",
                        hintText: "Confirm Password",
                        hintStyle: TextStyle(fontSize: 12),
                        labelText: "Confirm Password",
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
                      controller: _confirmPasswordController,
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),

                  /// [submit button]
                  InkWell(
                    onTap: () {
                      if (!_formkey.currentState!.validate()) {
                        return continueClick();
                      } else {
                        continueClick();
                      }
                    },
                    child: Container(
                      height: 4.h,
                      width: 25.w,
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
                          padding: EdgeInsets.only(bottom: 2),
                          child: Text(
                            "Submit",
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
    print(pwd.toString() + "ppppppppp");
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text.trim();
    if (password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'PASSWORD_MUST_BE_REQUIRED',
        ),
        backgroundColor: Colors.red,
      ));
    } else if (confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'CONFIRM_PASSWORD_MUST_BE_REQUIRED',
        ),
        backgroundColor: Colors.red,
      ));
    } else if (_oldPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'OLD_PASSWORD_MUST_BE_REQUIRED',
        ),
        backgroundColor: Colors.red,
      ));
    } else if (password != confirmPassword) {
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'CONFIRM_PASSWORD_DID_NOT_MATCH',
        ),
        backgroundColor: Colors.red,
      ));
    } else if (pwd != _oldPasswordController.text) {
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'OLD_PASSWORD_DID_NOT_MATCH',
        ),
        backgroundColor: Colors.red,
      ));
    } else if (_passwordController == _oldPasswordController.text) {
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'NEW_PASSWORD_AND_OLD_PASSWORD_MATCH',
        ),
        backgroundColor: Colors.red,
      ));
    } else {
      ///post Api

      String mobile_number = phone;
      print(mobile_number + ".......++++++++++++++++++++++++++++++");
      String newpassword = _confirmPasswordController.text.trim();
      print(newpassword + "+++++++++++++++++++++++++++++++++");
      // print("post data to api");

      // Update_password data =
      // await UpdatePassword().UpdatePasswordList(mobile_number, newpassword);
      changePasswordModel data = await ChangePasswordApi().changePasswordList(
          _oldPasswordController.text, _passwordController.text);
      // print(data.message.toString() +
      //     "+++++++++++++++++++++++++++++++++++++++++");

      // print("SUCCESS 😊👌👌👌👌👌");
      // print("+++++++xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx+++++++++++");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("your password is updated & LogIn With New Password..."),
        backgroundColor: Colors.black,
      ));

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));

      FocusScope.of(context).requestFocus(new FocusNode());
    }
  }
}
