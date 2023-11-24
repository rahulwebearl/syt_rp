import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:syt/Api.dart';
import 'package:syt/models/get_destinationdata_model.dart';
import 'package:syt/models/get_pakege_details_modal.dart';
import 'package:syt/screens/bookingScreen.dart';
import 'package:syt/screens/myplaningScreen.dart';

class PackageDetails extends StatefulWidget {
  final String packageId;

  const PackageDetails({Key? key, required this.packageId}) : super(key: key);

  @override
  _PackageDetailsState createState() => _PackageDetailsState();
}

class _PackageDetailsState extends State<PackageDetails> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  var Packages_id = "";
  var getpackagedetails_api = "";
  var destination_id = "";
  var destination_package = "";

  @override
  void initState() {
    super.initState();
    loaddata();
  }

  void loaddata() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      Packages_id = (prefs.getString("Packages_id")) ?? "";
      destination_id = (prefs.getString("destination_id")) ?? "";
      destination_package = (prefs.getString("destination_package")) ?? "";
    });
  }

  var top;
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        FutureBuilder<get_pakege_details_modal>(
            future: GetPackageDetails().pakegedetailsList(widget.packageId),
            builder: (context, snapshots) {
              if (snapshots.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshots.hasData) {
                return ListView.builder(
                    itemCount: snapshots.data?.data?.length,
                    itemBuilder: (context, index) {
                      var server = snapshots.data!.data![index];
                      var text1 = server.moreDetails.toString();
                      var _travelby = server.travelBy.toString();
                      var _mealrequired = server.mealRequired.toString();
                      var _sightseening = server.sightseeing.toString();

                      // print(_travelby + "top");

                      return Container(
                        height: 100.h,
                        child: NestedScrollView(
                          headerSliverBuilder:
                              (BuildContext context, bool innerBoxIsScrolled) {
                            return [
                              SliverAppBar(
                                leading: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Color(0xffffffff),
                                    size: 24,
                                  ),
                                ),
                                titleSpacing: 3.w,
                                floating: true,
                                pinned: true,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(15),
                                        bottomLeft: Radius.circular(15))),
                                backgroundColor: Color(0xff00363D),
                                expandedHeight: 35.h,
                                flexibleSpace: LayoutBuilder(
                                  builder:
                                      (context, BoxConstraints constraints) {
                                    this.top = constraints.biggest.height;
                                    return ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(15),
                                          bottomLeft: Radius.circular(15)),
                                      child: FlexibleSpaceBar(
                                          titlePadding: EdgeInsets.only(
                                              left: (top < 100) ? 50 : 10,
                                              bottom: (top < 100) ? 20 : 10),
                                          title: Text(
                                            //"CANADA",
                                            server.name.toString(),
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: "SegoeUI",
                                                fontStyle: FontStyle.italic,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white
                                                    .withOpacity(0.7)),
                                          ),
                                          // background: Image.asset("assets/Baga Beach.jpg", fit: BoxFit.fill),
                                          background: CachedNetworkImage(
                                            fit: BoxFit.fill,
                                            errorWidget:
                                                (context, url, error) =>
                                                    Text(""),
                                            imageUrl: server.place![index].photo
                                                .toString(),
                                          )

                                          // Image.network(
                                          //     server.place![index].photo
                                          //         .toString(),
                                          //     fit: BoxFit.fill),

                                          ),
                                    );
                                  },
                                ),
                              )
                            ];
                          },
                          body: Stack(
                            fit: StackFit.expand,
                            children: [
                              Container(
                                color: Colors.white,
                                child: ListView(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          // margin: EdgeInsets.only(right: 10.w),
                                          // height: 280.h,
                                          width: 100.w,
                                          // color: Colors.orange,
                                          child: Column(
                                            children: [
                                              SizedBox(height: 1.5.h),
                                              Row(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        left: 0.5.h),
                                                    //height: 50.h,
                                                    width: 90.w,
                                                    // color: Colors.red,
                                                    child: Text(
                                                      //"Canada Package with CN Tower Tour",
                                                      server.name.toString(),
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontFamily: "SegoeUI",
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 6.w,
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 0.5.h),
                                                    child: Text(
                                                      // "₹ 2,50,000/-",
                                                      "₹" +
                                                          server.pricePerPerson
                                                              .toString() +
                                                          "/Person",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily: "SegoeUI",
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                  // Icon(
                                                  //   Icons.star,
                                                  //   color: Color(0xff1F08B1),
                                                  //   size: 20,
                                                  // ),
                                                  // Icon(
                                                  //   Icons.star,
                                                  //   color: Color(0xff1F08B1),
                                                  //   size: 20.sp,
                                                  // ),
                                                  // Icon(
                                                  //   Icons.star,
                                                  //   color: Color(0xff1F08B1),
                                                  //   size: 20.sp,
                                                  // ),
                                                  // Icon(
                                                  //   Icons.star,
                                                  //   color: Color(0xff1F08B1),
                                                  //   size: 20.sp,
                                                  // ),
                                                  // Icon(
                                                  //   Icons.star_border,
                                                  //   color: Color(0xff1F08B1),
                                                  //   size: 20.sp,
                                                  // ),
                                                  // Text(
                                                  //   "(2074)",
                                                  //   style: TextStyle(
                                                  //       fontSize: 16.sp,
                                                  //       fontFamily: "SegoeUI",
                                                  //       fontWeight: FontWeight.bold,
                                                  //       color: Colors.grey),
                                                  // ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 1.5.h),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          // "7D-6N",
                                                          server.day.toString(),
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  "SegoeUI",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.grey),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 25),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Icon(
                                                          Icons.home_filled,
                                                          color:
                                                              Color(0xff09646D),
                                                          size: 24,
                                                        ),
                                                        Text(
                                                          //"Upto 3 Stars",
                                                          "Upto " +
                                                              server.hotelType
                                                                  .toString(),
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  "SegoeUI",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.grey),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        if (_travelby ==
                                                            "Car") ...[
                                                          Icon(
                                                            CupertinoIcons.car,
                                                            color: Color(
                                                                0xff09646D),
                                                            size: 24,
                                                          ),
                                                        ] else if (_travelby ==
                                                            "Flight") ...[
                                                          Icon(
                                                            CupertinoIcons
                                                                .airplane,
                                                            color: Color(
                                                                0xff09646D),
                                                            size: 24,
                                                          ),
                                                        ] else if (_travelby ==
                                                            "Train") ...[
                                                          Icon(
                                                            CupertinoIcons
                                                                .tram_fill,
                                                            color: Color(
                                                                0xff09646D),
                                                            size: 24,
                                                          ),
                                                        ] else if (_travelby ==
                                                            "Bus") ...[
                                                          Icon(
                                                            CupertinoIcons.bus,
                                                            color: Color(
                                                                0xff09646D),
                                                            size: 24,
                                                          ),
                                                        ],
                                                        Text(
                                                          // "Flights",
                                                          "By " +
                                                              server.travelBy
                                                                  .toString(),
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  "SegoeUI",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.grey),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        if (_mealrequired !=
                                                            "") ...[
                                                          Icon(
                                                            Icons.restaurant,
                                                            color: Color(
                                                                0xff09646D),
                                                            size: 24,
                                                          ),
                                                          Text(
                                                            "Meals",
                                                            //server.packages![index].mealRequired.toString(),
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontFamily:
                                                                    "SegoeUI",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                        ] else
                                                          ...[],
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        if (_sightseening !=
                                                            "") ...[
                                                          Icon(
                                                            Icons.map,
                                                            color: Color(
                                                                0xff09646D),
                                                            size: 24,
                                                          ),
                                                          Text(
                                                            "Sightseeing",
                                                            //server.packages![index].sightseeing.toString(),
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontFamily:
                                                                    "SegoeUI",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                        ] else
                                                          ...[],
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              BookingScreen()));
                                                },
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(top: 20),
                                                  height: 35,
                                                  width: 180,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xff09646D),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.grey,
                                                          blurRadius: 3,
                                                          offset: Offset(1, 2))
                                                    ],
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      " Customize Now",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily: "SegoeUI",
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 2.h),
                                              Container(
                                                width: 95.w,
                                                color: Colors.transparent,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      //margin: EdgeInsets.all(10),
                                                      //color: Colors.green,
                                                      child: ExpansionPanelList(
                                                        elevation: 0,
                                                        animationDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    500),
                                                        children: [
                                                          ExpansionPanel(
                                                            headerBuilder:
                                                                (context,
                                                                    isExpanded) {
                                                              return ListTile(
                                                                title: Text(
                                                                  //text1.length > 30 ? "${text1.substring(0, 30)}" : text1,
                                                                  //text1,
                                                                  "Overview",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontFamily:
                                                                        "SegoeUI",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            body: ListTile(
                                                              title: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                        //border: Border.all(width: 1.0)
                                                                        ),
                                                                child: Text(
                                                                  //"sdcfvghjkjhgfgh",
                                                                  text1,
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontFamily:
                                                                        "SegoeUI",
                                                                    //fontWeight: FontWeight.bold,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            isExpanded:
                                                                _expanded,
                                                            canTapOnHeader:
                                                                true,
                                                          ),
                                                        ],
                                                        dividerColor:
                                                            Colors.green,
                                                        expansionCallback:
                                                            (panelIndex,
                                                                isExpanded) {
                                                          _expanded =
                                                              !_expanded;
                                                          setState(() {});
                                                        },
                                                      ),
                                                    ),
                                                    // Text(
                                                    //   text1.length > 200 ?"${text1.substring(0, 200)}": text1,
                                                    //   //"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has beenthe industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and",
                                                    //   // server.moreDetails.toString(),
                                                    //   textAlign: TextAlign.left,
                                                    //   //overflow: TextOverflow.ellipsis,
                                                    //   style: TextStyle(
                                                    //     fontSize: 16.sp,
                                                    //     fontFamily: "SegoeUI",
                                                    //     fontWeight: FontWeight.bold,
                                                    //     color: Colors.black,
                                                    //   ),
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // SizedBox(
                                        //   height: 2.h,
                                        // ),
                                        Divider(
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Text(
                                          "Itinerary",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "SegoeUI",
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2.5.h,
                                        ),
                                        Container(
                                          height: 45.h,
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: snapshots
                                                  .data!
                                                  .data![index]
                                                  .itinaries!
                                                  .length,
                                              itemBuilder: (context, index) {
                                                var text = server
                                                    .itinaries![index].activity
                                                    .toString();
                                                _showDialog() {
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return Dialog(
                                                          insetPadding:
                                                              EdgeInsets.all(0),
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          child: Container(
                                                            height: 60.h,
                                                            child: ListView
                                                                .builder(
                                                                    scrollDirection:
                                                                        Axis
                                                                            .horizontal,
                                                                    itemCount: snapshots
                                                                        .data!
                                                                        .data![
                                                                            0]
                                                                        .itinaries!
                                                                        .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            index) {
                                                                      return Container(
                                                                          margin: EdgeInsets.only(
                                                                              right:
                                                                                  10,
                                                                              left:
                                                                                  10),
                                                                          height: 60
                                                                              .h,
                                                                          width: 92
                                                                              .w,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                            //border: Border.all(color: Color(0xff707070))
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            //   mainAxisAlignment: MainAxisAlignment.center,
                                                                            children: [
                                                                              Container(
                                                                                margin: EdgeInsets.only(right: 10, top: 10, left: 10),
                                                                                height: 15.h,
                                                                                width: 88.w,
                                                                                decoration: BoxDecoration(
                                                                                    //color: Colors.deepPurple,
                                                                                    // image: DecorationImage(
                                                                                    //   fit: BoxFit.fill,
                                                                                    // image: AssetImage("assets/Baga Beach.jpg")
                                                                                    // image: NetworkImage(server.itinaries![index].photo.toString()),
                                                                                    // ),
                                                                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                                                                                  child: CachedNetworkImage(
                                                                                    fit: BoxFit.fill,
                                                                                    errorWidget: (context, url, error) => Text(""),
                                                                                    imageUrl: server.itinaries![index].photo.toString(),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                margin: EdgeInsets.only(left: 5, top: 10),
                                                                                width: 100.w,
                                                                                height: 6.h,
                                                                                child: Text(
                                                                                  //"Canada: Arrival and Free day",
                                                                                  server.itinaries![index].title.toString(),
                                                                                  style: TextStyle(fontSize: 12, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 1.5.h,
                                                                              ),
                                                                              Text(
                                                                                // "Hotel: Ananta",
                                                                                "Hotel: " + server.itinaries![index].hotelName.toString(),
                                                                                style: TextStyle(fontSize: 12, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 2.h,
                                                                              ),
                                                                              Container(
                                                                                width: 88.w,
                                                                                height: 20.h,
                                                                                //color: Colors.red,
                                                                                child: SingleChildScrollView(
                                                                                  scrollDirection: Axis.vertical,
                                                                                  child: Text(
                                                                                    // "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has beenthe industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a type specimen book....Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has beenthe industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a type specimen book......Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has beenthe industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                                                                    server.itinaries![index].activity.toString(),
                                                                                    textAlign: TextAlign.left,
                                                                                    style: TextStyle(
                                                                                        fontSize: 12,
                                                                                        fontFamily: "SegoeUI",
                                                                                        //fontWeight: FontWeight.bold,
                                                                                        color: Colors.black),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 1.5.h,
                                                                              ),
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                children: [
                                                                                  Container(
                                                                                    height: 4.h,
                                                                                    width: 17.w,
                                                                                    decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topLeft: Radius.circular(10))),
                                                                                    child: Center(
                                                                                      child: Text(
                                                                                        //"Day 1",
                                                                                        "Day " + server.itinaries![index].day.toString(),
                                                                                        style: TextStyle(fontSize: 12, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.white),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              )
                                                                            ],
                                                                          ));
                                                                    }),
                                                          ),
                                                        );
                                                      });
                                                }

                                                return Container(
                                                  margin: EdgeInsets.only(
                                                      right: 10,
                                                      bottom: 7,
                                                      left: 10),
                                                  height: 30.h,
                                                  width: 92.w,
                                                  decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.grey,
                                                          blurRadius: 3,
                                                          offset: Offset(0, 2))
                                                    ],
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    //border: Border.all(color: Color(0xff707070))
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Stack(
                                                        children: [
                                                          Container(
                                                            width: 20.w,
                                                            height: 3.5.h,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xff005158),
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          9),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          9)),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                //"Day 1",
                                                                "Day " +
                                                                    server
                                                                        .itinaries![
                                                                            index]
                                                                        .day
                                                                        .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  fontFamily:
                                                                      "SegoeUI",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 3.w,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Container(
                                                                width: 70.w,
                                                                height: 5.h,
                                                                // color: Colors.red,
                                                                decoration:
                                                                    BoxDecoration(
                                                                        color: Color(
                                                                            0xdd1e1e1e),
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(15),
                                                                        )),
                                                                child: Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              10),
                                                                  child: Center(
                                                                    child: Text(
                                                                      //"Canada: Arrival and Free day",
                                                                      server
                                                                          .itinaries![
                                                                              index]
                                                                          .title
                                                                          .toString(),
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        fontFamily:
                                                                            "SegoeUI",
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1.5.h,
                                                      ),
                                                      Container(
                                                        height: 11.h,
                                                        width: 88.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          15),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          15)),
                                                          // image:
                                                          //     DecorationImage(
                                                          //   fit: BoxFit.cover,
                                                          //   //image: AssetImage("assets/Baga Beach.jpg",),
                                                          //   image: NetworkImage(
                                                          //       server
                                                          //           .itinaries![
                                                          //               index]
                                                          //           .photo
                                                          //           .toString()),
                                                          // ),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          15),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          15)),
                                                          child:
                                                              CachedNetworkImage(
                                                            fit: BoxFit.cover,
                                                            errorWidget:
                                                                (context, url,
                                                                        error) =>
                                                                    Text(""),
                                                            imageUrl: server
                                                                .itinaries![
                                                                    index]
                                                                .photo
                                                                .toString(),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 2.h,
                                                      ),
                                                      Container(
                                                        width: 88.w,
                                                        child: Text(
                                                          //"Hotel: Ananta",
                                                          "Hotel : " +
                                                              server
                                                                  .itinaries![
                                                                      index]
                                                                  .hotelName
                                                                  .toString(),

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
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 10,
                                                                right: 25,
                                                                left: 25),
                                                        child: Container(
                                                          height: 12.h,
                                                          width: 88.w,
                                                          //color: Colors.yellow,
                                                          child:
                                                              SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            child: Text(
                                                              text.length > 200
                                                                  ? "${text.substring(0, 200)}"
                                                                  : text,
                                                              //text,
                                                              //"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has beenthe industry's standard dummy text ever sin and Owing to white ",
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontFamily:
                                                                      "SegoeUI",
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              _showDialog();
                                                            },
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          0,
                                                                          15,
                                                                          20,
                                                                          0),
                                                              child: Text(
                                                                "Read More",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  fontFamily:
                                                                      "SegoeUI",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Color(
                                                                      0xffFF0000),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }),
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        Divider(
                                          color: Colors.grey,
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 3.h,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(),
                                              child: Column(
                                                children: [
                                                  ///  [heading : include sevices]
                                                  Text(
                                                    "Include Services",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: "SegoeUI",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  SizedBox(height: 2.h),

                                                  /// [included services]
                                                  ///
                                                  // Container(
                                                  //   height: 25,
                                                  //   color: Colors.blue,
                                                  // ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    // color: Colors.cyan,
                                                    // width: 98.w,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 2.h),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color:
                                                                  Colors.grey,
                                                              blurRadius: 3,
                                                              offset:
                                                                  Offset(1, 2))
                                                        ]),
                                                    child: Expanded(
                                                      child: ListView.builder(
                                                          physics:
                                                              NeverScrollableScrollPhysics(),
                                                          // scrollDirection: Axis.vertical,
                                                          shrinkWrap: true,
                                                          // physics: NeverScrollableScrollPhysics(),
                                                          itemCount: snapshots
                                                              .data!
                                                              .data![index]
                                                              .includeService!
                                                              .length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .only(
                                                                top: 5,
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  SizedBox(
                                                                    width: 7.w,
                                                                  ),
                                                                  Icon(
                                                                    Icons.check,
                                                                    color: Color(
                                                                        0xff079023),
                                                                    size: 16,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 4.w,
                                                                  ),
                                                                  Container(
                                                                    //height: 100.h,bokk
                                                                    width: 70.w,
                                                                    child: Text(
                                                                      //"Spa and relaxation treatment",
                                                                      server
                                                                          .includeService![
                                                                              index]
                                                                          .serviceName
                                                                          .toString(),
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        fontFamily:
                                                                            "SegoeUI",
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        color: Color(
                                                                            0xff079023),
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            );
                                                          }),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 3.h,
                                                  ),

                                                  /// [heading : Exclude service]
                                                  Text(
                                                    "Exclude Services",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: "SegoeUI",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 2.h,
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.all(0),
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    // width: 95.w,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 2.h),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color:
                                                                  Colors.grey,
                                                              blurRadius: 3,
                                                              offset:
                                                                  Offset(1, 2))
                                                        ]),
                                                    child: Expanded(
                                                      child: ListView.builder(
                                                          shrinkWrap: true,
                                                          physics:
                                                              NeverScrollableScrollPhysics(),
                                                          // scrollDirection:
                                                          // Axis.vertical,
                                                          itemCount: snapshots
                                                              .data!
                                                              .data![index]
                                                              .excludeService!
                                                              .length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 10),
                                                              child: Row(
                                                                children: [
                                                                  SizedBox(
                                                                    width: 7.w,
                                                                  ),
                                                                  Icon(
                                                                    Icons.close,
                                                                    color: Color(
                                                                        0xffEE1B1B),
                                                                    size: 16,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 4.w,
                                                                  ),
                                                                  Container(
                                                                    width: 70.w,
                                                                    child: Text(
                                                                      //"Water Activities",
                                                                      server
                                                                          .excludeService![
                                                                              index]
                                                                          .serviceName
                                                                          .toString(),
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        fontFamily:
                                                                            "SegoeUI",
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        color: Color(
                                                                            0xffEE1B1B),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          }),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        Divider(
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Similar Packages",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "SegoeUI",
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        FutureBuilder<
                                                get_destinationdata_model>(
                                            future: GetDestinationData()
                                                .destinationdatalist(
                                                    destination_id),
                                            builder: (context, snapshots) {
                                              return (snapshots.hasData)
                                                  ? Container(
                                                      height: 50.h,
                                                      child: ListView.builder(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemCount: snapshots
                                                              .data!
                                                              .data![index]
                                                              .packages!
                                                              .length,
                                                          //itemCount: 4,
                                                          itemBuilder:
                                                              (context, index) {
                                                            var server1 =
                                                                snapshots.data!
                                                                    .data![0];
                                                            var _travelby =
                                                                server1
                                                                    .packages![
                                                                        index]
                                                                    .travelBy
                                                                    .toString();

                                                            var _mealrequired =
                                                                server1
                                                                    .packages![
                                                                        index]
                                                                    .mealRequired
                                                                    .toString();
                                                            var _sightseening =
                                                                server1
                                                                    .packages![
                                                                        index]
                                                                    .sightseeing
                                                                    .toString();
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          5,
                                                                          5,
                                                                          0,
                                                                          0),
                                                              child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                  Navigator.of(
                                                                          context)
                                                                      .push(MaterialPageRoute(
                                                                          builder: (context) => PackageDetails(
                                                                                packageId: server.sId.toString(),
                                                                              )));
                                                                },
                                                                child:
                                                                    Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          right:
                                                                              10,
                                                                          bottom:
                                                                              7,
                                                                          top:
                                                                              4),
                                                                  height: 34.h,
                                                                  width: 98.w,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          color:
                                                                              Colors.white,
                                                                          borderRadius: BorderRadius.circular(10),
                                                                          // border: Border.all(color: Color(0xff707070)),
                                                                          boxShadow: [
                                                                        BoxShadow(
                                                                            color: Colors
                                                                                .grey,
                                                                            blurRadius:
                                                                                3,
                                                                            offset:
                                                                                Offset(0, 2))
                                                                      ]),
                                                                  child: Column(
                                                                    children: [
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                15,
                                                                            right:
                                                                                15,
                                                                            left:
                                                                                15),
                                                                        height:
                                                                            15.h,
                                                                        width:
                                                                            95.w,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          border:
                                                                              Border.all(color: Color(0xff707070)),
                                                                          borderRadius:
                                                                              BorderRadius.circular(5),
                                                                          // image: DecorationImage(
                                                                          //   fit: BoxFit.fill,
                                                                          //   //image: AssetImage("assets/Baga Beach.jpg")
                                                                          //   image: NetworkImage(server1.packages![index].place.toString()),
                                                                          // )
                                                                        ),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(5),
                                                                          child:
                                                                              CachedNetworkImage(
                                                                            fit:
                                                                                BoxFit.fill,
                                                                            errorWidget: (context, url, error) =>
                                                                                Text(""),
                                                                            imageUrl:
                                                                                server1.packages![index].place.toString(),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsets.only(
                                                                            right:
                                                                                5,
                                                                            left:
                                                                                15,
                                                                            top:
                                                                                10),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Text(
                                                                              "Starting From",
                                                                              style: TextStyle(fontSize: 12, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsets.fromLTRB(
                                                                            15,
                                                                            5,
                                                                            15,
                                                                            0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              //"₹ 2,50,000/ Per Person",
                                                                              "₹ " + server1.packages![index].pricePerPerson.toString() + "/Person",
                                                                              style: TextStyle(fontSize: 12, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                                            ),
                                                                            Text(
                                                                              //"7 D-6 N",
                                                                              server1.packages![index].days.toString(),
                                                                              style: TextStyle(fontSize: 12, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.grey),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.only(top: 35),
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          children: [
                                                                            Column(
                                                                              children: [
                                                                                Icon(Icons.home_filled, color: Color(0xff09646D), size: 24),
                                                                                Text(
                                                                                  //"Upto 3 Stars",
                                                                                  "Upto " + server1.packages![index].hotelType.toString(),
                                                                                  style: TextStyle(fontSize: 12, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.grey),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Column(
                                                                              children: [
                                                                                // Icon(Icons.airplanemode_active,color: Color(0xff4D2981),size:28.sp),
                                                                                // Text(
                                                                                //   "Flights",
                                                                                //   //"By "+server.packages![index].travelBy.toString(),
                                                                                //   style: TextStyle(
                                                                                //       fontSize: 16,
                                                                                //       fontFamily: "SegoeUI",
                                                                                //       fontWeight: FontWeight.bold,
                                                                                //       color: Colors.grey),
                                                                                // ),
                                                                                if (_travelby == "Car") ...[
                                                                                  Icon(
                                                                                    CupertinoIcons.car,
                                                                                    color: Color(0xff09646D),
                                                                                    size: 24,
                                                                                  ),
                                                                                ] else if (_travelby == "Flight") ...[
                                                                                  Icon(
                                                                                    CupertinoIcons.airplane,
                                                                                    color: Color(0xff09646D),
                                                                                    size: 24,
                                                                                  ),
                                                                                ] else if (_travelby == "Train") ...[
                                                                                  Icon(
                                                                                    CupertinoIcons.tram_fill,
                                                                                    color: Color(0xff09646D),
                                                                                    size: 24,
                                                                                  ),
                                                                                ] else if (_travelby == "Bus") ...[
                                                                                  Icon(
                                                                                    CupertinoIcons.bus,
                                                                                    color: Color(0xff09646D),
                                                                                    size: 24,
                                                                                  ),
                                                                                ],
                                                                                Text(
                                                                                  //"Flights",
                                                                                  "By " + server1.packages![index].travelBy.toString(),
                                                                                  style: TextStyle(fontSize: 12, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.grey),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Column(
                                                                              children: [
                                                                                if (_mealrequired != "") ...[
                                                                                  Icon(
                                                                                    Icons.restaurant,
                                                                                    color: Color(0xff09646D),
                                                                                    size: 24,
                                                                                  ),
                                                                                  Text(
                                                                                    "Meals",
                                                                                    //server.packages![index].mealRequired.toString(),
                                                                                    style: TextStyle(fontSize: 12, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.grey),
                                                                                  ),
                                                                                ] else
                                                                                  ...[],
                                                                              ],
                                                                            ),
                                                                            Column(
                                                                              children: [
                                                                                // Icon(
                                                                                //     Icons.map,
                                                                                //     color: Color(0xff4D2981),
                                                                                //     size:28.sp
                                                                                // ),
                                                                                // Text(
                                                                                //   "Sightseeing",
                                                                                //   //server.packages![index].sightseeing.toString(),
                                                                                //   style: TextStyle(
                                                                                //       fontSize: 16.sp,
                                                                                //       fontFamily: "SegoeUI",
                                                                                //       fontWeight: FontWeight.bold,
                                                                                //       color: Colors.grey),
                                                                                // ),

                                                                                if (_sightseening != "") ...[
                                                                                  Icon(
                                                                                    Icons.map,
                                                                                    color: Color(0xff09646D),
                                                                                  ),
                                                                                  Text(
                                                                                    "Sightseeing",
                                                                                    //server.packages![index].sightseeing.toString(),
                                                                                    style: TextStyle(fontSize: 12, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.grey),
                                                                                  ),
                                                                                ] else
                                                                                  ...[],
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .push(MaterialPageRoute(builder: (context) => MyPlaniing()));
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          margin:
                                                                              EdgeInsets.only(top: 25),
                                                                          height:
                                                                              4.h,
                                                                          width:
                                                                              70.w,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xff09646D),
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                            boxShadow: [
                                                                              BoxShadow(color: Colors.grey, blurRadius: 3, offset: Offset(1, 2))
                                                                            ],
                                                                          ),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.only(bottom: 2),
                                                                              child: Text(
                                                                                "Customize & Get Quote",
                                                                                style: TextStyle(fontSize: 12, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.white),
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
                                                          }),
                                                    )
                                                  : Center(
                                                      child:
                                                          CircularProgressIndicator());
                                            }),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ],
    ));
  }
}
