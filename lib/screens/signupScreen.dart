import 'package:csc_picker/csc_picker.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:syt/Api.dart';
import 'package:syt/models/ragister_model.dart';
import 'package:syt/screens/demo/myotpsc.dart';
import 'package:syt/screens/loginScreen.dart';
import 'package:syt/screens/privacypolicyScreen.dart';
import 'package:syt/screens/termsandconditionScreen.dart';

import 'otpScreen.dart';

// const createUser = """
// mutation createUser(\$fullname:String!, \$email:String!,\$phone:String!,\$password:String!){
//   createUser(userInput:{fullname:\$fullname,email:\$email,phone:\$phone,password:\$password}){
// _id
// fullname
// email
// phone
// password
// }
// }""";

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  TextEditingController _controller = TextEditingController();
  late String verificationid;

  final userlogin = "";

  //final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _cpassword = TextEditingController();
  TextEditingController _referal_code = TextEditingController();

  //TextEditingController radiogroup1 = TextEditingController();
  TextEditingController _state = TextEditingController();
  TextEditingController _city = TextEditingController();

  bool checkbox = false;
  bool password = true;
  bool cpassword = true;
  int val = 1;

  String radiogroup1 = "1"; //Male
  String? country; //Male
  String? state; //Male
  String? city; //Male
  //String radiogroup2 = "2"; //Female

  // late RegisterModel _register_model;
  @override
  void initState() {
    super.initState();
    UserRagister();
    // _formKey = GlobalKey<FormState>();
  }

  UserRagister() async {}

  String selectedState = 'Gujarat';
  List<String> states = [
    'Andhra Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jammu and Kashmir',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Form(
          key: _formKey,
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
                    height: 5.h,
                  ),
                  Text(
                    "Registration",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: "SegoeUI",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 42, right: 40),
                    child: TextFormField(
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        //fontWeight: FontWeight.bold
                      ),
                      keyboardType: TextInputType.name,
                      controller: _name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Name is required";
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Full Name",
                        labelText: "Full Name",
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
                    padding: const EdgeInsets.only(left: 42, right: 40),
                    child: TextFormField(
                      style: TextStyle(fontSize: 12, color: Colors.black),
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email is required";
                        }
                        if (!EmailValidator.validate(value)) {
                          return 'Email is not valid';
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Email ID",
                        labelText: "Email ID",
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
                  SizedBox(
                    height: 3.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 42, right: 40),
                    child: TextFormField(
                      style: TextStyle(fontSize: 12, color: Colors.black),
                      maxLength: 10,
                      controller: _mobile,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Mobile number is required";
                        } else if (value.length < 10) {
                          return "Mobile number is Incorrect";
                        }
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        counterText: "",
                        hintText: "Mobile No",
                        labelText: "Mobile No",
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
                  SizedBox(
                    height: 3.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 42, right: 40),
                    child: TextFormField(
                      style: TextStyle(fontSize: 12, color: Colors.black),
                      obscureText: password,
                      controller: _password,
                      // focusNode: _pass,
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
                    // TextFormField(
                    //   controller: _password,
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return "Password is required";
                    //     }
                    //   },
                    //   decoration: InputDecoration(
                    //     hintText: "Password",
                    //     labelText: "Password",
                    //     enabledBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(color: Color(0xff0A6A73)),
                    //         borderRadius: BorderRadius.circular(15.r)),
                    //     border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(15.r)),
                    //     disabledBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(color: Color(0xff0A6A73)),
                    //     ),
                    //   ),
                    // ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 42, right: 40),
                    child: TextFormField(
                      obscureText: cpassword,
                      controller: _cpassword,
                      style: TextStyle(fontSize: 12, color: Colors.black),
                      // controller: _referal_code,
                      validator: (value) {
                        if (value != _cpassword.text) {
                          return "";
                        }
                      },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              cpassword = !cpassword;
                            });
                          },
                          icon: Icon((cpassword != true)
                              ? Icons.remove_red_eye_rounded
                              : Icons.remove_red_eye_outlined),
                        ),
                        hintText: "Confirm Password",
                        labelText: "Confirm Password",
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
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 10.w),
                      Text(
                        "Gender",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "SegoeUI",
                            fontWeight: FontWeight.bold,
                            // color: Color(0xff0A6A73)
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 7.w),
                          Radio(
                            activeColor: Colors.blue,
                            value: "Male",
                            groupValue: radiogroup1,
                            onChanged: (value) {
                              setState(() {
                                radiogroup1 = value.toString();
                                print(radiogroup1);
                              });
                            },
                          ),
                          Text(
                            "Male",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                // color: Color(0xff0A6A73)
                                color: Colors.black45),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 8.w),
                          Radio(
                            activeColor: Colors.blue,
                            value: "Female",
                            groupValue: radiogroup1,
                            onChanged: (value) {
                              setState(() {
                                radiogroup1 = value.toString();
                                print(radiogroup1);
                              });
                            },
                          ),
                          Text(
                            "Female",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.black45),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),

                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 40),
                  //   child: CSCPicker(
                  //     selectedItemStyle: TextStyle(color: Colors.black),
                  //     stateDropdownLabel: "State",
                  //     cityDropdownLabel: "City",
                  //     countryDropdownLabel: "Country",
                  //     searchBarRadius: 30,
                  //     flagState: CountryFlag.DISABLE,
                  //     dropdownDialogRadius: 30,
                  //     layout: Layout.vertical,
                  //     dropdownHeadingStyle: TextStyle(color: Colors.black),
                  //     dropdownItemStyle: TextStyle(color: Colors.black),
                  //     disabledDropdownDecoration: BoxDecoration(
                  //         border: Border.all(
                  //           width: 1,
                  //           color: Colors.grey,
                  //         ),
                  //         borderRadius: BorderRadius.circular(10)),
                  //     dropdownDecoration: BoxDecoration(
                  //         border: Border.all(
                  //           width: 1,
                  //           color: Colors.pink,
                  //         ),
                  //         borderRadius: BorderRadius.circular(10)),
                  //     onCountryChanged: (country) {
                  //       // var ind = "India";
                  //       country = country;
                  //
                  //       // getStateData();
                  //     },
                  //     onStateChanged: (state) {
                  //       _state.text = state!;
                  //       // getCityData();
                  //     },
                  //     onCityChanged: (city) {
                  //       _city.text = city!;
                  //     },
                  //   ),
                  // ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: CSCPicker(
                      selectedItemStyle: TextStyle(color: Colors.black),
                      stateDropdownLabel: "State",
                      cityDropdownLabel: "City",
                      countryDropdownLabel: "Country",
                      searchBarRadius: 30,
                      flagState: CountryFlag.DISABLE,
                      dropdownDialogRadius: 30,
                      layout: Layout.vertical,
                      dropdownHeadingStyle: TextStyle(color: Colors.black),
                      dropdownItemStyle: TextStyle(color: Colors.black),
                      disabledDropdownDecoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      dropdownDecoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.pink,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      onCountryChanged: (value) {
                        setState(() {
                          country = value;
                        });
                      },
                      onStateChanged: (value) {
                        setState(() {
                          state = value;
                          _state.text = state.toString();
                        });
                      },
                      onCityChanged: (value) {
                        setState(() {
                          city = value;
                          _city.text = city.toString();
                        });
                      },
                    ),
                  ),

                  // Row(
                  //   children: [
                  //     SizedBox(width: 10.w,),
                  //     Text(
                  //       "State",
                  //       style: TextStyle(
                  //           fontSize: 16,
                  //           fontFamily: "SegoeUI",
                  //           fontWeight: FontWeight.bold,
                  //           // color: Color(0xff0A6A73)
                  //           color: Colors.black),
                  //     ),
                  //     SizedBox(width: 10.w,),
                  //     DropdownButton(
                  //       value: selectedState,
                  //       items: states.map((state){
                  //         return DropdownMenuItem(
                  //             child: Text(
                  //                 state,
                  //               style: TextStyle(color: Colors.black),
                  //             ),
                  //             value: state,
                  //         );
                  //       }).toList(),
                  //       onChanged: (state){
                  //         setState(() {
                  //
                  //           selectedState=state.toString();
                  //         });
                  //       },
                  //     )
                  //   ],
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 42, right: 40),
                  //
                  //   child: TextFormField(
                  //     style: TextStyle(
                  //         fontSize: 12,
                  //
                  //         color: Colors.black
                  //     ),
                  //     controller: _state,
                  //     validator: (value) {
                  //       if (value!.isEmpty) {
                  //         return "State is required";
                  //       }
                  //     },
                  //     decoration: InputDecoration(
                  //       hintText: " State",
                  //       labelText: " State",
                  //       enabledBorder: OutlineInputBorder(
                  //           borderSide: BorderSide(color: Color(0xff0A6A73)),
                  //           borderRadius: BorderRadius.circular(15)),
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(15)),
                  //       disabledBorder: OutlineInputBorder(
                  //         borderSide: BorderSide(color: Color(0xff0A6A73)),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 3.h,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 42, right: 40),
                  //   child: TextFormField(
                  //     style: TextStyle(
                  //         fontSize: 12,
                  //
                  //         color: Colors.black
                  //     ),
                  //     controller: _city,
                  //     validator: (value) {
                  //       if (value!.isEmpty) {
                  //         return "City is required";
                  //       }
                  //     },
                  //     decoration: InputDecoration(
                  //       hintText: " City",
                  //       labelText: " City",
                  //       enabledBorder: OutlineInputBorder(
                  //           borderSide: BorderSide(color: Color(0xff0A6A73)),
                  //           borderRadius: BorderRadius.circular(15)),
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(15)),
                  //       disabledBorder: OutlineInputBorder(
                  //         borderSide: BorderSide(color: Color(0xff0A6A73)),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 3.h,
                  ),

                  /// [T & c checkbox]

                  Row(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 15.w,
                      ),
                      Checkbox(
                        splashRadius: 5,
                        value: checkbox,
                        activeColor: Color(0xff0A6A73),
                        onChanged: (value) {
                          setState(() {
                            this.checkbox = value!;
                          });
                        },
                      ),
                      Stack(
                        children: [
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 1.w),
                                child: Text(
                                  'I Accept',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: "SegoeUI",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  print("Forward to class TermsAndCondition");
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          TermsAndCondition()));
                                },
                                child: Text(
                                  'T&C',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff0A6A73)),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 1.w, right: 1.w),
                                child: Text(
                                  'And',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: "SegoeUI",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  print("Forward to class PrivacyPolicy");
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => PrivacyPolicy()));
                                },
                                child: Text(
                                  "Privacy Policy",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff0A6A73)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 3.h,
                  ),
                  InkWell(
                    onTap: () async {
                      print("Press");
                      final SharedPreferences prefs = await _prefs;
                      if (_formKey.currentState!.validate()) {
                        if (checkbox == false) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text("Please accept the terms & conditions"),
                            backgroundColor: Colors.red,
                          ));
                        } else if (_city.text == '' && _state.text == '') {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Please select state and city"),
                            backgroundColor: Colors.red,
                          ));
                        } else if (_password.text != _cpassword.text) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Password is not same"),
                            backgroundColor: Colors.red,
                          ));
                        } else {
                          _formKey.currentState!.save();

                          String name = _name.text;
                          String email_address = _email.text;
                          String mobile_number = _mobile.text;
                          String password = _password.text;
                          String referal_code = _referal_code.text;
                          String gender = radiogroup1;
                          String state = _state.text;
                          String city = _city.text;
                          // String ref = "233828";

                          prefs.setString("name", name);
                          prefs.setString("email_address", email_address);
                          prefs.setString("mobile_number", mobile_number);
                          prefs.setString("password", password);
                          prefs.setString("referal_code", referal_code);
                          prefs.setString("gender", gender);
                          prefs.setString("state", state);
                          prefs.setString("city", city);

                          // if (name.isEmpty) {
                          //   print(name + "++++++++++++++++++++++");
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     SnackBar(
                          //       content: Text(
                          //         'name_field_is_required',
                          //       ),
                          //       backgroundColor: Colors.red,
                          //     ),
                          //   );
                          // } else if (email_address.isEmpty) {
                          //   print(email_address + "++++++++++++++++++++++");
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     SnackBar(
                          //       content: Text(
                          //         'email_address_is_required',
                          //       ),
                          //       backgroundColor: Colors.red,
                          //     ),
                          //   );
                          // } else if (mobile_number.isEmpty) {
                          //   print(mobile_number + "++++++++++++++++++++++");
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     SnackBar(
                          //       content: Text(
                          //         'mobile_number_MUST_BE_REQUIRED',
                          //       ),
                          //       backgroundColor: Colors.red,
                          //     ),
                          //   );
                          // } else if (password.isEmpty) {
                          //   print(password + "++++++++++++++++++++++");

                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     SnackBar(
                          //       content: Text('PASSWORD_MUST_BE_REQUIRED'),
                          //       backgroundColor: Colors.red,
                          //     ),
                          //   );
                          // } else if (gender.isEmpty) {
                          //   print(gender + "++++++++++++++++++++++");

                          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //     content: Text('gender_DID_NOT_MATCH'),
                          //     backgroundColor: Colors.red,
                          //   ));
                          // } else if (state.isEmpty) {
                          //   print(state + "++++++++++++++++++++++");

                          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //     content: Text('state_DID_NOT_MATCH'),
                          //     backgroundColor: Colors.red,
                          //   ));
                          // } else if (city.isEmpty) {
                          //   print(city + "++++++++++++++++++++++");

                          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //     content: Text('city_DID_NOT_MATCH'),
                          //     backgroundColor: Colors.red,
                          //   ));
                          // } else if (referal_code.isEmpty) {
                          //   print(referal_code + "++++++++++++++++++++++");

                          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //     content: Text('referal_code_DID_NOT_MATCH'),
                          //     backgroundColor: Colors.red,
                          //   ));
                          // } else {
                          //   print(
                          //       "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");

                          //   //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OtpScreen(this._controller.text, mobile: null,)));

                          // }

                          continueClick();
                        }
                      }

                      // String name = _name.text;
                      // String email_address = _email.text;
                      // String mobile_number = _mobile.text;
                      // String password = _password.text;
                      // String referal_code = _referal_code.text;
                      // String gender = radiogroup1;
                      // String state = _state.text;
                      // String city = _city.text;
                      //
                      // register_model data = await Ragister().userdetails(
                      //     name,
                      //     email_address,
                      //     mobile_number,
                      //     password,
                      //     referal_code,
                      //     gender,
                      //     state,
                      //     city);
                      //
                      // setState(() async {
                      //   _register_model = data;
                      //   print("syt");
                      //
                      //   if (data.toJson()["message"] == "user registered") {
                      //     print("SUCCESS 😊👌👌👌👌👌");
                      //     continueClick();
                      //   } else {
                      //     print("User is already registerd");
                      //   }
                      // });
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 4.h),
                      height: 5.h,
                      width: 30.w,
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
                          padding: EdgeInsets.only(bottom: 0.4.h),
                          child: Text(
                            "Registration",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  continueClick() async {
    FocusScope.of(context).requestFocus(new FocusNode());
    final SharedPreferences prefs = await _prefs;

    String? name = prefs.getString("name");
    print(name.toString() + "++++++++++++++++++++++++++++++++");
    String? email_address = prefs.getString("email_address");
    print(email_address.toString() + "++++++++++++++++++++++++++++++++");
    String? mobile_number = prefs.getString("mobile_number");
    print(mobile_number.toString() + "++++++++++++++++++++++++++++++++");
    String? password = prefs.getString("password");
    print(password.toString() + "++++++++++++++++++++++++++++++++");

    String? referal_code = prefs.getString("referal_code");
    print(referal_code.toString() + "++++++++++++++++++++++++++++++++");

    String? gender = prefs.getString("gender");
    print(gender.toString() + "++++++++++++++++++++++++++++++++");

    String? state = prefs.getString("state");
    print(state.toString() + "++++++++++++++++++++++++++++++++");

    String? city = prefs.getString("city");
    print(city.toString() + "++++++++++++++++++++++++++++++++");

    int mobileNumber = int.parse(mobile_number.toString());

    // RegisterModel data = await Ragister().userdetails(
    //     name, email_address, mobileNumber, password, gender, state, city);

    // print(".....❤️❤️❤️❤️❤️" + data.message.toString());
    print("Forward to class MyotpPage");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyotpPage(
          city: _city.text,
          email: _email.text,
          gender: gender.toString(),
          name: _name.text,
          password: _password.text,
          refral_code: _referal_code.text,
          state: state.toString(),
          mobile: _mobile.text.trim(),
          countrycode: "+91",
        ),
      ),
    );

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => VerificationScreen(
    //       mobile: _mobile.text.trim(),
    //       countrycode: "+91",
    //     ),
    //   ),
    // );
    //  else {
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   content: Text("Data is already registered"),
    //   backgroundColor: Colors.red,
    // ));
    //   Navigator.of(context).push(MaterialPageRoute(
    //     builder: (context) => LoginScreen(),
    //   ));
    // }
  }
}
