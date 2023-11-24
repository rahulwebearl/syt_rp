// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:syt/screens/loginScreen.dart';

class MyotpPage extends StatefulWidget {
  String name;
  String email;
  String password;
  String city;
  String state;
  String refral_code;
  String gender;
  String countrycode;
  String mobile;
  MyotpPage({
    Key? key,
    required this.name,
    required this.email,
    required this.password,
    required this.city,
    required this.state,
    required this.refral_code,
    required this.gender,
    required this.countrycode,
    required this.mobile,
  }) : super(key: key);
  @override
  _MyotpPagePageState createState() => _MyotpPagePageState();

  void initiateAPICall() async {
    Map<String, String> userData = {
      'name': name,
      'email_address': email,
      'phone': mobile,
      'gender': gender,
      'state': state,
      'password': password,
      'city': city
    };

    // Make the API call
    await _callAPI(userData);
  }
}

Future<void> _callAPI(Map<String, String>? userData) async {
  if (userData != null) {
    final String name = userData['name']!;
    final String email = userData['email_address']!;
    final String mobileNumber = userData['phone']!;
    final String gender = userData['gender']!;
    final String state = userData['state']!;
    final String password = userData['password']!;
    final String city = userData['city']!;

    final Map<String, String> requestData = {
      'name': name,
      'email_address': email,
      'phone': mobileNumber,
      'gender': gender,
      'state': state,
      'password': password,
      'city': city
    };

//
    initiateAPICall() async {
      // Retrieve user data here or handle the process to obtain the user data
      Map<String, String> userData = {
        'name': name,
        'email_address': email,
        'phone': mobileNumber,
        'gender': gender,
        'state': state,
        'password': password,
        'city': city
      };

      // Make the API call
      await _callAPI(userData);
    }

//
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final Uri apiUri = Uri.parse('http://13.127.94.213:3000/user');

    try {
      final response = await http.post(
        apiUri,
        headers: headers,
        body: jsonEncode(requestData),
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print(data);
        // Handle a successful API response
      } else {
        print('Error: ${response.body}');
        // Handle API error (non-200 status code)
      }
    } catch (e) {
      print('Exception: $e');
      // Handle exceptions
    }
  } else {
    print("null data");
    // Handle null or missing user data
  }
}

class _MyotpPagePageState extends State<MyotpPage> {
  TextEditingController controller1 = new TextEditingController();
  TextEditingController controller2 = new TextEditingController();
  TextEditingController controller3 = new TextEditingController();
  TextEditingController controller4 = new TextEditingController();
  TextEditingController controller5 = new TextEditingController();
  TextEditingController controller6 = new TextEditingController();

  String radiogroup1 = "1";

  // var newvariable = '1,2,3,4,5,6';

