import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:syt/screens/drawerScreen.dart';
import 'package:syt/screens/totaltravellerScreen.dart';
import '../Api.dart';
import '../models/getdestination_catagory_model.dart';

class MyPlaniing extends StatefulWidget {
  @override
  _MyPlaniingState createState() => _MyPlaniingState();
}

class _MyPlaniingState extends State<MyPlaniing> {
  TextEditingController _departure = TextEditingController();
  TextEditingController _destination = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  List checkbox = [true, false, false, false, false, false];
  List category_id = [];
  List<String> category_name = ["622eeffe0eec039c98528632"];
  var height = 49.h;
  var width = 88.w;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        bottomNavigationBar: Container(
          height: 15.h,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            //crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  if (!_formkey.currentState!.validate()) {
                    setState(() {
                      this.height = MediaQuery.of(context).size.height / 10;
                    });

                    return;
                  } else {
                    print("Forward to TotalTraveller");
                    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>TotalTraveller(_departure.text, _destination.text, category_name),
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TotalTraveller(
                          _departure.text, _destination.text, category_name),
                    ));
                  }
                },
                child: Container(
                  height: 30,
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
                    child: Text(
                      "Next",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "SegoeUI",
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        drawer: DrawerScreen(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            },
            icon: Icon(Icons.menu),
            color: Colors.black,
          ),
          title: Text(
            "My Plan",
            style: TextStyle(
                fontSize: 14,
                fontFamily: "SegoeUI",
                fontWeight: FontWeight.bold,
                color: Color(0xff004351)),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<getdestination_catagoty_model>(
          future: Getdestination_catagory().getcategoryList(),
          builder: (context, snapshots) {
            return (snapshots.hasData)
                ? Container(
                    color: Colors.white,
                    child: ListView(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: 2.h, right: 3.w, left: 3.w),
                          child: Column(
                            children: [
                              Container(
                                height: 9.5.h,
                                width: 20.w,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  // fit: BoxFit.cover,
                                  image: AssetImage("assets/navigate.png"),
                                )),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                // height: 50.h,
                                width: 92.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xff1DD9B7),
                                          Color(0xff004148),
                                        ])),
                                child: Form(
                                  key: _formkey,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        right: 25, left: 25, top: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Departure & Destination",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "SegoeUI",
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xffFFFFFF)),
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 11, left: 11),
                                          child: TextFormField(
                                            controller: _departure,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Departure place is Required';
                                              }
                                              return null;
                                            },
                                            onChanged: (value) {
                                              // Call setState to trigger revalidation when the user enters a value
                                              setState(() {});
                                            },
                                            cursorColor: Color(0xff09646D),
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                            decoration: InputDecoration(
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Color(
                                                                0xff09646D),
                                                            width: 1.5)),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.white),
                                                ),
                                                hintText: "Departure",
                                                hintStyle: TextStyle(
                                                    color: Colors.white),
                                                suffixIcon: Image.asset(
                                                  "assets/departure.png",
                                                  scale: 1.8.sign,
                                                )),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 11, left: 11),
                                          child: TextFormField(
                                            controller: _destination,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Destination place is Required';
                                              }
                                              return null;
                                            },
                                            onChanged: (value) {
                                              // Call setState to trigger revalidation when the user enters a value
                                              setState(() {});
                                            },
                                            cursorColor: Color(0xff09646D),
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                            decoration: InputDecoration(
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Color(
                                                                0xff09646D),
                                                            width: 1.5)),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.white),
                                                ),
                                                hintText: "Destination",
                                                hintStyle: TextStyle(
                                                    color: Colors.white),
                                                suffixIcon: Image.asset(
                                                  "assets/destination.png",
                                                  scale: 1.1,
                                                )),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        Text(
                                          "Tour Category",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "SegoeUI",
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xffFFFFFF)),
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Container(
                                          height: 18.h,
                                          width: 80.w,
                                          // color: Colors.red,
                                          child: GridView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                ScrollPhysics(parent: null),
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              childAspectRatio: 3,
                                              crossAxisCount: 2,
                                            ),
                                            itemCount:
                                                snapshots.data?.data?.length,
                                            itemBuilder: (context, index) {
                                              var server =
                                                  snapshots.data!.data![index];
                                              return Row(
                                                children: [
                                                  // Text(snapshots!.data!.data!.length.toString()),
                                                  Container(
                                                    child: Checkbox(
                                                      side: BorderSide(
                                                          color: Colors.white),
                                                      splashRadius: 5,
                                                      value: checkbox[index],
                                                      activeColor:
                                                          Color(0xff0A6A73),
                                                      onChanged: (value) {
                                                        setState(() {
                                                          this.checkbox[index] =
                                                              value!;
                                                        });
                                                        if (checkbox[index] ==
                                                            true) {
                                                          print(
                                                              "check ID ${server.sId}");
                                                          category_name.add(
                                                              server.sId
                                                                  .toString());
                                                        } else {
                                                          print(
                                                              "check else ${server.sId}");
                                                          category_name.remove(
                                                              server.sId
                                                                  .toString());
                                                        }
                                                        print(category_name
                                                            .join(","));
                                                      },
                                                    ),
                                                  ),
                                                  Text(
                                                    //"Honeymoon",
                                                    server.categoryName
                                                        .toString(),
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontFamily: "SegoeUI",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              );
                                              //   Row(
                                              //   children: [
                                              //     Column(
                                              //       crossAxisAlignment:
                                              //           CrossAxisAlignment
                                              //               .start,
                                              //       children: [
                                              //         Row(
                                              //           children: [
                                              //             Container(
                                              //               child:
                                              //                   Checkbox(
                                              //                 side: BorderSide(
                                              //                     color:
                                              //                         Colors.white),
                                              //                 splashRadius:
                                              //                     5.r,
                                              //                 value:
                                              //                     checkbox1,
                                              //                 activeColor:
                                              //                     Color(
                                              //                         0xff0A6A73),
                                              //                 onChanged:
                                              //                     (value) {
                                              //                   setState(
                                              //                       () {
                                              //                     this.checkbox1 =
                                              //                         value!;
                                              //                   });
                                              //                   if (checkbox1 ==
                                              //                       true) {
                                              //                     category_name
                                              //                         .add(server.sId.toString());
                                              //                   } else {
                                              //                     category_name
                                              //                         .remove(server.sId.toString());
                                              //                   }
                                              //                   print(category_name
                                              //                       .join(","));
                                              //                 },
                                              //               ),
                                              //             ),
                                              //             Text(
                                              //               //"Honeymoon",
                                              //               server.categoryName.toString(),
                                              //               style:
                                              //                   TextStyle(
                                              //                 color: Colors
                                              //                     .white,
                                              //                 fontSize:
                                              //                     16.sp,
                                              //                 fontFamily:
                                              //                     "SegoeUI",
                                              //                 fontWeight:
                                              //                     FontWeight
                                              //                         .bold,
                                              //               ),
                                              //             ),
                                              //           ],
                                              //         ),
                                              //         Row(
                                              //           children: [
                                              //             Container(
                                              //               child:
                                              //                   Checkbox(
                                              //                 side: BorderSide(
                                              //                     color:
                                              //                         Colors.white),
                                              //                 splashRadius:
                                              //                     5.r,
                                              //                 value:
                                              //                     checkbox2,
                                              //                 activeColor:
                                              //                     Color(
                                              //                         0xff0A6A73),
                                              //                 onChanged:
                                              //                     (value) {
                                              //                   setState(
                                              //                       () {
                                              //                     this.checkbox2 =
                                              //                         value!;
                                              //                   });
                                              //                   if (checkbox2 ==
                                              //                       true) {
                                              //                     category_name
                                              //                         .add(server.sId.toString());
                                              //                   } else {
                                              //                     category_name
                                              //                         .remove(server.sId.toString());
                                              //                   }
                                              //
                                              //                   print(category_name
                                              //                       .join(","));
                                              //                 },
                                              //               ),
                                              //             ),
                                              //             Text(
                                              //               "Nature",
                                              //               style:
                                              //                   TextStyle(
                                              //                 color: Colors
                                              //                     .white,
                                              //                 fontSize:
                                              //                     16.sp,
                                              //                 fontFamily:
                                              //                     "SegoeUI",
                                              //                 fontWeight:
                                              //                     FontWeight
                                              //                         .bold,
                                              //               ),
                                              //             ),
                                              //           ],
                                              //         ),
                                              //         Row(
                                              //           children: [
                                              //             Container(
                                              //               child:
                                              //                   Checkbox(
                                              //                 side: BorderSide(
                                              //                     color:
                                              //                         Colors.white),
                                              //                 splashRadius:
                                              //                     5.r,
                                              //                 value:
                                              //                     checkbox5,
                                              //                 activeColor:
                                              //                     Color(
                                              //                         0xff0A6A73),
                                              //                 onChanged:
                                              //                     (value) {
                                              //                   setState(
                                              //                       () {
                                              //                     this.checkbox5 =
                                              //                         value!;
                                              //                   });
                                              //                   if (checkbox5 ==
                                              //                       true) {
                                              //                     category_name
                                              //                         .add("Pilgrimage");
                                              //                   } else {
                                              //                     category_name
                                              //                         .remove("Pilgrimage");
                                              //                   }
                                              //
                                              //                   print(category_name
                                              //                       .join(","));
                                              //                 },
                                              //               ),
                                              //             ),
                                              //             Text(
                                              //               "Pilgrimage",
                                              //               style:
                                              //                   TextStyle(
                                              //                 color: Colors
                                              //                     .white,
                                              //                 fontSize:
                                              //                     16.sp,
                                              //                 fontFamily:
                                              //                     "SegoeUI",
                                              //                 fontWeight:
                                              //                     FontWeight
                                              //                         .bold,
                                              //               ),
                                              //             ),
                                              //           ],
                                              //         ),
                                              //       ],
                                              //     ),
                                              //     SizedBox(
                                              //       width: 20.w,
                                              //     ),
                                              //     Column(
                                              //       crossAxisAlignment:
                                              //           CrossAxisAlignment
                                              //               .start,
                                              //       children: [
                                              //         Row(
                                              //           children: [
                                              //             Container(
                                              //               child:
                                              //                   Checkbox(
                                              //                 side: BorderSide(
                                              //                     color:
                                              //                         Colors.white),
                                              //                 splashRadius:
                                              //                     5.r,
                                              //                 value:
                                              //                     checkbox3,
                                              //                 activeColor:
                                              //                     Color(
                                              //                         0xff0A6A73),
                                              //                 onChanged:
                                              //                     (value) {
                                              //                   setState(
                                              //                       () {
                                              //                     this.checkbox3 =
                                              //                         value!;
                                              //                   });
                                              //                   if (checkbox3 ==
                                              //                       true) {
                                              //                     category_name
                                              //                         .add("Adventure");
                                              //                   } else {
                                              //                     category_name
                                              //                         .remove("Adventure");
                                              //                   }
                                              //
                                              //                   print(category_name
                                              //                       .join(","));
                                              //                 },
                                              //               ),
                                              //             ),
                                              //             Text(
                                              //               "Adventure",
                                              //               style:
                                              //                   TextStyle(
                                              //                 color: Colors
                                              //                     .white,
                                              //                 fontSize:
                                              //                     16.sp,
                                              //                 fontFamily:
                                              //                     "SegoeUI",
                                              //                 fontWeight:
                                              //                     FontWeight
                                              //                         .bold,
                                              //               ),
                                              //             ),
                                              //           ],
                                              //         ),
                                              //         Row(
                                              //           children: [
                                              //             Container(
                                              //               child:
                                              //                   Checkbox(
                                              //                 side: BorderSide(
                                              //                     color:
                                              //                         Colors.white),
                                              //                 splashRadius:
                                              //                     5.r,
                                              //                 value:
                                              //                     checkbox4,
                                              //                 activeColor:
                                              //                     Color(
                                              //                         0xff0A6A73),
                                              //                 onChanged:
                                              //                     (value) {
                                              //                   setState(
                                              //                       () {
                                              //                     this.checkbox4 =
                                              //                         value!;
                                              //                   });
                                              //                   if (checkbox4 ==
                                              //                       true) {
                                              //                     category_name
                                              //                         .add("Wildlife");
                                              //                   } else {
                                              //                     category_name
                                              //                         .remove("Wildlife");
                                              //                   }
                                              //
                                              //                   print(category_name
                                              //                       .join(","));
                                              //                 },
                                              //               ),
                                              //             ),
                                              //             Text(
                                              //               "Wildlife",
                                              //               style:
                                              //                   TextStyle(
                                              //                 color: Colors
                                              //                     .white,
                                              //                 fontSize:
                                              //                     16.sp,
                                              //                 fontFamily:
                                              //                     "SegoeUI",
                                              //                 fontWeight:
                                              //                     FontWeight
                                              //                         .bold,
                                              //               ),
                                              //             ),
                                              //           ],
                                              //         ),
                                              //         Row(
                                              //           children: [
                                              //             Container(
                                              //               child:
                                              //                   Checkbox(
                                              //                 side: BorderSide(
                                              //                     color:
                                              //                         Colors.white),
                                              //                 splashRadius:
                                              //                     5.r,
                                              //                 value:
                                              //                     checkbox6,
                                              //                 activeColor:
                                              //                     Color(
                                              //                         0xff0A6A73),
                                              //                 onChanged:
                                              //                     (value) {
                                              //                   setState(
                                              //                       () {
                                              //                     this.checkbox6 =
                                              //                         value!;
                                              //                   });
                                              //                   if (checkbox6 ==
                                              //                       true) {
                                              //                     category_name
                                              //                         .add("Historical");
                                              //                   } else {
                                              //                     category_name
                                              //                         .remove("Historical");
                                              //                   }
                                              //                   print(category_name
                                              //                       .join(","));
                                              //                 },
                                              //               ),
                                              //             ),
                                              //             Text(
                                              //               "Historical",
                                              //               style:
                                              //                   TextStyle(
                                              //                 color: Colors
                                              //                     .white,
                                              //                 fontSize:
                                              //                     16.sp,
                                              //                 fontFamily:
                                              //                     "SegoeUI",
                                              //                 fontWeight:
                                              //                     FontWeight
                                              //                         .bold,
                                              //               ),
                                              //             ),
                                              //           ],
                                              //         ),
                                              //       ],
                                              //     ),
                                              //   ],
                                              // );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : Center(child: CircularProgressIndicator());
          },
        ));
  }
}
