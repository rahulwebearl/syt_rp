import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:syt/models/get_destinationdata_model.dart';
import 'package:syt/screens/packagedetailsScreen.dart';
import 'package:syt/Api.dart';

import 'myplaningScreen.dart';

class top_trading_packages_viewall extends StatefulWidget {
  const top_trading_packages_viewall({Key? key}) : super(key: key);

  @override
  State<top_trading_packages_viewall> createState() =>
      _top_trading_packages_viewallState();
}

class _top_trading_packages_viewallState
    extends State<top_trading_packages_viewall> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  //var Packages_id = "";
  var destination_id = "";

  @override
  void initState() {
    super.initState();
    loaddata();
  }

  void loaddata() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      //Packages_id = (prefs.getString("Packages_id"))!;
      destination_id = (prefs.getString("destination_id"))!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          "Packages",
          style: TextStyle(
              fontSize: 14,
              fontFamily: "SegoeUI",
              fontWeight: FontWeight.bold,
              color: Color(0xff004351)),
        ),
        centerTitle: true,
      ),
      body: destination_id != ""
          ? FutureBuilder<get_destinationdata_model>(
              future: GetDestinationData().destinationdatalist(destination_id),
              builder: (context, snapshot) {
                return (snapshot.hasData)
                    ? ListView.builder(
                        itemCount: snapshot.data?.data?.length,
                        itemBuilder: (context, index) {
                          var server = snapshot.data?.data?[index];
                          var _travelby =
                              snapshot.data?.data?[index].packages![0].travelBy;
                          return Container(
                            child: InkWell(
                              onTap: () async {
                                SharedPreferences pref =
                                    await SharedPreferences.getInstance();
                                pref.setString("Packages_id",
                                    server!.packages![0].sId.toString());

                                if (server.packages?[0].sId != null) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => PackageDetails(
                                            packageId: server.packages![0].sId
                                                .toString(),
                                          )));
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    right: 3.w,
                                    bottom: 0.5.h,
                                    top: 0.4.h,
                                    left: 2.h),
                                // height: 40.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    // border: Border.all(color: Color(0xff707070)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 3,
                                          offset: Offset(0, 2))
                                    ]),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 2.h, right: 1.w, left: 1.w),
                                      height: 13.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xff707070)),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            //image: AssetImage("assets/Baga Beach.jpg")
                                            image: NetworkImage(server!
                                                .packages![index].place
                                                .toString()),
                                          )),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: 1.w, left: 4.w, top: 2.h),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Starting From",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: "SegoeUI",
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          4.w, 0.5.h, 1.5.w, 0.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            //"₹ 2,50,000/ Per Person",
                                            "₹ " +
                                                server.packages![index]
                                                    .pricePerPerson
                                                    .toString() +
                                                "/Person",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: "SegoeUI",
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(right: 2.h),
                                            child: Text(
                                              //"7 D-6 N",
                                              server.packages![index].days
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: "SegoeUI",
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 3.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            width: 22.w,
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.home_filled,
                                                  color: Color(0xff09646D),
                                                ),
                                                SizedBox(
                                                  height: 0.5.h,
                                                ),
                                                Text(
                                                  //"Upto 3 Stars",
                                                  "Upto " +
                                                      server.packages![index]
                                                          .hotelType
                                                          .toString(),
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: "SegoeUI",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 22.w,
                                            child: Column(
                                              children: [
                                                if (_travelby == "Car") ...[
                                                  Icon(
                                                    CupertinoIcons.car,
                                                    color: Color(0xff09646D),
                                                    size: 24,
                                                  ),
                                                ] else if (_travelby ==
                                                    "Flight") ...[
                                                  Icon(
                                                    CupertinoIcons.airplane,
                                                    color: Color(0xff09646D),
                                                    size: 24,
                                                  ),
                                                ] else if (_travelby ==
                                                    "Train") ...[
                                                  Icon(
                                                    CupertinoIcons.tram_fill,
                                                    color: Color(0xff09646D),
                                                    size: 24,
                                                  ),
                                                ] else if (_travelby ==
                                                    "train") ...[
                                                  Icon(
                                                    CupertinoIcons.tram_fill,
                                                    color: Color(0xff09646D),
                                                    size: 24,
                                                  ),
                                                ] else if (_travelby ==
                                                    "Bus") ...[
                                                  Icon(
                                                    CupertinoIcons.bus,
                                                    color: Color(0xff09646D),
                                                    size: 24,
                                                  ),
                                                ],
                                                Text(
                                                  // "Flights",
                                                  "By " +
                                                      server.packages![index]
                                                          .travelBy
                                                          .toString(),
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: "SegoeUI",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 22.w,
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.restaurant,
                                                  color: Color(0xff09646D),
                                                ),
                                                Text(
                                                  //"Meals",
                                                  server.packages![index]
                                                      .mealRequired
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: "SegoeUI",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 22.w,
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.map,
                                                  color: Color(0xff09646D),
                                                ),
                                                Text(
                                                  //"Sightseeing",
                                                  server.packages![index]
                                                      .sightseeing
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: "SegoeUI",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MyPlaniing()));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            top: 3.h, bottom: 2.h),
                                        height: 5.h,
                                        width: 70.w,
                                        decoration: BoxDecoration(
                                          color: Color(0xff09646D),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 3,
                                                offset: Offset(1, 2))
                                          ],
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 2),
                                            child: Text(
                                              "Customize & Get Quote",
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
                              ),
                            ),
                          );
                        })
                    : Center(child: CircularProgressIndicator());
              })
          : CircularProgressIndicator(),
    );
  }
}
