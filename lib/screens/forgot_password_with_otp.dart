import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syt/screens/NewPasswordScreen.dart';

import 'newpassword.dart';
import 'otpScreen.dart';

class OtpScreen extends StatefulWidget {
  final String phone;
  final String countrycode;
  OtpScreen({required this.phone, required this.countrycode});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  TextEditingController controller1 = new TextEditingController();
  TextEditingController controller2 = new TextEditingController();
  TextEditingController controller3 = new TextEditingController();
  TextEditingController controller4 = new TextEditingController();
  TextEditingController controller5 = new TextEditingController();
  TextEditingController controller6 = new TextEditingController();
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
  String checkotp = "123456";
  @override
  void initState() {
    super.initState();
    currController = controller1;
    _verifyPhoneNumber();
  }

  void _verifyPhoneNumber() async {
    if (mounted)
      setState(() {
        isLoading = true;
      });

    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      // Utility.showToast(msg: authException.message);
      print(authException.code);
      print(authException.message);
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int? forceResendingToken]) async {
      print("codeSent");
      print(verificationId);
      Utility.showToast(
          msg: "Please check your phone for the verification code.");
      _verificationId = verificationId;
    } as PhoneCodeSent;

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      print("codeAutoRetrievalTimeout");
      _verificationId = verificationId;
    };

    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      print("verificationCompleted");
    };

    if (kIsWeb) {
      await _auth
          .signInWithPhoneNumber(
        widget.countrycode + widget.phone,
      )
          .then((value) {
        _verificationId = value.verificationId;
        print("then");
      }).catchError((onError) {
        print(onError);
      });
    } else {
      await _auth
          .verifyPhoneNumber(
              phoneNumber: widget.countrycode + widget.phone,
              timeout: Duration(seconds: 60),
              verificationCompleted: verificationCompleted,
              verificationFailed: verificationFailed,
              codeSent: codeSent,
              codeAutoRetrievalTimeout: codeAutoRetrievalTimeout)
          .then((value) {
        print("then");
      }).catchError((onError) {
        print(onError);
      });
    }

    if (mounted)
      setState(() {
        isLoading = false;
      });
  }

  void _signInWithPhoneNumber(String otp) async {
    _showProgressDialog(true);
    if (await Utility.checkInternet()) {
      try {
        final AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId,
          smsCode: otp,
        );
        final User? user = (await _auth.signInWithCredential(credential)).user;
        final User? currentUser = _auth.currentUser;
        assert(user?.uid == currentUser?.uid);

        _showProgressDialog(false);
        if (user != null) {
          print(user);
          print("${user} Forward to Class NewPasssword");
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => NewPassword(),
          ));
        } else {
          Utility.showToast(msg: "Sign in failed");
        }
      } catch (e) {
        print(e);

        Utility.showToast(msg: e.toString());
        _showProgressDialog(false);
      }
    } else {
      _showProgressDialog(false);
      Utility.showToast(msg: "No internet connection");
    }
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

  verifyOtp(String otpText) async {
    _signInWithPhoneNumber(otpText);
  }

  TextEditingController otpControler = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  var enteredOtp;

  @override
  Widget build(BuildContext context) {
    appDimens = new AppDimens(MediaQuery.of(context).size);
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
                        height: 320.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
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
                    height: 40.h,
                  ),
                  Text(
                    "ENTER OTP",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "SegoeUI",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 42.w, right: 42.w),
                    child: PinCodeTextField(
                      keyboardType: TextInputType.number,
                      textStyle: TextStyle(fontSize: 12, color: Colors.black),
                      validator: (value) {
                        if (value!.length < 6) {
                          return "Enter valid otp.";
                        }
                      },
                      controller: otpControler,
                      appContext: context,
                      length: 6,
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          enteredOtp = value;
                        });
                      },
                      //     (ct) {
                      //   if (ct.length > 0) {
                      //     _fieldFocusChange(context, controller1fn, controller2fn);
                      //   }
                      // },
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(6),
                      ],
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(10.r),
                          fieldHeight: 40.h,
                          fieldWidth: 40.w,
                          inactiveColor: Color(0xff0A6A73),
                          borderWidth: 1),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    "Enter 6 Digit OTP which we have sent to your mobile no.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "SegoeUI",
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: 70.h,
                  ),
                  InkWell(
                    onTap: () {
                      print("forward to class NewPassword");
                      // if (!_formkey.currentState!.validate()) {
                      if (enteredOtp == "123456") {
                        print("Passed OTP");
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NewPassword()));
                      } else {
                        print("else check");
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Please Enter correct OTP"),
                          backgroundColor: Colors.red,
                        ));
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewPassword()));
                        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NewPassword()));
                      }
                      // } else {
                      //   print("else check");
                      //   // Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewPassword()));
                      //   // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NewPassword()));
                      // }
                    },
                    child: Container(
                      height: 35.h,
                      width: 150.w,
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
                          padding: EdgeInsets.only(bottom: 2.h),
                          child: Text(
                            "Confirm",
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
                    height: 20.h,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onButtonClick() {
    if (currController.text.trim() == "" &&
        controller1.text.trim() == "1" &&
        controller2.text.trim() == "2" &&
        controller3.text.trim() == "3" &&
        controller4.text.trim() == "4" &&
        controller5.text.trim() == "5" &&
        controller6.text.trim() == "6") {
      Utility.showToast(msg: "Please enter valid verification code.");
    } else {
      verifyOtp(controller1.text.trim() +
          controller2.text.trim() +
          controller3.text.trim() +
          controller4.text.trim() +
          controller5.text.trim() +
          controller6.text.trim());

      print(controller1.text.trim() +
          controller2.text.trim() +
          controller3.text.trim() +
          controller4.text.trim() +
          controller5.text.trim() +
          controller6.text.trim() +
          "==============================");
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