  FocusNode controller1fn = new FocusNode();
  FocusNode controller2fn = new FocusNode();
  FocusNode controller3fn = new FocusNode();
  FocusNode controller4fn = new FocusNode();
  FocusNode controller5fn = new FocusNode();
  FocusNode controller6fn = new FocusNode();
  static const double dist = 3.0;
  TextEditingController currController = new TextEditingController();
  String otp = "";
  late AppDimens appDimens;
  bool isLoading = false;
  late String _verificationId;
  bool autovalidate = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    currController = controller1;
  }

  _showProgressDialog(bool isloadingstate) {
    if (mounted)
      setState(() {
        isLoading = isloadingstate;
      });
  }

  @override
  void dispose() {
    super.dispose();
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    controller5.dispose();
    controller6.dispose();
  }

  @override
  Widget build(BuildContext context) {
    appDimens = new AppDimens(MediaQuery.of(context).size);
//

//
    ///otp pinfield
    List<Widget> widgetList = [
      Padding(
        padding: const EdgeInsets.only(right: dist, left: dist),
        child: Container(
          alignment: Alignment.center,
          child: TextFormField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
            ],
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            enabled: true,
            controller: controller1,
            autofocus: true,
            focusNode: controller1fn,
            onChanged: (ct) {
              if (ct.length > 0 || controller1 == 1) {
                _fieldFocusChange(context, controller1fn, controller2fn);
              }
            },
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: appDimens.text24, color: AppColors.greyText),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: dist, left: dist),
        child: new Container(
          alignment: Alignment.center,
          child: new TextField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            onChanged: (ct) {
              if (ct.length > 0 || controller2 == 2) {
                _fieldFocusChange(context, controller2fn, controller3fn);
              } else if (ct.length == 0) {
                _fieldFocusChange(context, controller2fn, controller1fn);
              }
            },
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
            ],
            controller: controller2,
            focusNode: controller2fn,
            enabled: true,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: appDimens.text24, color: AppColors.greyText),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: dist, left: dist),
        child: new Container(
          alignment: Alignment.center,
          child: new TextField(
            onChanged: (ct) {
              if (ct.length > 0 || controller3 == 3) {
                _fieldFocusChange(context, controller3fn, controller4fn);
              } else if (ct.length == 0) {
                _fieldFocusChange(context, controller3fn, controller2fn);
              }
            },
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
            ],
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            controller: controller3,
            focusNode: controller3fn,
            textAlign: TextAlign.center,
            enabled: true,
            style: TextStyle(
                fontSize: appDimens.text24, color: AppColors.greyText),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: dist, left: dist),
        child: new Container(
          alignment: Alignment.center,
          child: new TextField(
            onChanged: (ct) {
              if (ct.length > 0 || controller4 == 4) {
                _fieldFocusChange(context, controller4fn, controller5fn);
              } else if (ct.length == 0) {
                _fieldFocusChange(context, controller4fn, controller3fn);
              }
            },
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
            ],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            controller: controller4,
            focusNode: controller4fn,
            enabled: true,
            style: TextStyle(
                fontSize: appDimens.text24, color: AppColors.greyText),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: dist, left: dist),
        child: new Container(
          alignment: Alignment.center,
          child: new TextField(
            onChanged: (ct) {
              if (ct.length > 0 || controller5 == 5) {
                _fieldFocusChange(context, controller5fn, controller6fn);
              } else if (ct.length == 0) {
                _fieldFocusChange(context, controller5fn, controller4fn);
              }
            },
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
            ],
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            controller: controller5,
            focusNode: controller5fn,
            textAlign: TextAlign.center,
            enabled: true,
            style: TextStyle(
                fontSize: appDimens.text24, color: AppColors.greyText),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: dist, left: dist),
        child: new Container(
          alignment: Alignment.center,
          child: new TextField(
            onChanged: (ct) {
              if (ct.length == 0 || controller6 == 6) {
                _fieldFocusChange(context, controller6fn, controller5fn);
              }
            },
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
            ],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            controller: controller6,
            focusNode: controller6fn,
            enabled: true,
            style: TextStyle(
                fontSize: appDimens.text24, color: AppColors.greyText),
          ),
        ),
      ),
    ];

    final Map<String, String>? userData =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>?;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.blackColor,
        ),
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
      ),
      body: Stack(
        children: <Widget>[
          SafeArea(
            top: false,
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(appDimens.paddingw16),
                        child: Center(
                          child: Text(
                            "A " +
                                "SMS"
                                    " with the verification code has been sent to your registered " +
                                "mobile number",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.greyText,
                              fontSize: appDimens.text16,
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(bottom: appDimens.paddingw16),
                        child: Visibility(
                          visible: widget.mobile == null ? false : true,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                widget.countrycode + " " + widget.mobile,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.greyText,
                                  fontSize: appDimens.text20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.edit),
                                color: AppColors.greyText,
                                iconSize: appDimens.iconsize,
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: appDimens.paddingw16),
                        child: Center(
                          child: Text(
                            "Enter 6 digits code",
                            style: TextStyle(
                              color: AppColors.greyText,
                              fontSize: appDimens.text12,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.60,
                        child: GridView.count(
                          crossAxisCount: 6,
                          mainAxisSpacing: 10.0,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          childAspectRatio: 1,
                          scrollDirection: Axis.vertical,
                          children: List<Container>.generate(
                            6,
                            (int index) => Container(
                              child: widgetList[index],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      /// [continue button]
                      Utility.loginButtonsWidget(
                        "",
                        "Continue",
                        () {
                          // _onButtonClick();

                          if (controller1.text.trim() == "1" &&
                              controller2.text.trim() == "2" &&
                              controller3.text.trim() == "3" &&
                              controller4.text.trim() == "4" &&
                              controller5.text.trim() == "5" &&
                              controller6.text.trim() == "6") {
                            print("button Pressed");
                            // _callAPI(userData);
                            widget.initiateAPICall();
                            print("Forward to class loginScreen");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ));
                            Utility.showToast(
                                msg: "Please Login To Start Your Tour.");
                          } else {
                            print("Password Is wrong");
                            Utility.showToast(
                                msg: "Please enter valid verification code.");
                          }

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: ((context) {
                          //       return LoginScreen();
                          //     }),
                          //   ),
                          // );
                        },
                        AppColors.blackColor,
                        AppColors.blackColor,
                        appDimens,
                        AppColors.whiteColor,
                        margin: EdgeInsets.all(8.0),
                        borderRadius: 10,
                      ),

                      /// [resend otp]
                      InkWell(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: appDimens.paddingw6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Spacer(),
                              Text(
                                "Didn't receive " + "SMS? ",
                                style: TextStyle(
                                  color: AppColors.greyText,
                                  fontSize: appDimens.text16,
                                ),
                              ),
                              Text(
                                "Resend",
                                style: TextStyle(
                                  color: AppColors.greyText,
                                  fontSize: appDimens.text16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(),
                              // ElevatedButton(
                              //     onPressed: () {
                              //       if (controller1.text.trim() == "1" &&
                              //           controller2.text.trim() == "2" &&
                              //           controller3.text.trim() == "3" &&
                              //           controller4.text.trim() == "4" &&
                              //           controller5.text.trim() == "5" &&
                              //           controller6.text.trim() == "6") {
                              //         print("button Pressed");
                              //         // _callAPI(userData);
                              //         widget.initiateAPICall();
                              //       } else {
                              //         print("Password Is wrong");
                              //         Utility.showToast(
                              //             msg:
                              //                 "Please enter valid verification code.");
                              //       }
                              //     },
                              //     child: Text("DEMO")),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          isLoading
              ? Utility.progress(context, color: Colors.blueAccent)
              : Container(),
        ],
      ),
    );
  }

  _onButtonClick() {
    if (currController.text.trim() == "" ||
        controller1.text.trim() == "1" ||
        controller2.text.trim() == "2" ||
        controller3.text.trim() == "3" ||
        controller4.text.trim() == "4" ||
        controller5.text.trim() == "5" ||
        controller6.text.trim() == "6") {
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => HomeScreen(),
      //     ));
    } else {
      // verifyOtp(
      //   controller1.text.trim() +
      //       controller2.text.trim() +
      //       controller3.text.trim() +
      //       controller4.text.trim() +
      //       controller5.text.trim() +
      //       controller6.text.trim(),
      // );

      // print(controller1.text.trim() +
      //     controller2.text.trim() +
      //     controller3.text.trim() +
      //     controller4.text.trim() +
      //     controller5.text.trim() +
      //     controller6.text.trim() +
      //     "==============================");
      print("Error");
      Utility.showToast(msg: "Please enter valid verification code.");
    }
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void deleteText() {
    if (currController.text.length == 0) {
    } else {
      currController.text = "";
      currController = controller3;
      return;
    }

    if (currController == controller1) {
      controller1.text = "";
    } else if (currController == controller2) {
      controller1.text = "";
      currController = controller1;
    } else if (currController == controller3) {
      controller2.text = "";
      currController = controller2;
    } else if (currController == controller4) {
      controller3.text = "";
      currController = controller3;
    } else if (currController == controller5) {
      controller4.text = "";
      currController = controller4;
    } else if (currController == controller6) {
      controller5.text = "";
      currController = controller5;
    }
  }
}

//For App Color
class AppColors {
  static Color whiteColor = Colors.white;
  static Color selectedColor = Color(0xff9D9D9D);
  static Color blackColor = Colors.black;
  static Color backGroundColor = Color(0xff262626);
  static Color greyText = Colors.grey.shade700;
}

//for the dimention of otp screen
enum DeviceType {
  ANDROIDPHONE,
  ANDROID7INCHTABLET,
  ANDROID10INCHTABLET,
  IOSIPAD3GEN, // WIDTH 834 HEIGHT 1112
  IOSIPADPRO12INCHTABLET, // WIDTH 1024
  IOSIPADPRO11INCHTABLET, // WIDTH 834 HEIGHT 1194
  IOSIPADPRO9INCHTABLET, // WIDTH 768
  IOSIPAD7, // WIDTH 810
  IOSDEVICE
}

class AppDimens {
  double text96 = 96.0;
  double text60 = 60.0;
  double text48 = 48.0;
  double text34 = 34.0;
  double text26 = 26.0;
  double text24 = 24.0;
  double text22 = 22.0;
  double text20 = 20.0;
  double text18 = 18.0;
  double text16 = 16.0;
  double text14 = 14.0;
  double text12 = 12.0;
  double text10 = 10.0;
  double text8 = 8.0;

  double button = 16.0;

  double paddingw2 = 2.0;
  double paddingw4 = 4.0;
  double paddingw6 = 6.0;
  double paddingw8 = 8.0;
  double paddingw10 = 10.0;
  double paddingw12 = 12.0;
  double paddingw14 = 14.0;
  double paddingw16 = 16.0;
  double paddingw18 = 18.0;
  double paddingw20 = 20.0;
  double paddingw22 = 22.0;
  double paddingw24 = 24.0;
  double paddingw26 = 26.0;
  double paddingw28 = 28.0;
  double paddingw30 = 30.0;

  double iconsize = 24;
  DeviceType deviceType = DeviceType.ANDROIDPHONE;
  AppDimens(Size size) {
    _getDevicetypes(size);
    _initSizes(size);
  }

  _initSizes(Size size) {
    double screenwidth = size.width;
    double screenheight = size.height;
    if ((screenwidth > 700)) {
      increasevalues(4.0, 4.0);
    } else if ((screenwidth >= 600 && screenwidth <= 700)) {
      increasevalues(2.0, 2.0);
    } else {
      increasevalues(0.0, 0.0);
    }
  }

  increasevalues(double textvalue, double paddingvalue) {
    text96 = 96.0 + textvalue;
    text60 = 60.0 + textvalue;
    text48 = 48.0 + textvalue;
    text34 = 34.0 + textvalue;
    text26 = 26.0 + textvalue;
    text24 = 24.0 + textvalue;
    text22 = 22.0 + textvalue;
    text20 = 20.0 + textvalue;
    text18 = 18.0 + textvalue;
    text16 = 16.0 + textvalue;
    text14 = 14.0 + textvalue;
    text12 = 12.0 + textvalue;
    text10 = 10.0 + textvalue;
    text8 = 8.0 + textvalue;

    button = 16.0 + textvalue;

    paddingw2 = 2.0 + paddingvalue;
    paddingw4 = 4.0 + paddingvalue;
    paddingw6 = 6.0 + paddingvalue;
    paddingw8 = 8.0 + paddingvalue;
    paddingw10 = 10.0 + paddingvalue;
    paddingw12 = 12.0 + paddingvalue;
    paddingw14 = 14.0 + paddingvalue;
    paddingw16 = 16.0 + paddingvalue;
    paddingw18 = 18.0 + paddingvalue;
    paddingw20 = 20.0 + paddingvalue;
    paddingw22 = 22.0 + paddingvalue;
    paddingw24 = 24.0 + paddingvalue;
    paddingw26 = 26.0 + paddingvalue;
    paddingw28 = 28.0 + paddingvalue;
    paddingw30 = 30.0 + paddingvalue;

    iconsize = 24;
  }

  _getDevicetypes(Size size) {
    double screenwidth = size.width;
    double screenheight = size.height;
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        if ((screenwidth >= 600 && screenwidth <= 700)) {
          deviceType = DeviceType.ANDROID7INCHTABLET;
        } else if ((screenwidth > 700)) {
          deviceType = DeviceType.ANDROID10INCHTABLET;
        } else {
          deviceType = DeviceType.ANDROIDPHONE;
        }
      } else if (Platform.isIOS) {
        if ((screenwidth >= 750 && screenwidth <= 800)) {
          deviceType = DeviceType.IOSIPADPRO9INCHTABLET;
        } else if ((screenwidth > 800 && screenwidth < 900)) {
          if (screenwidth == 810) {
            deviceType = DeviceType.IOSIPAD7;
          } else if (screenwidth == 834 && screenheight == 1194) {
            deviceType = DeviceType.IOSIPADPRO11INCHTABLET;
          } else if (screenwidth == 834 && screenheight == 1112) {
            deviceType = DeviceType.IOSIPAD3GEN;
          }
        } else if ((screenwidth > 1000)) {
          deviceType = DeviceType.IOSIPADPRO12INCHTABLET;
        } else {
          deviceType = DeviceType.IOSDEVICE;
        }
      }
    }
  }
}

//for the otp utility
class Utility {
  static Widget loginButtonsWidget(String icon, String text, Function() onTap,
      Color borderColor, Color color, AppDimens appDimens, Color textColor,
      {required EdgeInsetsGeometry margin, required double borderRadius}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin != null
            ? margin
            : EdgeInsets.only(
                left: appDimens.paddingw16 * 2,
                right: appDimens.paddingw16 * 2,
                bottom: appDimens.paddingw10,
              ),
        decoration: BoxDecoration(
          color: color,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 2,
              color: Colors.black54,
            ),
          ],
          border: Border.all(color: borderColor, width: 0.1),
          borderRadius:
              BorderRadius.circular(borderRadius != null ? borderRadius : 50),
        ),
        child: Container(
          padding: EdgeInsets.all(appDimens.paddingw10),
          child: Row(
            children: <Widget>[
              icon.trim().length == 0
                  ? Container()
                  : Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(right: appDimens.paddingw10),
                      child: Image.asset(
                        icon,
                        height: appDimens.iconsize,
                        width: appDimens.iconsize,
                      ),
                    ),
              Spacer(),
              Text(
                text,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: appDimens.text14,
                    color: textColor,
                    fontWeight: FontWeight.w700),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  static showToast({required String msg}) {
    Fluttertoast.showToast(msg: msg);
  }

  static Widget progress(BuildContext context, {required Color color}) {
    return Container(
      alignment: Alignment.center,
      color: color != null ? color : Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            backgroundColor: AppColors.blackColor.withOpacity(0.1),
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.blackColor),
          ),
        ),
      ),
    );
  }

  static Future<bool> checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
}
