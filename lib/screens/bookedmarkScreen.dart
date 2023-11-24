// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:syt/screens/packagedetailsScreen.dart';
//
// class BookedMark extends StatefulWidget {
//   @override
//   _BookedMarkState createState() => _BookedMarkState();
// }
//
// class _BookedMarkState extends State<BookedMark> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(
//             Icons.arrow_back,
//             color: Color(0xff004351),
//           ),
//         ),
//         title: Text(
//           "Booked Mark",
//           style: TextStyle(
//               fontSize: 18.sp,
//               fontFamily: "SegoeUI",
//               fontWeight: FontWeight.bold,
//               color: Color(0xff004351)),
//         ),
//         centerTitle: true,
//       ),
//       body: Container(
//         color: Colors.white,
//         child: ListView(
//           children: [
//             Column(
//               children: [
//                 SizedBox(
//                   height: 30.h,
//                 ),
//                 Text(
//                   "Domestic Packages",
//                   style: TextStyle(
//                       fontSize: 18.sp,
//                       fontFamily: "SegoeUI",
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black),
//                 ),
//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 Container(
//                   height: 400.h,
//                   // color: Colors.green,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: [
//                       SizedBox(
//                         width: 10.w,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => PackageDetails()));
//                         },
//                         child: Container(
//                           margin: EdgeInsets.only(
//                               right: 10.w, bottom: 10.h, top: 5.h),
//                           height: 370.h,  // empty
//                           width: 370.w,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10.r),
//                               // border: Border.all(color: Color(0xff707070)),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Colors.grey,
//                                     blurRadius: 3,
//                                     offset: Offset(0, 2))
//                               ]),
//                           child: Column(
//                             children: [
//                               Container(
//                                 margin: EdgeInsets.only(
//                                     top: 10.h, right: 10.w, left: 10.w),
//                                 height: 150.h,
//                                 width: 350.w,
//                                 decoration: BoxDecoration(
//                                     border:
//                                         Border.all(color: Color(0xff707070)),
//                                     borderRadius: BorderRadius.circular(5.r),
//                                     image: DecorationImage(
//                                         fit: BoxFit.fill,
//                                         image:
//                                             AssetImage("assets/CN Tower.png"))),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                     right: 4.w, left: 10.w, top: 10.h),
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       "Starting From",
//                                       style: TextStyle(
//                                           fontSize: 16.sp,
//                                           fontFamily: "SegoeUI",
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.black),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(right: 4.w, left: 10.w),
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       "₹ 1,98,000/- ₹ 2,50,000/-",
//                                       style: TextStyle(
//                                           fontSize: 16.sp,
//                                           fontFamily: "SegoeUI",
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.black),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(right: 10.w, left: 10.w),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       "Per Person on twin sharing",
//                                       style: TextStyle(
//                                           fontSize: 16.sp,
//                                           fontFamily: "SegoeUI",
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.black),
//                                     ),
//                                     Text(
//                                       "Cities: Canada (7D)",
//                                       style: TextStyle(
//                                           fontSize: 16.sp,
//                                           fontFamily: "SegoeUI",
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.grey),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(top: 25.h),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Column(
//                                       children: [
//                                         Icon(
//                                           Icons.home_filled,
//                                           color: Color(0xff004351),
//                                         ),
//                                         Text(
//                                           "Upto 3 Stars",
//                                           style: TextStyle(
//                                               fontSize: 16.sp,
//                                               fontFamily: "SegoeUI",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.grey),
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       children: [
//                                         Icon(
//                                           CupertinoIcons.airplane,
//                                           color: Color(0xff004351),
//                                         ),
//                                         Text(
//                                           "Flights",
//                                           style: TextStyle(
//                                               fontSize: 16.sp,
//                                               fontFamily: "SegoeUI",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.grey),
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       children: [
//                                         Icon(
//                                           CupertinoIcons.building_2_fill,
//                                           color: Color(0xff004351),
//                                         ),
//                                         Text(
//                                           "Meals",
//                                           style: TextStyle(
//                                               fontSize: 16.sp,
//                                               fontFamily: "SegoeUI",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.grey),
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       children: [
//                                         Icon(
//                                           Icons.map,
//                                           color: Color(0xff004351),
//                                         ),
//                                         Text(
//                                           "Sightseeing",
//                                           style: TextStyle(
//                                               fontSize: 16.sp,
//                                               fontFamily: "SegoeUI",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.grey),
//                                         ),
//                                       ],
//                                     ),
//                                     Text(
//                                       "+3",
//                                       style: TextStyle(
//                                           fontSize: 18.sp,
//                                           fontFamily: "SegoeUI",
//                                           fontWeight: FontWeight.bold,
//                                           color: Color(0xffFF0000)),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               InkWell(
//                                 onTap: () {
//                                   //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NavigationBar()));
//                                 },
//                                 child: Container(
//                                   margin: EdgeInsets.only(top: 25.h),
//                                   height: 35.h,
//                                   width: 200.w,
//                                   decoration: BoxDecoration(
//                                     color: Color(0xff09646D),
//                                     borderRadius: BorderRadius.circular(10.r),
//                                     boxShadow: [
//                                       BoxShadow(
//                                           color: Colors.grey,
//                                           blurRadius: 3,
//                                           offset: Offset(1, 2))
//                                     ],
//                                   ),
//                                   child: Center(
//                                     child: Padding(
//                                       padding: EdgeInsets.only(bottom: 2.h),
//                                       child: Text(
//                                         "Customize & Get Quote",
//                                         style: TextStyle(
//                                             fontSize: 16.sp,
//                                             fontFamily: "SegoeUI",
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.white),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => PackageDetails()));
//                         },
//                         child: Container(
//                           margin: EdgeInsets.only(
//                               right: 10.w, bottom: 10.h, top: 4.h),
//                           height: 370.h, // empty
//                           width: 370.w,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10.r),
//                               // border: Border.all(color: Color(0xff707070)),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Colors.grey,
//                                     blurRadius: 3,
//                                     offset: Offset(0, 2))
//                               ]),
//                           child: Column(
//                             children: [
//                               Container(
//                                 margin: EdgeInsets.only(
//                                     top: 10.h, right: 10.w, left: 10.w),
//                                 height: 150.h,
//                                 width: 350.w,
//                                 decoration: BoxDecoration(
//                                     border:
//                                         Border.all(color: Color(0xff707070)),
//                                     borderRadius: BorderRadius.circular(5.r),
//                                     image: DecorationImage(
//                                         fit: BoxFit.fill,
//                                         image: AssetImage(
//                                             "assets/canadaflag.png"))),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                     right: 4.w, left: 10.w, top: 10.h),
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       "Starting From",
//                                       style: TextStyle(
//                                           fontSize: 16.sp,
//                                           fontFamily: "SegoeUI",
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.black),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(right: 4.w, left: 10.w),
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       "₹ 1,98,000/- ₹ 2,50,000/-",
//                                       style: TextStyle(
//                                           fontSize: 16.sp,
//                                           fontFamily: "SegoeUI",
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.black),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(right: 10.w, left: 10.w),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       "Per Person on twin sharing",
//                                       style: TextStyle(
//                                           fontSize: 16.sp,
//                                           fontFamily: "SegoeUI",
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.black),
//                                     ),
//                                     Text(
//                                       "Cities: Canada (7D)",
//                                       style: TextStyle(
//                                           fontSize: 16.sp,
//                                           fontFamily: "SegoeUI",
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.grey),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(top: 25.h),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Column(
//                                       children: [
//                                         Icon(
//                                           Icons.home_filled,
//                                           color: Color(0xff004351),
//                                         ),
//                                         Text(
//                                           "Upto 3 Stars",
//                                           style: TextStyle(
//                                               fontSize: 16.sp,
//                                               fontFamily: "SegoeUI",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.grey),
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       children: [
//                                         Icon(
//                                           CupertinoIcons.airplane,
//                                           color: Color(0xff004351),
//                                         ),
//                                         Text(
//                                           "Flights",
//                                           style: TextStyle(
//                                               fontSize: 16.sp,
//                                               fontFamily: "SegoeUI",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.grey),
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       children: [
//                                         Icon(
//                                           CupertinoIcons.building_2_fill,
//                                           color: Color(0xff004351),
//                                         ),
//                                         Text(
//                                           "Meals",
//                                           style: TextStyle(
//                                               fontSize: 16.sp,
//                                               fontFamily: "SegoeUI",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.grey),
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       children: [
//                                         Icon(
//                                           Icons.map,
//                                           color: Color(0xff004351),
//                                         ),
//                                         Text(
//                                           "Sightseeing",
//                                           style: TextStyle(
//                                               fontSize: 16.sp,
//                                               fontFamily: "SegoeUI",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.grey),
//                                         ),
//                                       ],
//                                     ),
//                                     Text(
//                                       "+3",
//                                       style: TextStyle(
//                                           fontSize: 18.sp,
//                                           fontFamily: "SegoeUI",
//                                           fontWeight: FontWeight.bold,
//                                           color: Color(0xffFF0000)),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               InkWell(
//                                 onTap: () {
//                                   //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NavigationBar()));
//                                 },
//                                 child: Container(
//                                   margin: EdgeInsets.only(top: 25.h),
//                                   height: 35.h,
//                                   width: 200.w,
//                                   decoration: BoxDecoration(
//                                     color: Color(0xff09646D),
//                                     borderRadius: BorderRadius.circular(10.r),
//                                     boxShadow: [
//                                       BoxShadow(
//                                           color: Colors.grey,
//                                           blurRadius: 3,
//                                           offset: Offset(1, 2))
//                                     ],
//                                   ),
//                                   child: Center(
//                                     child: Padding(
//                                       padding: EdgeInsets.only(bottom: 2.h),
//                                       child: Text(
//                                         "Customize & Get Quote",
//                                         style: TextStyle(
//                                             fontSize: 16.sp,
//                                             fontFamily: "SegoeUI",
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.white),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => PackageDetails()));
//                         },
//                         child: Container(
//                           margin: EdgeInsets.only(right: 10.w, bottom: 10.h,top: 4.h),
//                           height: 370.h,
//                           width: 370.w,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10.r),
//                               // border: Border.all(color: Color(0xff707070)),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Colors.grey,
//                                     blurRadius: 3,
//                                     offset: Offset(0, 2))
//                               ]),
//                           child: Column(
//                             children: [
//                               Container(
//                                 margin: EdgeInsets.only(
//                                     top: 10.h, right: 10.w, left: 10.w),
//                                 height: 150.h,
//                                 width: 350.w,
//                                 decoration: BoxDecoration(
//                                     border:
//                                         Border.all(color: Color(0xff707070)),
//                                     borderRadius: BorderRadius.circular(5.r),
//                                     image: DecorationImage(
//                                         fit: BoxFit.fill,
//                                         image:
//                                             AssetImage("assets/toronto.png"))),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                     right: 10.w, left: 10.w, top: 10.h),
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       "Starting From",
//                                       style: TextStyle(
//                                           fontSize: 16.sp,
//                                           fontFamily: "SegoeUI",
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.black),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(right: 4.w, left: 10.w),
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       "₹ 1,98,000/- ₹ 2,50,000/-",
//                                       style: TextStyle(
//                                           fontSize: 16.sp,
//                                           fontFamily: "SegoeUI",
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.black),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(right: 10.w, left: 10.w),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       "Per Person on twin sharing",
//                                       style: TextStyle(
//                                           fontSize: 16.sp,
//                                           fontFamily: "SegoeUI",
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.black),
//                                     ),
//                                     Text(
//                                       "Cities: Canada (7D)",
//                                       style: TextStyle(
//                                           fontSize: 16.sp,
//                                           fontFamily: "SegoeUI",
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.grey),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(top: 25.h),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Column(
//                                       children: [
//                                         Icon(
//                                           Icons.home_filled,
//                                           color: Color(0xff004351),
//                                         ),
//                                         Text(
//                                           "Upto 3 Stars",
//                                           style: TextStyle(
//                                               fontSize: 16.sp,
//                                               fontFamily: "SegoeUI",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.grey),
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       children: [
//                                         Icon(
//                                           CupertinoIcons.airplane,
//                                           color: Color(0xff004351),
//                                         ),
//                                         Text(
//                                           "Flights",
//                                           style: TextStyle(
//                                               fontSize: 16.sp,
//                                               fontFamily: "SegoeUI",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.grey),
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       children: [
//                                         Icon(
//                                           CupertinoIcons.building_2_fill,
//                                           color: Color(0xff004351),
//                                         ),
//                                         Text(
//                                           "Meals",
//                                           style: TextStyle(
//                                               fontSize: 16.sp,
//                                               fontFamily: "SegoeUI",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.grey),
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       children: [
//                                         Icon(
//                                           Icons.map,
//                                           color: Color(0xff004351),
//                                         ),
//                                         Text(
//                                           "Sightseeing",
//                                           style: TextStyle(
//                                               fontSize: 16.sp,
//                                               fontFamily: "SegoeUI",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.grey),
//                                         ),
//                                       ],
//                                     ),
//                                     Text(
//                                       "+3",
//                                       style: TextStyle(
//                                           fontSize: 18.sp,
//                                           fontFamily: "SegoeUI",
//                                           fontWeight: FontWeight.bold,
//                                           color: Color(0xffFF0000)),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               InkWell(
//                                 onTap: () {
//                                   //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NavigationBar()));
//                                 },
//                                 child: Container(
//                                   margin: EdgeInsets.only(top: 25.h),
//                                   height: 35.h,
//                                   width: 200.w,
//                                   decoration: BoxDecoration(
//                                     color: Color(0xff09646D),
//                                     borderRadius: BorderRadius.circular(10.r),
//                                     boxShadow: [
//                                       BoxShadow(
//                                           color: Colors.grey,
//                                           blurRadius: 3,
//                                           offset: Offset(1, 2))
//                                     ],
//                                   ),
//                                   child: Center(
//                                     child: Padding(
//                                       padding: EdgeInsets.only(bottom: 2.h),
//                                       child: Text(
//                                         "Customize & Get Quote",
//                                         style: TextStyle(
//                                             fontSize: 16.sp,
//                                             fontFamily: "SegoeUI",
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.white),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30.h,
//                 ),
//                 Text(
//                   "International Packages",
//                   style: TextStyle(
//                       fontSize: 18.sp,
//                       fontFamily: "SegoeUI",
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black),
//                 ),
//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 Container(
//                   height: 400.h,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: [
//                       SizedBox(
//                         width: 10.w,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => PackageDetails()));
//                         },
//                         child: Container(
//                           margin: EdgeInsets.only(
//                               right: 10.w, bottom: 10.h, top: 5.h),
//                           height: 370.h,  // empty
//                           width: 370.w,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10.r),
//                               // border: Border.all(color: Color(0xff707070)),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Colors.grey,
//                                     blurRadius: 3,
//                                     offset: Offset(0, 2))
//                               ]),
//                           child: Column(
//                             children: [
//                               Container(
//                                 margin: EdgeInsets.only(
//                                     top: 10.h, right: 10.w, left: 10.w),
//                                 height: 150.h,
//                                 width: 350.w,
//                                 decoration: BoxDecoration(
//                                     border:
//                                     Border.all(color: Color(0xff707070)),
//                                     borderRadius: BorderRadius.circular(5.r),
//                                     image: DecorationImage(
//                                         fit: BoxFit.fill,
//                                         image:
//                                         AssetImage("assets/CN Tower.png"))),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                     right: 4.w, left: 10.w, top: 10.h),
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       "Starting From",
//                                       style: TextStyle(
//                                           fontSize: 16.sp,
//                                           fontFamily: "SegoeUI",
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.black),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(right: 4.w, left: 10.w),
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       "₹ 1,98,000/- ₹ 2,50,000/-",
//                                       style: TextStyle(
//                                           fontSize: 16.sp,
//                                           fontFamily: "SegoeUI",
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.black),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(right: 10.w, left: 10.w),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                   MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       "Per Person on twin sharing",
//                                       style: TextStyle(
//                                           fontSize: 16.sp,
//                                           fontFamily: "SegoeUI",
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.black),
//                                     ),
//                                     Text(
//                                       "Cities: Canada (7D)",
//                                       style: TextStyle(
//                                           fontSize: 16.sp,
//                                           fontFamily: "SegoeUI",
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.grey),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(top: 25.h),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                   MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Column(
//                                       children: [
//                                         Icon(
//                                           Icons.home_filled,
//                                           color: Color(0xff004351),
//                                         ),
//                                         Text(
//                                           "Upto 3 Stars",
//                                           style: TextStyle(
//                                               fontSize: 16.sp,
//                                               fontFamily: "SegoeUI",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.grey),
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       children: [
//                                         Icon(
//                                           CupertinoIcons.airplane,
//                                           color: Color(0xff004351),
//                                         ),
//                                         Text(
//                                           "Flights",
//                                           style: TextStyle(
//                                               fontSize: 16.sp,
//                                               fontFamily: "SegoeUI",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.grey),
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       children: [
//                                         Icon(
//                                           CupertinoIcons.building_2_fill,
//                                           color: Color(0xff004351),
//                                         ),
//                                         Text(
//                                           "Meals",
//                                           style: TextStyle(
//                                               fontSize: 16.sp,
//                                               fontFamily: "SegoeUI",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.grey),
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       children: [
//                                         Icon(
//                                           Icons.map,
//                                           color: Color(0xff004351),
//                                         ),
//                                         Text(
//                                           "Sightseeing",
//                                           style: TextStyle(
//                                               fontSize: 16.sp,
//                                               fontFamily: "SegoeUI",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.grey),
//                                         ),
//                                       ],
//                                     ),
//                                     Text(
//                                       "+3",
//                                       style: TextStyle(
//                                           fontSize: 18.sp,
//                                           fontFamily: "SegoeUI",
//                                           fontWeight: FontWeight.bold,
//                                           color: Color(0xffFF0000)),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               InkWell(
//                                 onTap: () {
//                                   //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NavigationBar()));
//                                 },
//                                 child: Container(
//                                   margin: EdgeInsets.only(top: 25.h),
//                                   height: 35.h,
//                                   width: 200.w,
//                                   decoration: BoxDecoration(
//                                     color: Color(0xff09646D),
//                                     borderRadius: BorderRadius.circular(10.r),
//                                     boxShadow: [
//                                       BoxShadow(
//                                           color: Colors.grey,
//                                           blurRadius: 3,
//                                           offset: Offset(1, 2))
//                                     ],
//                                   ),
//                                   child: Center(
//                                     child: Padding(
//                                       padding: EdgeInsets.only(bottom: 2.h),
//                                       child: Text(
//                                         "Customize & Get Quote",
//                                         style: TextStyle(
//                                             fontSize: 16.sp,
//                                             fontFamily: "SegoeUI",
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.white),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => PackageDetails()));
//                         },
//                         child: Container(
//                           margin: EdgeInsets.only(
//                               right: 10.w, bottom: 10.h, top: 4.h),
//                           height: 370.h, // empty
//                           width: 370.w,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10.r),
//                               // border: Border.all(color: Color(0xff707070)),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Colors.grey,
//                                     blurRadius: 3,
//                                     offset: Offset(0, 2))
//                               ]),
//                           child: Column(
//                             children: [
//                               Container(
//                                 margin: EdgeInsets.only(
//                                     top: 10.h, right: 10.w, left: 10.w),
//                                 height: 150.h,
//                                 width: 350.w,
//                                 decoration: BoxDecoration(
//                                     border:
//                                     Border.all(color: Color(0xff707070)),
//                                     borderRadius: BorderRadius.circular(5.r),
//                                     image: DecorationImage(
//                                         fit: BoxFit.fill,
//                                         image: AssetImage(
//                                             "assets/canadaflag.png"))),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                     right: 4.w, left: 10.w, top: 10.h),
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       "Starting From",
//                                       style: TextStyle(
//                                           fontSize: 16.sp,
//                                           fontFamily: "SegoeUI",
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.black),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(right: 4.w, left: 10.w),
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       "₹ 1,98,000/- ₹ 2,50,000/-",
//                                       style: TextStyle(
//                                           fontSize: 16.sp,
//                                           fontFamily: "SegoeUI",
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.black),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(right: 10.w, left: 10.w),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                   MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       "Per Person on twin sharing",
//                                       style: TextStyle(
//                                           fontSize: 16.sp,
//                                           fontFamily: "SegoeUI",
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.black),
//                                     ),
//                                     Text(
//                                       "Cities: Canada (7D)",
//                                       style: TextStyle(
//                                           fontSize: 16.sp,
//                                           fontFamily: "SegoeUI",
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.grey),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(top: 25.h),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                   MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Column(
//                                       children: [
//                                         Icon(
//                                           Icons.home_filled,
//                                           color: Color(0xff004351),
//                                         ),
//                                         Text(
//                                           "Upto 3 Stars",
//                                           style: TextStyle(
//                                               fontSize: 16.sp,
//                                               fontFamily: "SegoeUI",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.grey),
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       children: [
//                                         Icon(
//                                           CupertinoIcons.airplane,
//                                           color: Color(0xff004351),
//                                         ),
//                                         Text(
//                                           "Flights",
//                                           style: TextStyle(
//                                               fontSize: 16.sp,
//                                               fontFamily: "SegoeUI",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.grey),
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       children: [
//                                         Icon(
//                                           CupertinoIcons.building_2_fill,
//                                           color: Color(0xff004351),
//                                         ),
//                                         Text(
//                                           "Meals",
//                                           style: TextStyle(
//                                               fontSize: 16.sp,
//                                               fontFamily: "SegoeUI",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.grey),
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       children: [
//                                         Icon(
//                                           Icons.map,
//                                           color: Color(0xff004351),
//                                         ),
//                                         Text(
//                                           "Sightseeing",
//                                           style: TextStyle(
//                                               fontSize: 16.sp,
//                                               fontFamily: "SegoeUI",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.grey),
//                                         ),
//                                       ],
//                                     ),
//                                     Text(
//                                       "+3",
//                                       style: TextStyle(
//                                           fontSize: 18.sp,
//                                           fontFamily: "SegoeUI",
//                                           fontWeight: FontWeight.bold,
//                                           color: Color(0xffFF0000)),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               InkWell(
//                                 onTap: () {
//                                   //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NavigationBar()));
//                                 },
//                                 child: Container(
//                                   margin: EdgeInsets.only(top: 25.h),
//                                   height: 35.h,
//                                   width: 200.w,
//                                   decoration: BoxDecoration(
//                                     color: Color(0xff09646D),
//                                     borderRadius: BorderRadius.circular(10.r),
//                                     boxShadow: [
//                                       BoxShadow(
//                                           color: Colors.grey,
//                                           blurRadius: 3,
//                                           offset: Offset(1, 2))
//                                     ],
//                                   ),
//                                   child: Center(
//                                     child: Padding(
//                                       padding: EdgeInsets.only(bottom: 2.h),
//                                       child: Text(
//                                         "Customize & Get Quote",
//                                         style: TextStyle(
//                                             fontSize: 16.sp,
//                                             fontFamily: "SegoeUI",
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.white),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => PackageDetails()));
//                         },
//                         child: Container(
//                           margin: EdgeInsets.only(right: 10.w, bottom: 10.h,top: 4.h),
//                           height: 370.h,
//                           width: 370.w,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10.r),
//                               // border: Border.all(color: Color(0xff707070)),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Colors.grey,
//                                     blurRadius: 3,
//                                     offset: Offset(0, 2))
//                               ]),
//                           child: Column(
//                             children: [
//                               Container(
//                                 margin: EdgeInsets.only(
//                                     top: 10.h, right: 10.w, left: 10.w),
//                                 height: 150.h,
//                                 width: 350.w,
//                                 decoration: BoxDecoration(
//                                     border:
//                                     Border.all(color: Color(0xff707070)),
//                                     borderRadius: BorderRadius.circular(5.r),
//                                     image: DecorationImage(
//                                         fit: BoxFit.fill,
//                                         image:
//                                         AssetImage("assets/toronto.png"))),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                     right: 10.w, left: 10.w, top: 10.h),
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       "Starting From",
//                                       style: TextStyle(
//                                           fontSize: 16.sp,
//                                           fontFamily: "SegoeUI",
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.black),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(right: 4.w, left: 10.w),
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       "₹ 1,98,000/- ₹ 2,50,000/-",
//                                       style: TextStyle(
//                                           fontSize: 16.sp,
//                                           fontFamily: "SegoeUI",
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.black),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(right: 10.w, left: 10.w),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                   MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       "Per Person on twin sharing",
//                                       style: TextStyle(
//                                           fontSize: 16.sp,
//                                           fontFamily: "SegoeUI",
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.black),
//                                     ),
//                                     Text(
//                                       "Cities: Canada (7D)",
//                                       style: TextStyle(
//                                           fontSize: 16.sp,
//                                           fontFamily: "SegoeUI",
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.grey),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(top: 25.h),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                   MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Column(
//                                       children: [
//                                         Icon(
//                                           Icons.home_filled,
//                                           color: Color(0xff004351),
//                                         ),
//                                         Text(
//                                           "Upto 3 Stars",
//                                           style: TextStyle(
//                                               fontSize: 16.sp,
//                                               fontFamily: "SegoeUI",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.grey),
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       children: [
//                                         Icon(
//                                           CupertinoIcons.airplane,
//                                           color: Color(0xff004351),
//                                         ),
//                                         Text(
//                                           "Flights",
//                                           style: TextStyle(
//                                               fontSize: 16.sp,
//                                               fontFamily: "SegoeUI",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.grey),
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       children: [
//                                         Icon(
//                                           CupertinoIcons.building_2_fill,
//                                           color: Color(0xff004351),
//                                         ),
//                                         Text(
//                                           "Meals",
//                                           style: TextStyle(
//                                               fontSize: 16.sp,
//                                               fontFamily: "SegoeUI",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.grey),
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       children: [
//                                         Icon(
//                                           Icons.map,
//                                           color: Color(0xff004351),
//                                         ),
//                                         Text(
//                                           "Sightseeing",
//                                           style: TextStyle(
//                                               fontSize: 16.sp,
//                                               fontFamily: "SegoeUI",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.grey),
//                                         ),
//                                       ],
//                                     ),
//                                     Text(
//                                       "+3",
//                                       style: TextStyle(
//                                           fontSize: 18.sp,
//                                           fontFamily: "SegoeUI",
//                                           fontWeight: FontWeight.bold,
//                                           color: Color(0xffFF0000)),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               InkWell(
//                                 onTap: () {
//                                   //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NavigationBar()));
//                                 },
//                                 child: Container(
//                                   margin: EdgeInsets.only(top: 25.h),
//                                   height: 35.h,
//                                   width: 200.w,
//                                   decoration: BoxDecoration(
//                                     color: Color(0xff09646D),
//                                     borderRadius: BorderRadius.circular(10.r),
//                                     boxShadow: [
//                                       BoxShadow(
//                                           color: Colors.grey,
//                                           blurRadius: 3,
//                                           offset: Offset(1, 2))
//                                     ],
//                                   ),
//                                   child: Center(
//                                     child: Padding(
//                                       padding: EdgeInsets.only(bottom: 2.h),
//                                       child: Text(
//                                         "Customize & Get Quote",
//                                         style: TextStyle(
//                                             fontSize: 16.sp,
//                                             fontFamily: "SegoeUI",
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.white),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30.h,
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
