// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sizer/sizer.dart';
// import 'package:syt/Api.dart';
// import 'package:syt/models/getdestination_list_model.dart';
// import 'package:syt/screens/budget(Per%20Head)Screen.dart';
// import 'package:syt/screens/packagesScreen.dart';

// class HoneymoonDestinations extends StatefulWidget {
//   @override
//   _HoneymoonDestinationsState createState() => _HoneymoonDestinationsState();
// }

// class _HoneymoonDestinationsState extends State<HoneymoonDestinations> {
//   final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

//   var cat_id = "";
//   var cat_name = "";
//   var receveRadiovalues1 = "";
//   var receveRadiovalues2 = "";
//   var receveRadiovalues3 = "";
//   var receveRadiovalues4 = "";
//   var RangeValues = "";
//   var RangeValues1 = "";
//   @override
//   void initState() {
//     super.initState();
//     loaddata();
//   }

//   void loaddata() async {
//     final SharedPreferences prefs = await _prefs;
//     setState(() {
//       cat_id = (prefs.getString("cat_id"))!;
//       cat_name = (prefs.getString("cat_name"))!;
//       receveRadiovalues1 = prefs.getString("radiogroup1")!;
//       receveRadiovalues2 = (prefs.getString("radiogroup2"))!;
//       receveRadiovalues3 = (prefs.getString("radiogroup3"))!;
//       receveRadiovalues4 = (prefs.getString("radiogroup4"))!;
//       RangeValues1 = (prefs.getString("RangeValues1"))!;
//       RangeValues = (prefs.getString("RangeValues"))!;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     print(cat_id);
//     print(receveRadiovalues1);
//     print(receveRadiovalues4);
//     print(receveRadiovalues3);
//     print(receveRadiovalues2);
//     print(RangeValues1);
//     print(RangeValues);
//     return Scaffold(
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             print("forward to class BudgetPerHead");
//             Navigator.of(context)
//                 .push(MaterialPageRoute(builder: (context) => BudgetPerHead()));
//           },
//           backgroundColor: Color(0xffFF4C04),
//           child: Icon(
//             Icons.filter_list_alt,
//             color: Colors.white,
//           ),
//         ),
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(
//               Icons.arrow_back,
//               color: Color(0xff004351),
//             ),
//           ),
//           title: Text(
//             cat_name,
//             style: TextStyle(
//                 fontSize: 14,
//                 fontFamily: "SegoeUI",
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xff004351)),
//           ),
//           centerTitle: true,
//         ),
//         body: Container(
//             color: Colors.white,
//             child: FutureBuilder<getdestination_list_model>(
//                 future: Getdestination_List().dataList(cat_id),
//                 builder: (context, snapshots) {
//                   return (snapshots.hasData)
//                       ? ListView.builder(
//                           itemCount: snapshots.data!.data?.length,
//                           itemBuilder: (context, index) {
//                             var server = snapshots.data!.data![index];
//                             return Column(
//                               children: [
//                                 SizedBox(height: 2.h),
//                                 InkWell(
//                                   onTap: () async {
//                                     var destination_id = server.sId.toString();
//                                     var destination_name =
//                                         server.destinationName.toString();
//                                     var destination_package =
//                                         server.package.toString();
//                                     var destination_placeToVisit =
//                                         server.placeToVisit.toString();

//                                     final SharedPreferences prefs =
//                                         await _prefs;

//                                     prefs.setString(
//                                         "destination_id", destination_id);
//                                     prefs.setString(
//                                         "destination_name", destination_name);
//                                     prefs.setString("destination_package",
//                                         destination_package);
//                                     prefs.setString("destination_placeToVisit",
//                                         destination_placeToVisit);

