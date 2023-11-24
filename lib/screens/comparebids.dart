import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../Api.dart';
import '../models/bidpakege_comper_model.dart';

class CompareBids extends StatefulWidget {
  String fristid,
      fristagency,
      fristdate,
      fristprice,
      secondid,
      secondagency,
      seconddate,
      secondprice;

  // therddid,therdprice,therdagency,therddate;

  CompareBids(this.fristid, this.fristagency, this.fristdate, this.fristprice,
      this.secondid, this.secondagency, this.seconddate, this.secondprice,
      {Key? key})
      : super(key: key);

  // CompareBids(String fristid, String fristagency, String fristdate, String fristprice, String secondid, String secondagency, String seconddate, String secondprice, );

  @override
  _CompareBidsState createState() => _CompareBidsState();
}

class _CompareBidsState extends State<CompareBids>
    with SingleTickerProviderStateMixin {
  // int len= 0;

  List itenaries = [];

  int? len;

  //
  Future<bid_pakege_comper_model>? _future;
  int _tabLength = 0;
  int _dataLength = 0;

  //
  late TabController _tabController = TabController(
    length: len.toString().length,
    vsync: this,
  );

  // late TabController _ttabConroller ;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    // _ttabConroller = TabController(length: 3, vsync: this);
    _future = Comper_bidpakege()
        .Comperbidpakegeslist(widget.fristid, widget.secondid);
    _future!.then((value) {
      print("pppppppppppppppppppp : ${value.data!.length}");
      var server0Len = value.data![0].itineries!.length;
      var server1Len = value.data![1].itineries!.length;
      print(server0Len);
      print(server1Len);

      if (server0Len.toInt() > server1Len.toInt()) {
        checkAndUpdateTabLength(server0Len.toInt());
      } else {
        checkAndUpdateTabLength(server1Len.toInt());
      }
      //
      // print("data length ${value!.length}");
      WidgetsBinding.instance.addPostFrameCallback((_) {
        print("other job");
        setState(() {
          // _dataLength = value.length;
        });
      });
    });
  }

  void checkAndUpdateTabLength(newLength) {
    print("checkAndUpdateTabLength");
    print("tab......" + newLength.toString());
    print(_tabLength);
    setState(() {
      _tabLength = newLength;
      _tabController = TabController(
        vsync: this,
        length: newLength,
      );
    });
  }

  // void didUpdateWidget(covariant Widget oldWidget) {
  //   //super.didUpdateWidget(oldWidget);
  //   if (len!.toInt().toString().length != _tabController.length) {
  //     final oldIndex = _tabController.index;
  //     _tabController.dispose();
  //     _tabController = TabController(
  //       length: len!.toInt().toString().length,
  //       inialIndex: max(0, min(oldIndex,len!.toInt().toString().length - 1)),
  //       vsync: this,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // print(len!.toInt().toString().length);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            // unselectedLabelColor: (Colors.grey),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(
                7.0,
              ),
              color: Color(0xff09646D),
            ),
            // labelColor: Colors.grey.shade900,
            unselectedLabelColor: Colors.black,
            unselectedLabelStyle: TextStyle(
              color: Colors.grey,
            ),
            indicatorPadding: EdgeInsets.symmetric(horizontal: 2.w),
            // controller: _ttabConroller,
            indicatorColor: Color(0xff004351),
            tabs: [
              customTab(text: "Overview", index: 0, currentIndex: 0),
              customTab(text: "Services", index: 1, currentIndex: 0),
              customTab(text: "Itinerary", index: 2, currentIndex: 0),
              // Text("Overview",
              //     style: TextStyle(
              //       fontSize: 14.sp,
              //       fontFamily: "SegoeUI",
              //       fontWeight: FontWeight.bold,
              //       color: Color(0xff004351),
              //     )),
              // Text(
              //   "Services",
              //   style: TextStyle(
              //     fontSize: 14.sp,
              //     fontFamily: "SegoeUI",
              //     fontWeight: FontWeight.bold,
              //     color: Color(0xff004351),
              //   ),
              // ),
              // Text(
              //   "Itinerary",
              //   style: TextStyle(
              //       fontSize: 14.sp,
              //       fontFamily: "SegoeUI",
              //       fontWeight: FontWeight.bold,
              //       color: Color(0xff004351)),
              // )
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xff004351),
            ),
          ),
          title: Text(
            "Compare Packages",
            style: TextStyle(
                fontSize: 14,
                fontFamily: "SegoeUI",
                fontWeight: FontWeight.bold,
                color: Color(0xff004351)),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<bid_pakege_comper_model>(
          future: _future,
          builder: (context, snapshots) {
            print(widget.fristid + "Ankit FastID");
            print(widget.secondid + "Ankit SecondID");
            print(snapshots.data!.data!.length);

            if (snapshots.hasData) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshots.data?.data?.length,
                itemBuilder: (context, index) {
                  var server = snapshots.data!.data![0];
                  var server1 = snapshots.data!.data![1];

                  // print(snapshots.data!.data!.length);
                  // len = snapshots.data!.data![index].itineries?.length;

                  // print(len.toString() +
                  //     ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
                  print('55555555555555555555');
                  print(_tabLength.toString());

                  //  len = server1.itineries!.length;

                  print(index.toString() + "❤️❤️❤️❤️❤️❤️👋👋👋👋👋👋👋👋");
                  return Container(
                    height: 80.h,
                    child: TabBarView(
                      children: [
                        /// [overview tab]
                        Container(
                          color: Colors.white,
                          child: ListView(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            /// [agency 01]
                                            Expanded(
                                              child: Container(
                                                // padding: EdgeInsets.only(left: 5),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    /// [first agency]
                                                    Align(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                boxShadow: [
                                                              BoxShadow(
                                                                color:
                                                                    Colors.grey,
                                                                offset: Offset(
                                                                    0.2, 0.8),
                                                                blurRadius: 2,
                                                              )
                                                            ]),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(5),
                                                          child: Text(
                                                            //"NR Travels",
                                                            widget.fristagency,
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    "SegoeUI",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 2.h,
                                                    ),

                                                    /// [1. reviews stars]

                                                    /// [1. total reviews]
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 1.h),
                                                      width: 40.w,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color:
                                                                  Colors.grey,
                                                              offset: Offset(
                                                                  0.2, 0.8),
                                                              blurRadius: 2,
                                                            )
                                                          ]),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(5),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Icon(
                                                                  Icons.star,
                                                                  color: Color(
                                                                      0xff025B72),
                                                                  size: 14,
                                                                ),
                                                                Icon(
                                                                  Icons.star,
                                                                  color: Color(
                                                                      0xff025B72),
                                                                  size: 14,
                                                                ),
                                                                Icon(
                                                                  Icons.star,
                                                                  color: Color(
                                                                      0xff025B72),
                                                                  size: 14,
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .star_border,
                                                                  color: Color(
                                                                      0xff025B72),
                                                                  size: 14,
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .star_border,
                                                                  color: Color(
                                                                      0xff025B72),
                                                                  size: 14,
                                                                ),
                                                              ],
                                                            ),
                                                            Text(
                                                              "Total Reviews: 12",
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontFamily:
                                                                      "SegoeUI",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            Text(
                                                              //"Price: ₹ 22,000",
                                                              widget.fristprice,
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontFamily:
                                                                      "SegoeUI",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),

                                                    /// [1. price]

                                                    SizedBox(
                                                      height: 3.h,
                                                    ),

                                                    /// [1. category]
                                                    // Text(
                                                    //   "Categories",
                                                    //   style: TextStyle(
                                                    //       fontSize: 18.sp,
                                                    //       fontFamily: "SegoeUI",
                                                    //       fontWeight:
                                                    //           FontWeight.bold,
                                                    //       color: Colors.black),
                                                    // ),
                                                    // Text(
                                                    //   //"Historical",
                                                    //
                                                    //   server.destinationCategory
                                                    //       .toString(),
                                                    //   // snapshots.data!.data![0].destinationCategory.toString(),
                                                    //   style: TextStyle(
                                                    //       fontSize: 16.sp,
                                                    //       fontFamily: "SegoeUI",
                                                    //       fontWeight:
                                                    //           FontWeight.bold,
                                                    //       color: Colors.black),
                                                    // ),
                                                    // SizedBox(
                                                    //   height: 40.h,
                                                    // ),
                                                    /// [1. meals]

                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 1.h),
                                                      width: 40.w,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color:
                                                                  Colors.grey,
                                                              offset: Offset(
                                                                  0.2, 0.8),
                                                              blurRadius: 2,
                                                            )
                                                          ]),
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            "Meals",
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    "SegoeUI",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                          Text(
                                                            //"Breakfast, Lunch, Dinner",
                                                            server.mealRequired
                                                                .toString(),
                                                            //snapshots.data!.data![0].mealRequired.toString(),
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontFamily:
                                                                    "SegoeUI",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                                    SizedBox(
                                                      height: 3.h,
                                                    ),

                                                    /// [1.cab]
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 1.h),
                                                      width: 40.w,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color:
                                                                  Colors.grey,
                                                              offset: Offset(
                                                                  0.2, 0.8),
                                                              blurRadius: 2,
                                                            )
                                                          ]),
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            "Cab",
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    "SegoeUI",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                          Text(
                                                            "Exclude",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontFamily:
                                                                    "SegoeUI",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                                    SizedBox(
                                                      height: 3.h,
                                                    ),

                                                    /// [1.sightseeing]
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 1.h),
                                                      width: 40.w,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color:
                                                                  Colors.grey,
                                                              offset: Offset(
                                                                  0.2, 0.8),
                                                              blurRadius: 2,
                                                            )
                                                          ]),
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            "Sightseeing",
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    "SegoeUI",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                          Text(
                                                            //"Exclude",
                                                            server.sightseeing
                                                                .toString(),
                                                            // snapshots.data!.data![0].sightseeing.toString(),
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontFamily:
                                                                    "SegoeUI",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                                    SizedBox(
                                                      height: 3.h,
                                                    ),

                                                    /// [1.flight]
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 1.h),
                                                      width: 40.w,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color:
                                                                  Colors.grey,
                                                              offset: Offset(
                                                                  0.2, 0.8),
                                                              blurRadius: 2,
                                                            )
                                                          ]),
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            "Flight",
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    "SegoeUI",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                          Text(
                                                            "Include",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontFamily:
                                                                    "SegoeUI",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                                    SizedBox(
                                                      height: 3.h,
                                                    ),

                                                    /// [1.Duration]
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 1.h),
                                                      width: 40.w,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color:
                                                                  Colors.grey,
                                                              offset: Offset(
                                                                  0.2, 0.8),
                                                              blurRadius: 2,
                                                            )
                                                          ]),
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            "Duration",
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    "SegoeUI",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                          Text(
                                                            //"20/7/2021 to 27/7/2021",
                                                            "${server.startDate1.toString()}${' to'}",
                                                            //"${snapshots.data!.data![0].startDate1.toString()} ${"to"} ${snapshots.data!.data![0].endDate1.toString()}",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontFamily:
                                                                    "SegoeUI",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                          Text(
                                                            //"20/7/2021 to 27/7/2021",
                                                            "${server.endDate1.toString()}",
                                                            //"${snapshots.data!.data![0].startDate1.toString()} ${"to"} ${snapshots.data!.data![0].endDate1.toString()}",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontFamily:
                                                                    "SegoeUI",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                                    SizedBox(
                                                      height: 3.h,
                                                    ),

                                                    /// [1.categories]
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 1.h),
                                                      width: 40.w,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color:
                                                                  Colors.grey,
                                                              offset: Offset(
                                                                  0.2, 0.8),
                                                              blurRadius: 2,
                                                            )
                                                          ]),
                                                      child: Center(
                                                        child: Column(
                                                          children: [
                                                            Text(
                                                              "Categories",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontFamily:
                                                                      "SegoeUI",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            Text(
                                                              "Historical,Adventure",
                                                              //  server.destinationCategory.toString(),
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontFamily:
                                                                      "SegoeUI",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),

                                                    SizedBox(
                                                      height: 3.h,
                                                    ),

                                                    /// [1. other requirements]
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 1.h),
                                                      width: 40.w,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color:
                                                                  Colors.grey,
                                                              offset: Offset(
                                                                  0.2, 0.8),
                                                              blurRadius: 2,
                                                            )
                                                          ]),
                                                      child: Center(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Center(
                                                              child: Text(
                                                                "Other",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontFamily:
                                                                        "SegoeUI",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ),
                                                            Center(
                                                              child: Text(
                                                                "Requirements",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontFamily:
                                                                        "SegoeUI",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ),
                                                            Text(
                                                              "No other",
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontFamily:
                                                                      "SegoeUI",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),

                                                    SizedBox(
                                                      height: 2.h,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),

                                            /// [Agency 02]
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  /// [second agency]
                                                  Align(
                                                    alignment:
                                                        Alignment.topCenter,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color:
                                                                  Colors.grey,
                                                              offset: Offset(
                                                                  0.2, 0.8),
                                                              blurRadius: 2,
                                                            )
                                                          ]),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(5),
                                                        child: Text(
                                                          //"NR Travels",
                                                          widget.secondagency,
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  "SegoeUI",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  // Text(
                                                  //   //"Bharat Travels",
                                                  //   widget.secondagency,
                                                  //   style: TextStyle(
                                                  //       fontSize: 14,
                                                  //       fontFamily: "SegoeUI",
                                                  //       fontWeight:
                                                  //           FontWeight.bold,
                                                  //       color: Colors.black),
                                                  // ),
                                                  SizedBox(
                                                    height: 2.h,
                                                  ),

                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 1.h),
                                                    width: 40.w,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey,
                                                            offset: Offset(
                                                                0.2, 0.8),
                                                            blurRadius: 2,
                                                          )
                                                        ]),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons.star,
                                                              color: Color(
                                                                  0xff025B72),
                                                              size: 14,
                                                            ),
                                                            Icon(
                                                              Icons.star,
                                                              color: Color(
                                                                  0xff025B72),
                                                              size: 14,
                                                            ),
                                                            Icon(
                                                              Icons.star,
                                                              color: Color(
                                                                  0xff025B72),
                                                              size: 14,
                                                            ),
                                                            Icon(
                                                              Icons.star,
                                                              color: Color(
                                                                  0xff025B72),
                                                              size: 14,
                                                            ),
                                                            Icon(
                                                              Icons.star_border,
                                                              color: Color(
                                                                  0xff025B72),
                                                              size: 14,
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          "Total Reviews: 18",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  "SegoeUI",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        Text(
                                                          //"Price: ₹ 18,000",
                                                          widget.secondprice,
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  "SegoeUI",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  /// [second]

                                                  SizedBox(
                                                    height: 3.h,
                                                  ),
                                                  // Text(
                                                  //   "Categories",
                                                  //   style: TextStyle(
                                                  //       fontSize: 18.sp,
                                                  //       fontFamily: "SegoeUI",
                                                  //       fontWeight:
                                                  //           FontWeight.bold,
                                                  //       color: Colors.black),
                                                  // ),
                                                  // Text(
                                                  //   //  "Hostorical",
                                                  //   server1.destinationCategory
                                                  //       .toString(),
                                                  //   // snapshots.data!.data![1].destinationCategory.toString(),
                                                  //   style: TextStyle(
                                                  //       fontSize: 16.sp,
                                                  //       fontFamily: "SegoeUI",
                                                  //       fontWeight:
                                                  //           FontWeight.bold,
                                                  //       color: Colors.black),
                                                  // ),
                                                  // SizedBox(
                                                  //   height: 40.h,
                                                  // ),

                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 1.h),
                                                    width: 40.w,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey,
                                                            offset: Offset(
                                                                0.2, 0.8),
                                                            blurRadius: 2,
                                                          )
                                                        ]),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "Meals",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  "SegoeUI",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        Text(
                                                          //"Breakfast,Dinner",
                                                          server1.mealRequired
                                                              .toString(),
                                                          // snapshots.data!.data![1].mealRequired.toString(),
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  "SegoeUI",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  SizedBox(
                                                    height: 3.h,
                                                  ),

                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 1.h),
                                                    width: 40.w,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey,
                                                            offset: Offset(
                                                                0.2, 0.8),
                                                            blurRadius: 2,
                                                          )
                                                        ]),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "Cab",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  "SegoeUI",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        Text(
                                                          "Exclude",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  "SegoeUI",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  SizedBox(
                                                    height: 3.h,
                                                  ),

                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 1.h),
                                                    width: 40.w,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey,
                                                            offset: Offset(
                                                                0.2, 0.8),
                                                            blurRadius: 2,
                                                          )
                                                        ]),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "Sightseeing",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  "SegoeUI",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        Text(
                                                          //"Exclude",

                                                          server1.sightseeing
                                                              .toString(),
                                                          //snapshots.data!.data![1].sightseeing.toString(),
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  "SegoeUI",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  // Container(   padding: EdgeInsets.symmetric(vertical: 1.h),
                                                  //
                                                  //   width: 40.w, decoration: BoxDecoration(
                                                  //       color: Colors.white,
                                                  //       boxShadow: [
                                                  //         BoxShadow(
                                                  //           color: Colors.grey,
                                                  //           offset: Offset(0.2, 0.8),
                                                  //           blurRadius: 2,
                                                  //         )
                                                  //       ]
                                                  //   ),
                                                  //   child: Column(
                                                  //     children: [
                                                  //       Text(
                                                  //         //"Exclude",
                                                  //
                                                  //         server1.sightseeing
                                                  //             .toString(),
                                                  //         //snapshots.data!.data![1].sightseeing.toString(),
                                                  //         style: TextStyle(
                                                  //             fontSize: 12.sp,
                                                  //             fontFamily: "SegoeUI",
                                                  //             fontWeight:
                                                  //                 FontWeight.bold,
                                                  //             color: Colors.black),
                                                  //       ),
                                                  //     ],
                                                  //   ),
                                                  // ),
                                                  SizedBox(
                                                    height: 3.h,
                                                  ),

                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 1.h),
                                                    width: 40.w,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey,
                                                            offset: Offset(
                                                                0.2, 0.8),
                                                            blurRadius: 2,
                                                          )
                                                        ]),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "Flight",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  "SegoeUI",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        Text(
                                                          "Exclude",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  "SegoeUI",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  SizedBox(
                                                    height: 3.h,
                                                  ),

                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 1.h),
                                                    width: 40.w,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey,
                                                            offset: Offset(
                                                                0.2, 0.8),
                                                            blurRadius: 2,
                                                          )
                                                        ]),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "Duration",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  "SegoeUI",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        Text(
                                                          //"20/7/2021 to 27/7/2021",

                                                          "${server1.startDate1.toString()}${" to"}",
                                                          // "${snapshots.data!.data![1].startDate1.toString()} ${"to"} ${snapshots.data!.data![1].endDate1.toString()}",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  "SegoeUI",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        Text(
                                                          //"20/7/2021 to 27/7/2021",

                                                          "${server1.endDate1.toString()}",
                                                          // "${snapshots.data!.data![1].startDate1.toString()} ${"to"} ${snapshots.data!.data![1].endDate1.toString()}",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  "SegoeUI",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  SizedBox(
                                                    height: 3.h,
                                                  ),

                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 1.h),
                                                    width: 40.w,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey,
                                                            offset: Offset(
                                                                0.2, 0.8),
                                                            blurRadius: 2,
                                                          )
                                                        ]),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "Categories",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  "SegoeUI",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        Text(
                                                          "Hostorical",

                                                          //server.destinationCategory.toString(),
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  "SegoeUI",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  SizedBox(
                                                    height: 3.h,
                                                  ),

                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 1.h),
                                                    width: 40.w,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey,
                                                            offset: Offset(
                                                                0.2, 0.8),
                                                            blurRadius: 2,
                                                          )
                                                        ]),
                                                    child: Column(
                                                      children: [
                                                        Center(
                                                          child: Text(
                                                            "Other",
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    "SegoeUI",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ),
                                                        Center(
                                                          child: Text(
                                                            "Requirements",
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    "SegoeUI",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ),
                                                        Text(
                                                          "No other",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  "SegoeUI",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  SizedBox(
                                                    height: 2.h,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),

                        /// [services tab]
                        Container(
                          color: Colors.white,
                          child: ListView(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    // color: Colors.green,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 20, left: 20),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  //   padding: EdgeInsets.symmetric(vertical: 1.h),
                                                  //
                                                  //   width: 40.w, decoration: BoxDecoration(
                                                  //     color: Colors.white,
                                                  //     boxShadow: [
                                                  //       BoxShadow(
                                                  //         color: Colors.grey,
                                                  //         offset: Offset(0.2, 0.8),
                                                  //         blurRadius: 2,
                                                  //       )
                                                  //     ]
                                                  // ),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 1.h,
                                                                horizontal:
                                                                    2.w),
                                                        width: 40.w,
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                boxShadow: [
                                                              BoxShadow(
                                                                color:
                                                                    Colors.grey,
                                                                offset: Offset(
                                                                    0.2, 0.8),
                                                                blurRadius: 2,
                                                              )
                                                            ]),
                                                        child: Text(
                                                          //"NR Travels",
                                                          widget.fristagency,
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  "SegoeUI",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 2.h,
                                                      ),
                                                      Text(
                                                        "Included/Excluded ",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontFamily:
                                                                "SegoeUI",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.grey),
                                                      ),
                                                      SizedBox(
                                                        height: 3.h,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons.check,
                                                                color: Color(
                                                                    0xff079023),
                                                                size: 18,
                                                              ),
                                                              SizedBox(
                                                                width: 3.w,
                                                              ),
                                                              Container(
                                                                width: 30.w,
                                                                child: Text(
                                                                  //"Spa and relaxation treatment",
                                                                  server
                                                                      .includeServices![
                                                                          0]
                                                                      .includeServicesValue
                                                                      .toString(),
                                                                  //  snapshots.data!.data![0].includeServices![0].includeServicesValue.toString(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontFamily:
                                                                          "SegoeUI",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Color(
                                                                          0xff079023)),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 2.h,
                                                          ),
                                                          // Row(
                                                          //   children: [
                                                          //     Icon(
                                                          //       Icons.check,
                                                          //       color: Color(
                                                          //           0xff079023),
                                                          //       size: 18,
                                                          //     ),
                                                          //     SizedBox(
                                                          //       width: 3.w,
                                                          //     ),
                                                          //     Container(
                                                          //       width: 30.w,
                                                          //       child: Text(
                                                          //         "Water Activities",
                                                          //         style: TextStyle(
                                                          //             fontSize:
                                                          //                 12,
                                                          //             fontFamily:
                                                          //                 "SegoeUI",
                                                          //             fontWeight:
                                                          //                 FontWeight
                                                          //                     .bold,
                                                          //             color: Color(
                                                          //                 0xff079023)),
                                                          //       ),
                                                          //     ),
                                                          //   ],
                                                          // ),
                                                          // SizedBox(
                                                          //   height: 2.h,
                                                          // ),
                                                          // Row(
                                                          //   children: [
                                                          //     Icon(
                                                          //       Icons.check,
                                                          //       color: Color(
                                                          //           0xff079023),
                                                          //       size: 18,
                                                          //     ),
                                                          //     SizedBox(
                                                          //       width: 3.w,
                                                          //     ),
                                                          //     Container(
                                                          //       width: 30.w,
                                                          //       child: Text(
                                                          //         "Spa and relaxation treatment",
                                                          //         style: TextStyle(
                                                          //             fontSize:
                                                          //                 12,
                                                          //             fontFamily:
                                                          //                 "SegoeUI",
                                                          //             fontWeight:
                                                          //                 FontWeight
                                                          //                     .bold,
                                                          //             color: Color(
                                                          //                 0xff079023)),
                                                          //       ),
                                                          //     ),
                                                          //   ],
                                                          // ),
                                                          // SizedBox(
                                                          //   height: 3.h,
                                                          // ),
                                                          // Row(
                                                          //   children: [
                                                          //     Icon(
                                                          //       Icons.close,
                                                          //       color: Color(
                                                          //           0xffEE1B1B),
                                                          //       size: 18,
                                                          //     ),
                                                          //     SizedBox(
                                                          //       width: 3.w,
                                                          //     ),
                                                          //     Container(
                                                          //       width: 30.w,
                                                          //       child: Text(
                                                          //         // "Water Activities",
                                                          //         server
                                                          //             .excludeServices![
                                                          //                 0]
                                                          //             .excludeServicesValue
                                                          //             .toString(),
                                                          //         // snapshots.data!.data![0].excludeServices![0].excludeServicesValue.toString(),
                                                          //         style: TextStyle(
                                                          //             fontSize:
                                                          //                 12,
                                                          //             fontFamily:
                                                          //                 "SegoeUI",
                                                          //             fontWeight:
                                                          //                 FontWeight
                                                          //                     .bold,
                                                          //             color: Color(
                                                          //                 0xffEE1B1B)),
                                                          //       ),
                                                          //     ),
                                                          //   ],
                                                          // ),
                                                          // SizedBox(
                                                          //   height: 2.h,
                                                          // ),
                                                          // Row(
                                                          //   children: [
                                                          //     Icon(
                                                          //       Icons.close,
                                                          //       color: Color(
                                                          //           0xffEE1B1B),
                                                          //       size: 18,
                                                          //     ),
                                                          //     SizedBox(
                                                          //       width: 3.w,
                                                          //     ),
                                                          //     Container(
                                                          //       width: 30.w,
                                                          //       child: Text(
                                                          //         "Spa and relaxation treatment",
                                                          //         style: TextStyle(
                                                          //             fontSize:
                                                          //                 12,
                                                          //             fontFamily:
                                                          //                 "SegoeUI",
                                                          //             fontWeight:
                                                          //                 FontWeight
                                                          //                     .bold,
                                                          //             color: Color(
                                                          //                 0xffEE1B1B)),
                                                          //       ),
                                                          //     ),
                                                          //   ],
                                                          // ),
                                                          // SizedBox(
                                                          //   height: 3.h,
                                                          // ),
                                                          // Row(
                                                          //   children: [
                                                          //     Icon(
                                                          //       Icons.close,
                                                          //       color: Color(
                                                          //           0xffEE1B1B),
                                                          //       size: 18,
                                                          //     ),
                                                          //     SizedBox(
                                                          //       width: 3.w,
                                                          //     ),
                                                          //     Container(
                                                          //       width: 30.w,
                                                          //       child: Text(
                                                          //         "Private Beach area",
                                                          //         style: TextStyle(
                                                          //             fontSize:
                                                          //                 12,
                                                          //             fontFamily:
                                                          //                 "SegoeUI",
                                                          //             fontWeight:
                                                          //                 FontWeight
                                                          //                     .bold,
                                                          //             color: Color(
                                                          //                 0xffEE1B1B)),
                                                          //       ),
                                                          //     ),
                                                          //   ],
                                                          // ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              // VerticalDivider(
                                              //   color: Colors.black,
                                              // ),
                                              Expanded(
                                                child: Container(
                                                  // color: Colors.grey,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 1.h),
                                                        width: 40.w,
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                boxShadow: [
                                                              BoxShadow(
                                                                color:
                                                                    Colors.grey,
                                                                offset: Offset(
                                                                    0.2, 0.8),
                                                                blurRadius: 2,
                                                              )
                                                            ]),
                                                        child: Center(
                                                          child: Text(
                                                            // "Bharat Travels",

                                                            widget.secondagency,
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    "SegoeUI",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 2.h,
                                                      ),
                                                      Text(
                                                        "Included/Excluded ",
                                                        //server.includeServices![index].includeServicesValue.toString(),
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontFamily:
                                                                "SegoeUI",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.grey),
                                                      ),
                                                      SizedBox(
                                                        height: 3.h,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons.check,
                                                                color: Color(
                                                                    0xff079023),
                                                                size: 18,
                                                              ),
                                                              SizedBox(
                                                                width: 3.w,
                                                              ),
                                                              Container(
                                                                width: 30.w,
                                                                child: Text(
                                                                  //"Spa and relaxation treatment",
                                                                  server1
                                                                      .includeServices![
                                                                          0]
                                                                      .includeServicesValue
                                                                      .toString(),
                                                                  //snapshots.data!.data![0].includeServices![0].includeServicesValue.toString(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontFamily:
                                                                          "SegoeUI",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Color(
                                                                          0xff079023)),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          //                 SizedBox(
                                                          //                   height: 2.h,
                                                          //                 ),
                                                          //                 Row(
                                                          //                   children: [
                                                          //                     Icon(
                                                          //                       Icons.check,
                                                          //                       color: Color(
                                                          //                           0xff079023),
                                                          //                       size: 18,
                                                          //                     ),
                                                          //                     SizedBox(
                                                          //                       width: 3.w,
                                                          //                     ),
                                                          //                     Container(
                                                          //                       width: 30.w,
                                                          //                       child: Text(
                                                          //                         "Water Activities",
                                                          //                         style: TextStyle(
                                                          //                             fontSize:
                                                          //                                 12,
                                                          //                             fontFamily:
                                                          //                                 "SegoeUI",
                                                          //                             fontWeight:
                                                          //                                 FontWeight
                                                          //                                     .bold,
                                                          //                             color: Color(
                                                          //                                 0xff079023)),
                                                          //                       ),
                                                          //                     ),
                                                          //                   ],
                                                          //                 ),
                                                          //                 SizedBox(
                                                          //                   height: 2.h,
                                                          //                 ),
                                                          //                 Row(
                                                          //                   children: [
                                                          //                     Icon(
                                                          //                       Icons.check,
                                                          //                       color: Color(
                                                          //                           0xff079023),
                                                          //                       size: 18,
                                                          //                     ),
                                                          //                     SizedBox(
                                                          //                       width: 3.w,
                                                          //                     ),
                                                          //                     Container(
                                                          //                       width: 30.w,
                                                          //                       child: Text(
                                                          //                         "Spa and relaxation treatment",
                                                          //                         style: TextStyle(
                                                          //                             fontSize:
                                                          //                                 12,
                                                          //                             fontFamily:
                                                          //                                 "SegoeUI",
                                                          //                             fontWeight:
                                                          //                                 FontWeight
                                                          //                                     .bold,
                                                          //                             color: Color(
                                                          //                                 0xff079023)),
                                                          //                       ),
                                                          //                     ),
                                                          //                   ],
                                                          //                 ),
                                                          //                 SizedBox(
                                                          //                   height: 2.h,
                                                          //                 ),
                                                          //                 Row(
                                                          //                   children: [
                                                          //                     Icon(
                                                          //                       Icons.close,
                                                          //                       color: Color(
                                                          //                           0xffEE1B1B),
                                                          //                       size: 18,
                                                          //                     ),
                                                          //                     SizedBox(
                                                          //                       width: 3.w,
                                                          //                     ),
                                                          //                     Container(
                                                          //                       width: 30.w,
                                                          //                       child: Text(
                                                          //                         //"Water Activities",
                                                          //                         server1
                                                          //                             .excludeServices![
                                                          //                                 0]
                                                          //                             .excludeServicesValue
                                                          //                             .toString(),
                                                          //                         //snapshots.data!.data![1].excludeServices![1].excludeServicesValue.toString(),
                                                          //                         style: TextStyle(
                                                          //                             fontSize:
                                                          //                                 12,
                                                          //                             fontFamily:
                                                          //                                 "SegoeUI",
                                                          //                             fontWeight:
                                                          //                                 FontWeight
                                                          //                                     .bold,
                                                          //                             color: Color(
                                                          //                                 0xffEE1B1B)),
                                                          //                       ),
                                                          //                     ),
                                                          //                   ],
                                                          //                 ),
                                                          //                 SizedBox(
                                                          //                   height: 2.h,
                                                          //                 ),
                                                          //                 Row(
                                                          //                   children: [
                                                          //                     Icon(
                                                          //                       Icons.close,
                                                          //                       color: Color(
                                                          //                           0xffEE1B1B),
                                                          //                       size: 18,
                                                          //                     ),
                                                          //                     SizedBox(
                                                          //                       width: 3.w,
                                                          //                     ),
                                                          //                     Container(
                                                          //                       width: 30.w,
                                                          //                       child: Text(
                                                          //                         "Spa and relaxation treatment",
                                                          //                         style: TextStyle(
                                                          //                             fontSize:
                                                          //                                 12,
                                                          //                             fontFamily:
                                                          //                                 "SegoeUI",
                                                          //                             fontWeight:
                                                          //                                 FontWeight
                                                          //                                     .bold,
                                                          //                             color: Color(
                                                          //                                 0xffEE1B1B)),
                                                          //                       ),
                                                          //                     ),
                                                          //                   ],
                                                          //                 ),
                                                          //                 SizedBox(
                                                          //                   height: 2.h,
                                                          //                 ),
                                                          //                 Row(
                                                          //                   children: [
                                                          //                     Icon(
                                                          //                       Icons.close,
                                                          //                       color: Color(
                                                          //                           0xffEE1B1B),
                                                          //                       size: 18,
                                                          //                     ),
                                                          //                     SizedBox(
                                                          //                       width: 3.w,
                                                          //                     ),
                                                          //                     Container(
                                                          //                       width: 30.w,
                                                          //                       child: Text(
                                                          //                         "Private Beach area",
                                                          //                         style: TextStyle(
                                                          //                             fontSize:
                                                          //                                 12,
                                                          //                             fontFamily:
                                                          //                                 "SegoeUI",
                                                          //                             fontWeight:
                                                          //                                 FontWeight
                                                          //                                     .bold,
                                                          //                             color: Color(
                                                          //                                 0xffEE1B1B)),
                                                          //                       ),
                                                          //                     ),
                                                          //                   ],
                                                          //                 ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),

                        /// [Itinery tab]
                        Container(
                            color: Colors.white,
                            child: ListView(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                        child: Column(
                                      children: [
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 20, left: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Column(
                                                children: [
                                                  /// [first agency]
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 1.h),
                                                    width: 40.w,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey,
                                                            offset: Offset(
                                                                0.2, 0.8),
                                                            blurRadius: 2,
                                                          )
                                                        ]),
                                                    child: Center(
                                                      child: Text(
                                                        //"NR Travels",
                                                        widget.fristagency,
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontFamily:
                                                                "SegoeUI",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 3.h,
                                                  ),
                                                ],
                                              ),

                                              /// [second agency]
                                              Column(
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 1.h),
                                                    width: 40.w,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey,
                                                            offset: Offset(
                                                                0.2, 0.8),
                                                            blurRadius: 2,
                                                          )
                                                        ]),
                                                    child: Center(
                                                      child: Text(
                                                        //"Bharat Travels",
                                                        widget.secondagency,
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontFamily:
                                                                "SegoeUI",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 3.h,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        TabBar(
                                            indicator: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                7.0,
                                              ),
                                              color: Color(0xff09646D),
                                            ),
                                            labelColor: Colors.white,
                                            indicatorPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 2.w),
                                            unselectedLabelColor:
                                                Colors.grey.shade900,
                                            controller: _tabController,
                                            indicatorColor: Color(0xff004351),
                                            tabs: snapshots.data!.data![0]
                                                        .itineries!.length >=
                                                    snapshots.data!.data![1]
                                                        .itineries!.length
                                                ? snapshots
                                                    .data!.data![0].itineries!
                                                    .asMap()
                                                    .entries
                                                    .map((entry) {
                                                    int idx = entry.key;
                                                    print(_tabController
                                                            .toString() +
                                                        ">>>>>>>>>>>>>>>>>>>>>>");
                                                    // String val = entry.value;

                                                    return Container(
                                                      height: 5.h,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 1.h,
                                                              horizontal: 2.w),
                                                      // color: Colors.grey,

                                                      //    decoration: BoxDecoration(
                                                      //     borderRadius: BorderRadius.circular(5),
                                                      //        // color: Color(0xff1B3D45),
                                                      //     boxShadow: [
                                                      //       BoxShadow(
                                                      //         // color: Colors.grey,
                                                      //         offset: Offset(0.2, 0.8),
                                                      //         blurRadius: 2,
                                                      //       )
                                                      //     ]
                                                      // ),
                                                      child: Center(
                                                        child: Text(
                                                          "Day " +
                                                              (idx + 1)
                                                                  .toString(),
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontFamily:
                                                                "SegoeUI",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            // color: Colors.white
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }).toList()
                                                : snapshots
                                                    .data!.data![1].itineries!
                                                    .asMap()
                                                    .entries
                                                    .map((entry) {
                                                    int idx = entry.key;
                                                    print(_tabController
                                                            .toString() +
                                                        ">>>>>>>>>>>>>>>>>>>>>>");
                                                    // String val = entry.value;

                                                    return Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 1.h),
                                                      width: 40.w,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Color(0xff1B3D45),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color:
                                                                  Colors.grey,
                                                              offset: Offset(
                                                                  0.2, 0.8),
                                                              blurRadius: 2,
                                                            )
                                                          ]),
                                                      child: Text(
                                                        "Day " +
                                                            (idx + 1)
                                                                .toString(),
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontFamily:
                                                                "SegoeUI",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color(
                                                                0xff004351)),
                                                      ),
                                                    );
                                                  }).toList()

                                            //       [
                                            //     Text(
                                            //       "Day 1",
                                            // //"${"Day"} ${ server1.itineries![index].day.toString()}",
                                            //       style: TextStyle(
                                            //           fontSize: 18.sp,
                                            //           fontFamily: "SegoeUI",
                                            //           fontWeight:
                                            //           FontWeight.bold,
                                            //           color: Color(0xff004351)),
                                            //     ),
                                            //   ],
                                            ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Container(
                                          height: 60.h,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 3.w),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  colors: [
                                                    Color(0xff047B99),
                                                    Color(0xff023E4D)
                                                  ])),
                                          // color: Colors.green,
                                          child: TabBarView(
                                              controller: _tabController,
                                              children:
                                                  snapshots
                                                              .data!
                                                              .data![0]
                                                              .itineries!
                                                              .length >=
                                                          snapshots
                                                              .data!
                                                              .data![1]
                                                              .itineries!
                                                              .length
                                                      ? snapshots.data!.data![0]
                                                          .itineries!
                                                          .asMap()
                                                          .entries
                                                          .map((entry) {
                                                          print(_tabController);
                                                          int idx = entry.key;
                                                          // String val = entry.value;

                                                          return ListView(
                                                            children: [
                                                              Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  SizedBox(
                                                                    height: 1.h,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.only(
                                                                        right:
                                                                            5.w,
                                                                        left: 5
                                                                            .w),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Column(
                                                                          children: [
                                                                            SizedBox(
                                                                              height: 1.h,
                                                                            ),
                                                                            Column(
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                SizedBox(
                                                                                  width: 30.w,
                                                                                  child: Center(
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(5),
                                                                                        color: Color(0xff1B3D45),
                                                                                        // boxShadow: [
                                                                                        //   BoxShadow(
                                                                                        //     color: Color(0xff1B3D45),
                                                                                        //     offset: Offset(0.2, 0.8),
                                                                                        //     blurRadius: 2,
                                                                                        //   )
                                                                                        // ]
                                                                                      ),
                                                                                      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.5.h),
                                                                                      // width: 40.w,
                                                                                      child: Text(
                                                                                        "Day ${idx + 1}",
                                                                                        style: TextStyle(fontSize: 16, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.white),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 2.h,
                                                                                ),
                                                                                Row(
                                                                                  children: [
                                                                                    SizedBox(
                                                                                      height: 2.h,
                                                                                      width: 3.w,
                                                                                      child: CircleAvatar(
                                                                                        backgroundColor: Color(0xff788F66),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: 1.w,
                                                                                    ),
                                                                                    Container(
                                                                                      width: 35.w,
                                                                                      child: Text(
                                                                                        idx + 1 <= snapshots.data!.data![0].itineries!.length ? "Hotel: ${snapshots.data!.data![0].itineries![idx].hotelName.toString()}" : "Hotel: ---",
                                                                                        //"${snapshots.data!.data![0].itineries![0].hotelName.toString()}",
                                                                                        style: TextStyle(fontSize: 10, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.white),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                // SizedBox(
                                                                                //   height: 2.h,
                                                                                // ),
                                                                                Row(
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    SizedBox(
                                                                                      width: 3.w,
                                                                                      height: 2.h,
                                                                                      child: CircleAvatar(
                                                                                        backgroundColor: Color(0xff788F66),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: 1.w,
                                                                                    ),
                                                                                    Container(
                                                                                      width: 35.w,
                                                                                      child: Text(
                                                                                        idx + 1 <= snapshots.data!.data![0].itineries!.length ? "Activity: ${snapshots.data!.data![0].itineries![idx].activity.toString()}" : "Activity: ---",
                                                                                        //"${snapshots.data!.data![0].itineries![0].activity.toString()}",
                                                                                        style: TextStyle(fontSize: 10, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.white),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 3.h,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),

                                                                        ///[Divider]
                                                                        // Padding(
                                                                        //   padding:  EdgeInsets.only(top: 8.h,right: 2.w,left: 2.w),
                                                                        //   child: Container(
                                                                        //     color: Colors.black,
                                                                        //     width: 2.w,
                                                                        //     height: 10.h,
                                                                        //   ),
                                                                        // ),
                                                                        Container(
                                                                            width:
                                                                                5.w,
                                                                            color: Colors.black),
                                                                        Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            SizedBox(
                                                                              height: 1.h,
                                                                            ),
                                                                            Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                SizedBox(
                                                                                  width: 35.w,
                                                                                  child: Center(
                                                                                    child: Container(
                                                                                      // width: 30.w,
                                                                                      decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(5),
                                                                                        color: Color(0xff1B3D45),
                                                                                        // boxShadow: [
                                                                                        //   BoxShadow(
                                                                                        //     // color: Colors.grey,
                                                                                        //     offset: Offset(0.2, 0.8),
                                                                                        //     blurRadius: 2,
                                                                                        //   )
                                                                                        // ]
                                                                                      ),
                                                                                      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.5.h),
                                                                                      child: Text(
                                                                                        "Day ${idx + 1}",
                                                                                        style: TextStyle(fontSize: 16, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.white),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 2.h,
                                                                                ),
                                                                                Row(
                                                                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    SizedBox(
                                                                                      height: 2.h,
                                                                                      width: 3.w,
                                                                                      child: CircleAvatar(
                                                                                        backgroundColor: Color(0xff788F66),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: 1.w,
                                                                                    ),
                                                                                    Container(
                                                                                      width: 35.w,
                                                                                      child: Text(
                                                                                        idx + 1 <= snapshots.data!.data![1].itineries!.length ? "Hotel: ${snapshots.data!.data![1].itineries![idx].hotelName.toString()}" : "Hotel: ---",
                                                                                        // "${snapshots.data!.data![1].itineries![1].hotelName.toString()}",
                                                                                        style: TextStyle(fontSize: 10, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.white),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                // SizedBox(
                                                                                //   height: 1.h,
                                                                                // ),
                                                                                // CircleAvatar(
                                                                                //   backgroundColor: Color(0xff788F66),
                                                                                // ),
                                                                                // SizedBox(
                                                                                //   width: 1.w,
                                                                                // ),
                                                                                Row(
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    SizedBox(
                                                                                      height: 2.h,
                                                                                      width: 3.w,
                                                                                      child: CircleAvatar(
                                                                                        backgroundColor: Color(0xff788F66),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: 1.w,
                                                                                    ),
                                                                                    Container(
                                                                                      width: 35.w,
                                                                                      child: Text(
                                                                                        idx + 1 <= snapshots.data!.data![1].itineries!.length ? "Activity: ${snapshots.data!.data![1].itineries![idx].activity.toString()}" : "Activity: ---",

                                                                                        //"${snapshots.data!.data![1].itineries![1].activity.toString()}",
                                                                                        style: TextStyle(fontSize: 10, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.white),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 3.h,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          );
                                                        }).toList()
                                                      : snapshots.data!.data![1]
                                                          .itineries!
                                                          .asMap()
                                                          .entries
                                                          .map((entry) {
                                                          print(_tabController);
                                                          int idx = entry.key;
                                                          // String val = entry.value;

                                                          return Container(
                                                              child: Column(
                                                            children: [
                                                              SizedBox(
                                                                height: 4.h,
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            5.w,
                                                                        left: 5
                                                                            .w),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Column(
                                                                      children: [
                                                                        SizedBox(
                                                                          height:
                                                                              3.h,
                                                                        ),
                                                                        Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                              width: 40.w,
                                                                              child: Text(
                                                                                "Day ${idx + 1}",
                                                                                style: TextStyle(fontSize: 12, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.white),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 2.h,
                                                                            ),
                                                                            Row(
                                                                              children: [
                                                                                Image.asset(
                                                                                  "assets/itinerary",
                                                                                  height: 1.5.h,
                                                                                  width: 3.w,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                                Container(
                                                                                  width: 40.w,
                                                                                  child: Text(
                                                                                    idx + 1 <= snapshots.data!.data![0].itineries!.length ? "Hotel: ${snapshots.data!.data![0].itineries![idx].hotelName.toString()}" : "Hotel: ---",
                                                                                    //"${snapshots.data!.data![0].itineries![0].hotelName.toString()}",
                                                                                    style: TextStyle(fontSize: 12, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.white),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            SizedBox(
                                                                              height: 2.h,
                                                                            ),
                                                                            Container(
                                                                              width: 30.w,
                                                                              child: Text(
                                                                                idx + 1 <= snapshots.data!.data![0].itineries!.length ? "Activity: ${snapshots.data!.data![0].itineries![idx].activity.toString()}" : "Activity: ---",
                                                                                //"${snapshots.data!.data![0].itineries![0].activity.toString()}",
                                                                                style: TextStyle(fontSize: 12, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.white),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 3.h,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    // Container(
                                                                    //   height: 55.h,width: 2.w,
                                                                    //   color: Colors.black,
                                                                    // ),

                                                                    ///[second column]
                                                                    Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        SizedBox(
                                                                          height:
                                                                              3.h,
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              30.w,
                                                                          child:
                                                                              Text(
                                                                            "Day ${idx + 1}",
                                                                            style: TextStyle(
                                                                                fontSize: 12,
                                                                                fontFamily: "SegoeUI",
                                                                                fontWeight: FontWeight.bold,
                                                                                color: Colors.black),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              2.h,
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              35.w,
                                                                          child:
                                                                              Text(
                                                                            idx + 1 <= snapshots.data!.data![1].itineries!.length
                                                                                ? "Hotel: ${snapshots.data!.data![1].itineries![idx].hotelName.toString()}"
                                                                                : "Hotel: ---",
                                                                            // "${snapshots.data!.data![1].itineries![1].hotelName.toString()}",
                                                                            style: TextStyle(
                                                                                fontSize: 12,
                                                                                fontFamily: "SegoeUI",
                                                                                fontWeight: FontWeight.bold,
                                                                                color: Colors.white),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              2.h,
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              35.w,
                                                                          padding:
                                                                              EdgeInsets.symmetric(horizontal: 5),
                                                                          child:
                                                                              Text(
                                                                            idx + 1 <= snapshots.data!.data![1].itineries!.length
                                                                                ? "Activity: ${snapshots.data!.data![1].itineries![idx].activity.toString()}"
                                                                                : "Activity: ---",

                                                                            //"${snapshots.data!.data![1].itineries![1].activity.toString()}",
                                                                            style: TextStyle(
                                                                                fontSize: 12,
                                                                                fontFamily: "SegoeUI",
                                                                                fontWeight: FontWeight.bold,
                                                                                color: Colors.white),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              3.h,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ));
                                                        }).toList()

                                              // [
                                              //   Container(
                                              //       child: Column(
                                              //         children: [
                                              //           SizedBox(
                                              //             height: 40.h,
                                              //           ),
                                              //           Padding(
                                              //             padding:
                                              //             EdgeInsets.only(
                                              //                 right: 20.w,
                                              //                 left: 20.w),
                                              //             child: Row(
                                              //               mainAxisAlignment:
                                              //               MainAxisAlignment
                                              //                   .spaceEvenly,
                                              //               children: [
                                              //                 Column(
                                              //                   children: [
                                              //                     SizedBox(
                                              //                       height:
                                              //                       30.h,
                                              //                     ),
                                              //                     Column(
                                              //                       crossAxisAlignment:
                                              //                       CrossAxisAlignment
                                              //                           .start,
                                              //                       children: [
                                              //                         Row(
                                              //                           children: [
                                              //                             Container(
                                              //                               width:
                                              //                               130.w,
                                              //                               child:
                                              //                               Text(
                                              //                                 "Day 1: lorem ipsum",
                                              //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                              //                               ),
                                              //                             ),
                                              //                           ],
                                              //                         ),
                                              //                         SizedBox(
                                              //                           height:
                                              //                           10.h,
                                              //                         ),
                                              //                         Row(
                                              //                           children: [
                                              //                             Container(
                                              //                               width:
                                              //                               130.w,
                                              //                               child:
                                              //                               Text(
                                              //                                 "Hotel: ${server.itineries![0].hotelName.toString()}",
                                              //                                   //"${snapshots.data!.data![0].itineries![0].hotelName.toString()}",
                                              //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                              //                               ),
                                              //                             ),
                                              //                           ],
                                              //                         ),
                                              //                         SizedBox(
                                              //                           height:
                                              //                           10.h,
                                              //                         ),
                                              //                         Row(
                                              //                           children: [
                                              //                             Container(
                                              //                               width:
                                              //                               130.w,
                                              //                               child:
                                              //                               Text(
                                              //                                 "Activity: ${server.itineries![0].activity.toString()}",
                                              //                                   //"${snapshots.data!.data![0].itineries![0].activity.toString()}",
                                              //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                              //                               ),
                                              //                             ),
                                              //                           ],
                                              //                         ),
                                              //                         SizedBox(
                                              //                           height:
                                              //                           30.h,
                                              //                         ),
                                              //                       ],
                                              //                     ),
                                              //                   ],
                                              //                 ),
                                              //                 VerticalDivider(
                                              //                   color: Colors
                                              //                       .black,
                                              //                 ),
                                              //                 Column(
                                              //                   children: [
                                              //                     SizedBox(
                                              //                       height:
                                              //                       30.h,
                                              //                     ),
                                              //                     Column(
                                              //                       crossAxisAlignment:
                                              //                       CrossAxisAlignment
                                              //                           .start,
                                              //                       children: [
                                              //                         Row(
                                              //                           children: [
                                              //                             Container(
                                              //                               width:
                                              //                               130.w,
                                              //                               child:
                                              //                               Text(
                                              //                                 "Day 1: lorem ipsum",
                                              //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                              //                               ),
                                              //                             ),
                                              //                           ],
                                              //                         ),
                                              //                         SizedBox(
                                              //                           height:
                                              //                           10.h,
                                              //                         ),
                                              //                         Row(
                                              //                           children: [
                                              //                             Container(
                                              //                               width:
                                              //                               130.w,
                                              //                               child:
                                              //                               Text(
                                              //                                 "Hotel: ${server1.itineries![0].hotelName.toString()}",
                                              //                                    // "${snapshots.data!.data![1].itineries![1].hotelName.toString()}",
                                              //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                              //                               ),
                                              //                             ),
                                              //                           ],
                                              //                         ),
                                              //                         SizedBox(
                                              //                           height:
                                              //                           10.h,
                                              //                         ),
                                              //                         Row(
                                              //                           children: [
                                              //                             Container(
                                              //                               width:
                                              //                               130.w,
                                              //                               child:
                                              //                               Text(
                                              //                                 "Activity: ${server1.itineries![0].activity.toString()}",
                                              //                                   //"${snapshots.data!.data![1].itineries![1].activity.toString()}",
                                              //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                              //                               ),
                                              //                             ),
                                              //                           ],
                                              //                         ),
                                              //                         SizedBox(
                                              //                           height:
                                              //                           30.h,
                                              //                         ),
                                              //                       ],
                                              //                     ),
                                              //                   ],
                                              //                 ),
                                              //               ],
                                              //             ),
                                              //           ),
                                              //         ],
                                              //       )),
                                              //   Container(
                                              //       child: Column(
                                              //         children: [
                                              //           SizedBox(
                                              //             height: 40.h,
                                              //           ),
                                              //           Padding(
                                              //             padding:
                                              //             EdgeInsets.only(
                                              //                 right: 20.w,
                                              //                 left: 20.w),
                                              //             child: Row(
                                              //               mainAxisAlignment:
                                              //               MainAxisAlignment
                                              //                   .spaceEvenly,
                                              //               children: [
                                              //                 Column(
                                              //                   children: [
                                              //                     SizedBox(
                                              //                       height:
                                              //                       30.h,
                                              //                     ),
                                              //                     Column(
                                              //                       crossAxisAlignment:
                                              //                       CrossAxisAlignment
                                              //                           .start,
                                              //                       children: [
                                              //                         Row(
                                              //                           children: [
                                              //                             Container(
                                              //                               width:
                                              //                               130.w,
                                              //                               child:
                                              //                               Text(
                                              //                                 "Day 2: lorem ipsum",
                                              //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                              //                               ),
                                              //                             ),
                                              //                           ],
                                              //                         ),
                                              //                         SizedBox(
                                              //                           height:
                                              //                           10.h,
                                              //                         ),
                                              //                         Row(
                                              //                           children: [
                                              //                             Container(
                                              //                               width:
                                              //                               130.w,
                                              //                               child:
                                              //                               Text(
                                              //                                 "Hotel:${server.itineries![1].hotelName.toString()} ",
                                              //                                // ${snapshots.data!.data![0].itineries![0].hotelName.toString()}",
                                              //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                              //                               ),
                                              //                             ),
                                              //                           ],
                                              //                         ),
                                              //                         SizedBox(
                                              //                           height:
                                              //                           10.h,
                                              //                         ),
                                              //                         Row(
                                              //                           children: [
                                              //                             Container(
                                              //                               width:
                                              //                               130.w,
                                              //                               child:
                                              //                               Text(
                                              //                                 "Activity: ${server.itineries![1].activity.toString()}",
                                              //                                   //${snapshots.data!.data![0].itineries![0].activity.toString()}",
                                              //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                              //                               ),
                                              //                             ),
                                              //                           ],
                                              //                         ),
                                              //                         SizedBox(
                                              //                           height:
                                              //                           30.h,
                                              //                         ),
                                              //                       ],
                                              //                     ),
                                              //                   ],
                                              //                 ),
                                              //                 VerticalDivider(
                                              //                   color: Colors
                                              //                       .black,
                                              //                 ),
                                              //                 Column(
                                              //                   children: [
                                              //                     SizedBox(
                                              //                       height:
                                              //                       30.h,
                                              //                     ),
                                              //                     Column(
                                              //                       crossAxisAlignment:
                                              //                       CrossAxisAlignment
                                              //                           .start,
                                              //                       children: [
                                              //                         Row(
                                              //                           children: [
                                              //                             Container(
                                              //                               width:
                                              //                               130.w,
                                              //                               child:
                                              //                               Text(
                                              //                                 "Day 2: lorem ipsum",
                                              //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                              //                               ),
                                              //                             ),
                                              //                           ],
                                              //                         ),
                                              //                         SizedBox(
                                              //                           height:
                                              //                           10.h,
                                              //                         ),
                                              //                         Row(
                                              //                           children: [
                                              //                             Container(
                                              //                               width:
                                              //                               130.w,
                                              //                               child:
                                              //                               Text(
                                              //                                 "Hotel:  ${server1.itineries![1].hotelName.toString()}",
                                              //                                    //${snapshots.data!.data![1].itineries![1].hotelName.toString()}",
                                              //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                              //                               ),
                                              //                             ),
                                              //                           ],
                                              //                         ),
                                              //                         SizedBox(
                                              //                           height:
                                              //                           10.h,
                                              //                         ),
                                              //                         Row(
                                              //                           children: [
                                              //                             Container(
                                              //                               width:
                                              //                               130.w,
                                              //                               child:
                                              //                               Text(
                                              //                                 "Activity:${server1.itineries![1].activity.toString()}" ,
                                              //                                    //${snapshots.data!.data![1].itineries![1].activity.toString()}",
                                              //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                              //                               ),
                                              //                             ),
                                              //                           ],
                                              //                         ),
                                              //                         SizedBox(
                                              //                           height:
                                              //                           30.h,
                                              //                         ),
                                              //                       ],
                                              //                     ),
                                              //                   ],
                                              //                 ),
                                              //               ],
                                              //             ),
                                              //           ),
                                              //         ],
                                              //       )),
                                              //   Container(
                                              //       child: Column(
                                              //         children: [
                                              //           SizedBox(
                                              //             height: 40.h,
                                              //           ),
                                              //           Padding(
                                              //             padding:
                                              //             EdgeInsets.only(
                                              //                 right: 20.w,
                                              //                 left: 20.w),
                                              //             child: Row(
                                              //               mainAxisAlignment:
                                              //               MainAxisAlignment
                                              //                   .spaceEvenly,
                                              //               children: [
                                              //                 Column(
                                              //                   children: [
                                              //                     SizedBox(
                                              //                       height:
                                              //                       30.h,
                                              //                     ),
                                              //                     Column(
                                              //                       crossAxisAlignment:
                                              //                       CrossAxisAlignment
                                              //                           .start,
                                              //                       children: [
                                              //                         Row(
                                              //                           children: [
                                              //                             Container(
                                              //                               width:
                                              //                               130.w,
                                              //                               child:
                                              //                               Text(
                                              //                                 "Day 1: lorem ipsum",
                                              //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                              //                               ),
                                              //                             ),
                                              //                           ],
                                              //                         ),
                                              //                         SizedBox(
                                              //                           height:
                                              //                           10.h,
                                              //                         ),
                                              //                         Row(
                                              //                           children: [
                                              //                             Container(
                                              //                               width:
                                              //                               130.w,
                                              //                               child:
                                              //                               Text(
                                              //                                 "Hotel: ${server.itineries![2].hotelName.toString()}",
                                              //                                   //${snapshots.data!.data![0].itineries![0].hotelName.toString()}",
                                              //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                              //                               ),
                                              //                             ),
                                              //                           ],
                                              //                         ),
                                              //                         SizedBox(
                                              //                           height:
                                              //                           10.h,
                                              //                         ),
                                              //                         Row(
                                              //                           children: [
                                              //                             Container(
                                              //                               width:
                                              //                               130.w,
                                              //                               child:
                                              //                               Text(
                                              //                                 "Activity: ${server.itineries![2].activity.toString()}",
                                              //                                   //${snapshots.data!.data![0].itineries![0].activity.toString()}",
                                              //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                              //                               ),
                                              //                             ),
                                              //                           ],
                                              //                         ),
                                              //                         SizedBox(
                                              //                           height:
                                              //                           30.h,
                                              //                         ),
                                              //                       ],
                                              //                     ),
                                              //                   ],
                                              //                 ),
                                              //                 VerticalDivider(
                                              //                   color: Colors
                                              //                       .black,
                                              //                 ),
                                              //                 Column(
                                              //                   children: [
                                              //                     SizedBox(
                                              //                       height:
                                              //                       30.h,
                                              //                     ),
                                              //                     Column(
                                              //                       crossAxisAlignment:
                                              //                       CrossAxisAlignment
                                              //                           .start,
                                              //                       children: [
                                              //                         Row(
                                              //                           children: [
                                              //                             Container(
                                              //                               width:
                                              //                               130.w,
                                              //                               child:
                                              //                               Text(
                                              //                                 "Day 1: lorem ipsum",
                                              //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                              //                               ),
                                              //                             ),
                                              //                           ],
                                              //                         ),
                                              //                         SizedBox(
                                              //                           height:
                                              //                           10.h,
                                              //                         ),
                                              //                         Row(
                                              //                           children: [
                                              //                             Container(
                                              //                               width:
                                              //                               130.w,
                                              //                               child:
                                              //                               Text(
                                              //                                 "Hotel: ${server1.itineries![2].hotelName.toString()}" ,
                                              //                                    //${snapshots.data!.data![1].itineries![1].hotelName.toString()}",
                                              //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                              //                               ),
                                              //                             ),
                                              //                           ],
                                              //                         ),
                                              //                         SizedBox(
                                              //                           height:
                                              //                           10.h,
                                              //                         ),
                                              //                         Row(
                                              //                           children: [
                                              //                             Container(
                                              //                               width:
                                              //                               130.w,
                                              //                               child:
                                              //                               Text(
                                              //                                 "Activity:  ${server1.itineries![2].activity.toString()}",
                                              //                                  //${snapshots.data!.data![1].itineries![1].activity.toString()}",
                                              //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                              //                               ),
                                              //                             ),
                                              //                           ],
                                              //                         ),
                                              //                         SizedBox(
                                              //                           height:
                                              //                           30.h,
                                              //                         ),
                                              //                       ],
                                              //                     ),
                                              //                   ],
                                              //                 ),
                                              //               ],
                                              //             ),
                                              //           ),
                                              //         ],
                                              //       )),
                                              //   Container(
                                              //       child: Column(
                                              //         children: [
                                              //           SizedBox(
                                              //             height: 40.h,
                                              //           ),
                                              //           Padding(
                                              //             padding:
                                              //             EdgeInsets.only(
                                              //                 right: 20.w,
                                              //                 left: 20.w),
                                              //             child: Row(
                                              //               mainAxisAlignment:
                                              //               MainAxisAlignment
                                              //                   .spaceEvenly,
                                              //               children: [
                                              //                 Column(
                                              //                   children: [
                                              //                     SizedBox(
                                              //                       height:
                                              //                       30.h,
                                              //                     ),
                                              //                     Column(
                                              //                       crossAxisAlignment:
                                              //                       CrossAxisAlignment
                                              //                           .start,
                                              //                       children: [
                                              //                         Row(
                                              //                           children: [
                                              //                             Container(
                                              //                               width:
                                              //                               130.w,
                                              //                               child:
                                              //                               Text(
                                              //                                 "Day 1: lorem ipsum",
                                              //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                              //                               ),
                                              //                             ),
                                              //                           ],
                                              //                         ),
                                              //                         SizedBox(
                                              //                           height:
                                              //                           10.h,
                                              //                         ),
                                              //                         Row(
                                              //                           children: [
                                              //                             Container(
                                              //                               width:
                                              //                               130.w,
                                              //                               child:
                                              //                               Text(
                                              //                                 "Hotel: Ahmedabad",
                                              //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                              //                               ),
                                              //                             ),
                                              //                           ],
                                              //                         ),
                                              //                         SizedBox(
                                              //                           height:
                                              //                           10.h,
                                              //                         ),
                                              //                         Row(
                                              //                           children: [
                                              //                             Container(
                                              //                               width:
                                              //                               130.w,
                                              //                               child:
                                              //                               Text(
                                              //                                 "Activity: Ipsum Lorem",
                                              //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                              //                               ),
                                              //                             ),
                                              //                           ],
                                              //                         ),
                                              //                         SizedBox(
                                              //                           height:
                                              //                           30.h,
                                              //                         ),
                                              //                       ],
                                              //                     ),
                                              //                   ],
                                              //                 ),
                                              //                 VerticalDivider(
                                              //                   color: Colors
                                              //                       .black,
                                              //                 ),
                                              //                 Column(
                                              //                   children: [
                                              //                     SizedBox(
                                              //                       height:
                                              //                       30.h,
                                              //                     ),
                                              //                     Column(
                                              //                       crossAxisAlignment:
                                              //                       CrossAxisAlignment
                                              //                           .start,
                                              //                       children: [
                                              //                         Row(
                                              //                           children: [
                                              //                             Container(
                                              //                               width:
                                              //                               130.w,
                                              //                               child:
                                              //                               Text(
                                              //                                 "Day 1: lorem ipsum",
                                              //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                              //                               ),
                                              //                             ),
                                              //                           ],
                                              //                         ),
                                              //                         SizedBox(
                                              //                           height:
                                              //                           10.h,
                                              //                         ),
                                              //                         Row(
                                              //                           children: [
                                              //                             Container(
                                              //                               width:
                                              //                               130.w,
                                              //                               child:
                                              //                               Text(
                                              //                                 "Hotel: Ahmedabad",
                                              //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                              //                               ),
                                              //                             ),
                                              //                           ],
                                              //                         ),
                                              //                         SizedBox(
                                              //                           height:
                                              //                           10.h,
                                              //                         ),
                                              //                         Row(
                                              //                           children: [
                                              //                             Container(
                                              //                               width:
                                              //                               130.w,
                                              //                               child:
                                              //                               Text(
                                              //                                 "Activity: Ipsum Lorem",
                                              //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                              //                               ),
                                              //                             ),
                                              //                           ],
                                              //                         ),
                                              //                         SizedBox(
                                              //                           height:
                                              //                           30.h,
                                              //                         ),
                                              //                       ],
                                              //                     ),
                                              //                   ],
                                              //                 ),
                                              //               ],
                                              //             ),
                                              //           ),
                                              //         ],
                                              //       )),
                                              // ]

                                              ),
                                        ),
                                      ],
                                    ))
                                  ],
                                )
                              ],
                            ))
                      ],
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Widget customTab({
    required String text,
    required int index,
    required int currentIndex,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      alignment: Alignment.center,
      height: 5.h,
      // color: Colors.grey,
      // decoration: index == currentIndex
      //     ? BoxDecoration(
      //         borderRadius: BorderRadius.circular(5),
      //         color: Color(0xff09646D),
      //       )
      //     : BoxDecoration(
      //         borderRadius: BorderRadius.circular(5),
      //         color: Color(0xff71766D),
      //       ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontFamily: "SegoeUI",
            fontWeight: FontWeight.bold,
            // color: Colors.white
          ),
        ),
      ),
    );
  }
}
