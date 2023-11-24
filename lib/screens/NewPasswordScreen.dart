// import 'package:double_back_to_close_app/double_back_to_close_app.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class NewPasswordScreen extends StatefulWidget {
//   const NewPasswordScreen({Key? key}) : super(key: key);
//
//   @override
//   State<NewPasswordScreen> createState() => _NewPasswordScreenState();
// }
//
// class _NewPasswordScreenState extends State<NewPasswordScreen> {
//
//   bool password = true;
//   bool newpassword = true;
//
//   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
//   TextEditingController _newpassword = TextEditingController();
//   TextEditingController _password = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: DoubleBackToCloseApp(
//         snackBar: SnackBar(
//           content: Text("Tap back again to live"),
//         ),
//         child: Container(
//           color: Colors.white,
//           child: Form(
//             key: _formkey,
//             child: ListView(
//               children: [
//                 Column(
//                   children: [
//                     Stack(
//                       children: [
//                         Container(
//                           height: 320.h,
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                               image: DecorationImage(
//                                   fit: BoxFit.cover,
//                                   image: AssetImage(
//                                       "assets/undraw_Traveling_re_weve.png"))),
//                         ),
//                         IconButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           icon: Icon(
//                             Icons.arrow_back,
//                             color: Color(0xff004351),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 20.h,
//                     ),
//                     Text(
//                       "NEW PASSWORD",
//                       style: TextStyle(
//                         fontSize: 18.sp,
//                         fontFamily: "SegoeUI",
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 40.h,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(left: 42, right: 40),
//                       child: TextFormField(
//                         obscureText: password,
//                         controller: _password,
//                         // focusNode: _pass,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return "Password is required";
//                           }
//                         },
//                         decoration: InputDecoration(
//                           suffixIcon: IconButton(
//                             onPressed: () {
//                               print("++++++++++");
//                               print(password.toString() + "++++++++++++++++++++++++++++");
//                               setState(() {
//                                 password = !password;
//                               });
//                             },
//                             icon: Icon((password != true)
//                                 ? Icons.remove_red_eye_rounded
//                                 : Icons.remove_red_eye_outlined),
//                           ),
//                           hintText: "Password",
//                           labelText: "Password",
//                           enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Color(0xff0A6A73)),
//                               borderRadius: BorderRadius.circular(15.r)),
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15.r)),
//                           disabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: Color(0xff0A6A73)),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 40.h,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(left: 42, right: 40),
//                       child: TextFormField(
//                         obscureText: newpassword,
//                         controller: _newpassword,
//                         // focusNode: _pass,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return "Confirm Password is required";
//                           }
//                           if (_password == _newpassword) {
//                             return "Enter valid Mobile No.";
//                           }
//                         },
//                         decoration: InputDecoration(
//                           suffixIcon: IconButton(
//                             onPressed: () {
//                               print(newpassword.toString() + "_____________________________________222");
//                               setState(() {
//                                 newpassword = !newpassword;
//                               });
//                             },
//                             icon: Icon((newpassword != true)
//                                 ? Icons.remove_red_eye_rounded
//                                 : Icons.remove_red_eye_outlined),
//                           ),
//                           hintText: "Confirm Password",
//                           labelText: "Confirm Password",
//                           enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Color(0xff0A6A73)),
//                               borderRadius: BorderRadius.circular(15.r)),
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15.r)),
//                           disabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: Color(0xff0A6A73)),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 80.h,
//                     ),
//                     InkWell(
//                       onTap: (){
//
//                         if (!_formkey.currentState!.validate()) {
//                           return;
//                         } else {
//                           // if (data.toJson()["message"] ==
//                           //     "successfully login") {
//                           //   print("SUCCESS 😊👌👌👌👌👌");
//                           //   print(data.toJson()["data"]["token"]);
//                           //
//                           //   prefs.setString(
//                           //       "UserId", data.toJson()["data"]["token"]);
//                           //   Navigator.of(context).push(MaterialPageRoute(
//                           //       builder: (context) => NavigationBars()));
//                           // } else {
//                           //   const snackBar = SnackBar(
//                           //       content: Text(
//                           //           "Mobile number or passwor is wrong"));
//                           //   ScaffoldMessenger.of(context)
//                           //       .showSnackBar(snackBar);
//                           //
//                         }
//
//                         print('=====');
//                       },
//                       child: Container(
//                         height: 35.h,
//                         width: 120.w,
//                         decoration: BoxDecoration(
//                           color: Color(0xff09646D),
//                           borderRadius: BorderRadius.circular(10.r),
//                           boxShadow: [
//                             BoxShadow(
//                                 color: Colors.grey,
//                                 blurRadius: 3,
//                                 offset: Offset(1,2))
//                           ],
//                         ),
//                         child: Center(
//                           child: Padding(
//                             padding: EdgeInsets.only(bottom: 2),
//                             child: Text(
//                               "Confirm",
//                               style: TextStyle(
//                                   fontSize: 16.sp,
//                                   fontFamily: "SegoeUI",
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 30.h,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