//                                     Navigator.of(context).push(
//                                         MaterialPageRoute(
//                                             builder: (context) =>
//                                                 PackagesScreen()));
//                                   },
//                                   child: Stack(
//                                     children: [
//                                       Container(
//                                         width: 97.w,
//                                         height: 18.h,
//                                         decoration: BoxDecoration(
//                                           boxShadow: [
//                                             BoxShadow(
//                                                 color: Colors.grey,
//                                                 blurRadius: 3,
//                                                 offset: Offset(1, 2))
//                                           ],
//                                           color: Color(0xffF7F7F7),
//                                           borderRadius:
//                                               BorderRadius.circular(15),
//                                         ),
//                                       ),
//                                       ClipRRect(
//                                         borderRadius: BorderRadius.circular(15),
//                                         child: CachedNetworkImage(
//                                           width: 90.w,
//                                           height: 18.h,
//                                           errorWidget: (context, url, error) =>
//                                               Text(""),
//                                           imageUrl:
//                                               server.placeToVisit.toString(),
//                                           fit: BoxFit.cover,
//                                         ),
//                                       ),
//                                       Positioned(
//                                         top: 4,
//                                         left: 15,
//                                         child: Text(
//                                           //"MALDIVES",
//                                           server.destinationName.toString(),
//                                           //server.howToReach.toString(),
//                                           style: TextStyle(
//                                               fontSize: 14,
//                                               fontFamily: "SegoeUI",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.black),
//                                         ),
//                                       ),
//                                       Positioned(
//                                         top: 18,
//                                         left: 90.w,
//                                         child: RotatedBox(
//                                           quarterTurns: 3,
//                                           child: Text(
//                                             //"35,000/Person",
//                                             "₹ " +
//                                                 server.package.toString() +
//                                                 "/Person",
//                                             style: TextStyle(
//                                                 fontSize: 12,
//                                                 fontFamily: "SegoeUI",
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Color(0xffFF7307)),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 1.h,
//                                 ),
//                               ],
//                             );
//                           })
//                       : Center(child: CircularProgressIndicator());
//                 })));
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:syt/Api.dart';
import 'package:syt/models/get_destinationdata_model.dart';
import 'package:syt/models/getdestination_list_model.dart';
import 'package:syt/screens/budget(Per%20Head)Screen.dart';
import 'package:syt/screens/packagesScreen.dart';

import 'homeScreen.dart';

class HoneymoonDestinations extends StatefulWidget {
  @override
  _HoneymoonDestinationsState createState() => _HoneymoonDestinationsState();
}

