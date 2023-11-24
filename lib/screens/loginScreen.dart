import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:syt/Api.dart';
import 'package:syt/models/login_model.dart';

import 'package:syt/screens/forgotpasswordScreen.dart';
import 'package:syt/screens/navigationbar.dart';
import 'package:syt/screens/signupScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../notificationservice/local_notification_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final userlogin = """
query userlogin(\$username:String!,\$password:String!,\$userType:String!){
  userlogin(username:\$username,password:\$password,userType:\$userType){
    userId
    token
    userType
    tokenExpiration
  }
}
""";
  bool password = true;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController mobile = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    late LoginModel _loginmodel;

    FocusNode _mobile = FocusNode();
    FocusNode _pass = FocusNode();

    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: SnackBar(
          content: Text("Tap back again to Leave"),
        ),
        child: Container(
          color: Colors.white,
          child: Form(
            key: _formkey,
            child: ListView(
              children: [
                Column(
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
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "LOG IN",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "SegoeUI",
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 9.w, right: 9.w),
                      child: TextFormField(
                        maxLength: 10,
                        style: TextStyle(fontSize: 12, color: Colors.black),
                        controller: mobile,
                        // focusNode: _mobile,

                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Mobile number is required ";
                          }
                          if (value.length < 10) {
                            return "Enter valid Mobile No.";
                          }
                        },

                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          // counterText: "",
                          hintText: "Mobile No.",
                          hintStyle: TextStyle(fontSize: 14),

                          labelText: "Mobile No.",
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
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 9.w, right: 9.w),
                      child: TextFormField(
                        obscureText: password,
                        controller: _password,
                        // focusNode: _pass,
                        style: TextStyle(fontSize: 12, color: Colors.black),

                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password is required";
                          }
                        },
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                password = !password;
                              });
                            },
                            icon: Icon((password != true)
                                ? Icons.remove_red_eye_rounded
                                : Icons.remove_red_eye_outlined),
                          ),
                          hintText: "Password",
                          labelText: "Password",
                          hintStyle: TextStyle(fontSize: 12),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff0A6A73)),
                              borderRadius: BorderRadius.circular(15)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff0A6A73)),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // SizedBox(
                        //   width: 240.w,
                        // ),
                        Padding(
                          padding: EdgeInsets.only(right: 9.w),
                          child: TextButton(
                            onPressed: () {
                              print('Forgot Password class');
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ForgotPassword()));
                            },
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "SegoeUI",
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffBE1C1C)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    InkWell(
                      onTap: () async {
                        if (_formkey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });

                          dynamic mobileNumber = int.parse(mobile.text);
                          print("😀😀😀😀😀😀" + mobileNumber.toString());
                          String password = _password.text;

                          var role = 0;
                          final SharedPreferences prefs = await _prefs;

                          LoginModel data = await Login()
                              .userList(mobileNumber, password, role);

                          print("😀😀😀😀😀😀" + data.message.toString());
                          if (data.toJson()["message"] ==
                              "successfully login") {
                            print("Success ❤️❤️❤️❤️❤️❤️❤️");
                            // print("SUCCESS 😊👌👌👌👌👌");
                            print(
                                data.toJson()["data"]["token"] + "ashok.....");

                            prefs.setString(
                                "UserId", data.toJson()["data"]["token"]);

                            prefs.setString("pwd", password.toString());
                            prefs.setString("mnum", mobileNumber.toString());

                            print("--ID-->> ${prefs.getString("UserId")}");

                            setState(() {
                              isLoading = false;
                            });
                            LocalNotificationService().sendNotification(
                                "Start Your Tour",
                                "Welcome to the Start Your Tour");
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content:
                                    Text("Welcome To The Start Your Tour")));
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NavigationBars()),
                              (route) => false,
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Please enter valid details"),
                              backgroundColor: Colors.red,
                            ));
                            setState(() {
                              isLoading = false;
                            });
                          }

                          // const snackBar =
                          //     SnackBar(content: Text("Please enter details"));
                          // ScaffoldMessenger.of(context).showSnackBar(snackBar);

                          // return;
                        }

                        // setState(() {
                        //   isLoading = true;
                        //   _loginmodel = data;
                        //   print("cross check");

                        //   if (!_formkey.currentState!.validate()) {
                        //      const snackBar = SnackBar(
                        //           content: Text(
                        //               "Please enter details"));
                        //       ScaffoldMessenger.of(context)
                        //           .showSnackBar(snackBar);

                        //     return;
                        //   } else {
                        //     if (data.toJson()["message"] ==
                        //         "successfully login") {
                        //       print("SUCCESS 😊👌👌👌👌👌");
                        //       print(data.toJson()["data"]["token"]);

                        //       prefs.setString(
                        //           "UserId", data.toJson()["data"]["token"]);

                        //       Navigator.pushReplacement(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) => NavigationBars()));
                        //       setState(() {
                        //         isLoading = false;
                        //       });
                        //     } else {
                        //       const snackBar = SnackBar(
                        //           content: Text(
                        //               "Mobile number or password is wrong"));
                        //       ScaffoldMessenger.of(context)
                        //           .showSnackBar(snackBar);
                        //     }
                        //   }
                        // });

                        // else {
                        //   if (data.toJson()["message"] ==
                        //       "successfully login") {
                        //     print("SUCCESS 😊❤️❤️❤️❤️👌👌👌👌👌");
                        //     print(data.toJson()["data"]["token"]);

                        //     prefs.setString(
                        //         "UserId", data.toJson()["data"]["token"]);
                        //     setState(() {
                        //       isLoading = false;
                        //     });
                        //     Navigator.pushReplacement(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => NavigationBars()));
                        //   } else {
                        //     const snackBar = SnackBar(
                        //         content:
                        //             Text("Mobile number or password is wrong"));
                        //     ScaffoldMessenger.of(context)
                        //         .showSnackBar(snackBar);
                        //   }
                        // }
                      },
                      child: isLoading
                          ? CircularProgressIndicator()
                          : Container(
                              height: 5.h,
                              width: 22.w,
                              decoration: BoxDecoration(
                                color: Color(0xff09646D),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 3,
                                      offset: Offset(1, 2))
                                ],
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 2),
                                  child: Text(
                                    "Log in",
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
                      height: 3.h,
                    ),
                    // TextButton(
                    //   onPressed: () {},
                    //   child: Text(
                    //     "Are you a travel agency?",
                    //     style: TextStyle(
                    //         fontSize: 12,
                    //         fontFamily: "SegoeUI",
                    //         fontWeight: FontWeight.bold,
                    //         color: Colors.black),
                    //   ),
                    // ),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't Have an Account?",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "SegoeUI",
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        TextButton(
                          onPressed: () {
                            print("Forward to class SignupScreen");
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignupScreen()));
                          },
                          child: Text(
                            "Create Account ",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Color(0xff0A6A73)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