class _HoneymoonDestinationsState extends State<HoneymoonDestinations> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  var cat_id = "";
  var cat_name = "";
  var receveRadiovalues1 = "";
  var receveRadiovalues3 = "";
  var receveRadiovalues4 = "";
  // var dropdownvalue = "";

  //var RangeValues = "";
  // var RangeValues1 = "";
  bool priceLowToHigh = false;

  @override
  void initState() {
    super.initState();
    loaddata();
  }

  void loaddata() async {
    final SharedPreferences prefs = await _prefs;

    setState(() {
      cat_id = (prefs.getString("cat_id"))!;
      cat_name = (prefs.getString("cat_name"))!;
      receveRadiovalues1 = prefs.getString("radiogroup1") ?? "";
      receveRadiovalues3 = (prefs.getString("radiogroup3") ?? "");

      receveRadiovalues4 = (prefs.getString("radiogroup4") ?? "");
      // dropdownvalue = (prefs.getString("dropdownvalue"))!;
      //  RangeValues1 = (prefs.getString("RangeValues1"))!;
      //  RangeValues = (prefs.getString("RangeValues"))!;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(cat_id);

    print("receveRadiovalues1 : " + receveRadiovalues1);
    print("receveRadiovalues4 : " + receveRadiovalues4);
    print("receveRadiovalues3 : " + receveRadiovalues3);
    // print("check ${dropdownvalue}");

    //  print(RangeValues1);
    // print(RangeValues);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("forward to class BudgetPerHead");
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => BudgetPerHead()));
          },
          backgroundColor: Color(0xffFF4C04),
          child: Icon(
            Icons.filter_list_alt,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
            },
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xff004351),
            ),
          ),
          title: Text(
            cat_name,
            style: TextStyle(
                fontSize: 14,
                fontFamily: "SegoeUI",
                fontWeight: FontWeight.bold,
                color: Color(0xff004351)),
          ),
          centerTitle: true,
        ),
        body: Container(
            color: Colors.white,
            child: FutureBuilder<getdestination_list_model>(
                future: Getdestination_List().dataList(cat_id),
                builder: (context, snapshots) {
                  //low to high and high to low data by rahul

                  // if (receveRadiovalues4 == "1") {
                  //   snapshots.data!.data!.sort((a, b) =>
                  //       int.parse(a.package.toString())
                  //           .compareTo(int.parse(b.package.toString())));
                  //   print("price low to high");
                  // } else if (receveRadiovalues4 == "2") {
                  //   print("Condition high to low ");
                  //   snapshots.data!.data!.sort((a, b) =>
                  //       int.parse(b.package.toString())
                  //           .compareTo(int.parse(a.package.toString())));
                  // }

                  //  if (receveRadiovalues1 == "1" || receveRadiovalues1 == "2") {
                  //   print("India or Abroad");
                  // } else {
                  //   print("India condition not working");
                  // }

                  // if (dropdownvalue == "January" ||
                  //     dropdownvalue == "February" ||
                  //     dropdownvalue == "March" ||
                  //     dropdownvalue == "April") {
                  //   print("First quarter");
                  // } else if (dropdownvalue == "May" ||
                  //     dropdownvalue == "June" ||
                  //     dropdownvalue == "July" ||
                  //     dropdownvalue == "August") {
                  //   print("Second quarter");
                  // } else if (dropdownvalue == "September" ||
                  //     dropdownvalue == "October" ||
                  //     dropdownvalue == "November" ||
                  //     dropdownvalue == "December") {
                  //   print("third quarter");
                  // } else {
                  //   print("No months quarter selected");
                  // }

                  return (snapshots.hasData)
                      ? ListView.builder(
                          itemCount: snapshots.data!.data?.length,
                          itemBuilder: (context, index) {
                            var server = snapshots.data!.data![index];

                            // if (receveRadiovalues3 == "10000" &&
                            //     server.package! <= 10000)

                            if (receveRadiovalues3 == "") {
                              print("null :" + receveRadiovalues3);

                              print(server.package);
                              return Column(
                                children: [
                                  SizedBox(height: 2.h),
                                  InkWell(
                                    onTap: () async {
                                      var destination_id =
                                          server.sId.toString();
                                      var destination_name =
                                          server.destinationName.toString();
                                      var destination_package =
                                          server.package.toString();
                                      var destination_placeToVisit =
                                          server.placeToVisit.toString();

                                      final SharedPreferences prefs =
                                          await _prefs;

                                      prefs.setString(
                                          "destination_id", destination_id);
                                      prefs.setString(
                                          "destination_name", destination_name);
                                      prefs.setString("destination_package",
                                          destination_package);
                                      prefs.setString(
                                          "destination_placeToVisit",
                                          destination_placeToVisit);

                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PackagesScreen()));
                                    },
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: 97.w,
                                          height: 18.h,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 3,
                                                  offset: Offset(1, 2))
                                            ],
                                            color: Color(0xffF7F7F7),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: CachedNetworkImage(
                                            width: 90.w,
                                            height: 18.h,
                                            errorWidget:
                                                (context, url, error) =>
                                                    Text(""),
                                            imageUrl:
                                                server.placeToVisit.toString(),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          top: 4,
                                          left: 15,
                                          child: Text(
                                            //"MALDIVES",
                                            server.destinationName.toString(),
                                            //server.howToReach.toString(),
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: "SegoeUI",
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ),
                                        Positioned(
                                          top: 18,
                                          left: 90.w,
                                          child: RotatedBox(
                                            quarterTurns: 3,
                                            child: Text(
                                              //"35,000/Person",
                                              "₹ " +
                                                  server.package.toString() +
                                                  "/Person",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: "SegoeUI",
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xffFF7307)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                ],
                              );
                            } else if (receveRadiovalues3 == "10000") {
                              if (server.package! <= 10000) {
                                // print("price : " + server.package.toString());S
                                //  print("10000:" + receveRadiovalues3);

                                print(server.package.toString() +
                                    "<=" +
                                    receveRadiovalues3);

                                return Column(
                                  children: [
                                    SizedBox(height: 2.h),
                                    InkWell(
                                      onTap: () async {
                                        var destination_id =
                                            server.sId.toString();
                                        var destination_name =
                                            server.destinationName.toString();
                                        var destination_package =
                                            server.package.toString();
                                        var destination_placeToVisit =
                                            server.placeToVisit.toString();

                                        final SharedPreferences prefs =
                                            await _prefs;

                                        prefs.setString(
                                            "destination_id", destination_id);
                                        prefs.setString("destination_name",
                                            destination_name);
                                        prefs.setString("destination_package",
                                            destination_package);
                                        prefs.setString(
                                            "destination_placeToVisit",
                                            destination_placeToVisit);

                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PackagesScreen()));
                                      },
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: 97.w,
                                            height: 18.h,
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey,
                                                    blurRadius: 3,
                                                    offset: Offset(1, 2))
                                              ],
                                              color: Color(0xffF7F7F7),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: CachedNetworkImage(
                                              width: 90.w,
                                              height: 18.h,
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Text(""),
                                              imageUrl: server.placeToVisit
                                                  .toString(),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Positioned(
                                            top: 4,
                                            left: 15,
                                            child: Text(
                                              //"MALDIVES",
                                              server.destinationName.toString(),
                                              //server.howToReach.toString(),
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: "SegoeUI",
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          Positioned(
                                            top: 18,
                                            left: 90.w,
                                            child: RotatedBox(
                                              quarterTurns: 3,
                                              child: Text(
                                                //"35,000/Person",
                                                "₹ " +
                                                    server.package.toString() +
                                                    "/Person",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: "SegoeUI",
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xffFF7307)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                  ],
                                );
                              }
                            } else if (receveRadiovalues3.toString() ==
                                "80000") {
                              print("ok ok ok ok ");
                              print(server.package);

                              if (server.package! >= 40000) {
                                print("price : " + server.package.toString());
                                //print("10000:" + receveRadiovalues3);

                                // print(server.package.toString() +
                                //     "<=" +
                                //     receveRadiovalues3);

                                return Column(
                                  children: [
                                    SizedBox(height: 2.h),
                                    InkWell(
                                      onTap: () async {
                                        var destination_id =
                                            server.sId.toString();
                                        var destination_name =
                                            server.destinationName.toString();
                                        var destination_package =
                                            server.package.toString();
                                        var destination_placeToVisit =
                                            server.placeToVisit.toString();

                                        final SharedPreferences prefs =
                                            await _prefs;

                                        prefs.setString(
                                            "destination_id", destination_id);
                                        prefs.setString("destination_name",
                                            destination_name);
                                        prefs.setString("destination_package",
                                            destination_package);
                                        prefs.setString(
                                            "destination_placeToVisit",
                                            destination_placeToVisit);

                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PackagesScreen()));
                                      },
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: 97.w,
                                            height: 18.h,
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey,
                                                    blurRadius: 3,
                                                    offset: Offset(1, 2))
                                              ],
                                              color: Color(0xffF7F7F7),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: CachedNetworkImage(
                                              width: 90.w,
                                              height: 18.h,
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Text(""),
                                              imageUrl: server.placeToVisit
                                                  .toString(),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Positioned(
                                            top: 4,
                                            left: 15,
                                            child: Text(
                                              //"MALDIVES",
                                              server.destinationName.toString(),
                                              //server.howToReach.toString(),
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: "SegoeUI",
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          Positioned(
                                            top: 18,
                                            left: 90.w,
                                            child: RotatedBox(
                                              quarterTurns: 3,
                                              child: Text(
                                                //"35,000/Person",
                                                "₹ " +
                                                    server.package.toString() +
                                                    "/Person",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: "SegoeUI",
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xffFF7307)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                  ],
                                );
                              } else {
                                print("not ok ");
                              }
                            } else {
                              print("data not match... ");
                            } //item count vali ilne
                          })
                      : Center(child: CircularProgressIndicator());
                })));
  }
}
