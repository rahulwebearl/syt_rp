import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:syt/Api.dart';
import 'package:syt/models/chechkbox_model.dart';
import 'package:syt/models/display_userbid_model.dart';
import 'package:syt/screens/biddetails.dart';
import 'package:syt/screens/comparebids.dart';

class ShowPackages extends StatefulWidget {
  ShowPackages({Key? key, required this.trip_id}) : super(key: key);
  var trip_id;
  @override
  State<ShowPackages> createState() => _ShowPackagesState();
}

class _ShowPackagesState extends State<ShowPackages> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  var getbid_id = "";
  var departure = "";
  var destination = "";
  var adult = "";
  var childe = "";
  var infant = "";
  var care = "";
  var fristid = "";
  var fristprice = "";
  var fristagency = "";
  var fristdate = "";
  var secondid = "";
  var secondprice = "";
  var secondagency = "";
  var seconddate = "";
  var tripId = "";
  var agencyid = "";
  // String id = "63107fc93f5ce620fc00cfeb";
  // var therddid ="";
  //  var therdprice = "";
  //  var therdagency = "";
  //  var therddate = "";
  String star = "";
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var selectedIndexs = [];
  List<CheckboxModel> checkboxList = [];
  String rating_no = "0.0";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();
  }

  var sid = "63be58033aef9c9893d48bbd";

  void loaddata() async {
    final SharedPreferences prefs = await _prefs;

    getbid_id = (prefs.getString("customid")) ?? "";
    departure = (prefs.getString("departure")) ?? "";
    destination = (prefs.getString("destination")) ?? "";
    adult = (prefs.getString("adult")) ?? "";
    childe = (prefs.getString("childe")) ?? "";
    infant = (prefs.getString("infant")) ?? "";
    care = (prefs.getString("care")) ?? "";
    fristid = (prefs.getString("fristid")) ?? "";
    fristprice = (prefs.getString("fristprice")) ?? "";
    fristagency = (prefs.getString("fristagency")) ?? "";
    fristdate = (prefs.getString("fristdate")) ?? "";
    secondid = (prefs.getString("secondid")) ?? "";
    secondprice = (prefs.getString("secondprice")) ?? "";
    secondagency = (prefs.getString("secondagency")) ?? "";
    seconddate = (prefs.getString("seconddate")) ?? "";
    star = (prefs.getString("star")) ?? "";
    agencyid = (prefs.getString("agencyid")) ?? "";
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
          "Compare Quotes",
          style: TextStyle(
              fontSize: 14,
              fontFamily: "SegoeUI",
              fontWeight: FontWeight.bold,
              color: Color(0xff004351)),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(),
        height: 6.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                print(checkboxList.toString());
                print("hiiiiiiiiiiiiiiiiiii");
                print(selectedIndexs.length);
                print(selectedIndexs);

                if (checkboxList.length == 2) {
                  print("--------------->>>> ashok");
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CompareBids(
                            checkboxList[0].id,
                            checkboxList[0].agency,
                            checkboxList[0].date,
                            checkboxList[0].price,
                            checkboxList[1].id,
                            checkboxList[1].agency,
                            checkboxList[1].date,
                            checkboxList[1].price,
                          )));
                } else {
                  // for(var i=0;i<=checkboxList.length;i++){
                  //   print(checkboxList[i].agency+ "agency - added ");
                  // }
                  Fluttertoast.showToast(
                    msg: "Please select at least 2 items",
                    backgroundColor: Color(0xff005C63),
                    textColor: Colors.white,
                  );
                }

                // (checkbox == true && checkbox2 == true)
                //     ? Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => CompareBids()))
                //     : Fluttertoast.showToast(
                //   msg: "Please select at least 2 items",
                //   backgroundColor: Color(0xff005C63),
                //   textColor: Colors.white,
                // );
              },
              child: Container(
                height: 4.h,
                width: 37.w,
                decoration: BoxDecoration(
                  color: Color(0xff09646D),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 3, offset: Offset(1, 2))
                  ],
                ),
                child: Center(
                  child: Text(
                    "Compare Quotes",
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
      body: Column(children: [
        // SizedBox(
        //   height: 5.h,
        // ),
        /// [divider]
        Container(
          width: 15.w,
          child: Divider(
            color: Colors.grey.shade200,
            height: 2.h,
            thickness: 1,
          ),
        ),

        /// [text]
        Center(
          child: Text(
            "You can compare maximum two Quotes",
            style: TextStyle(
                fontSize: 12,
                fontFamily: "SegoeUI",
                fontWeight: FontWeight.bold,
                color: Color(0xff7F7F7F)),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),

        /// [bid packages ❤️❤️❤️❤️]
        FutureBuilder<display_userbid_model>(
            future: Display_userbid().userbidlist(widget.trip_id),
            builder: (context, snapshots) {
              print(getbid_id + "chirag...>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
              var data = snapshots.data?.data;
              if (snapshots.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              } else if (data != null) {
                return SingleChildScrollView(
                  child: SizedBox(
                    height: 70.h,
                    // height: MediaQuery.of(context).size.height * 0.29,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(parent: null),
                        scrollDirection: Axis.vertical,
                        itemCount: snapshots.data!.data!.length,
                        itemBuilder: (context, index) {
                          print("❤️❤️❤️❤️" +
                              snapshots.data!.data!.length.toString());
                          var server1 = snapshots.data!.data![index];
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom: 10, left: 10, right: 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.85,
                              // color: Colors.orange,
                              child: InkWell(
                                onTap: () async {
                                  var agencyname = server1.agency.toString();
                                  var agencyprice = server1.price.toString();
                                  var agencydate = server1.date.toString();
                                  var agencyid = server1.sId.toString();

                                  print(agencyname +
                                      "<><><>><><><><><><><><><><><><><><><aaaaaaaaaaaaaaaaaaaaaaaaaa");
                                  print(agencyprice +
                                      "<><><>><><><><><><><><><><><><><><><");
                                  print(agencydate +
                                      "<><><>><><><><><><><><><><><><><><><");
                                  print(agencyid +
                                      "<><><>><><><><><><><><><><><><><><><");

                                  final SharedPreferences prefs = await _prefs;
                                  prefs.setString("agencyname", agencyname);
                                  prefs.setString("agencyprice", agencyprice);
                                  prefs.setString("agencydate", agencydate);
                                  prefs.setString("agencyid", agencyid);

                                  String controlbt = "";
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => BidDetails(
                                          departure,
                                          destination,
                                          adult,
                                          childe,
                                          infant,
                                          care,
                                          agencyid,
                                          agencyname,
                                          agencydate,
                                          controlbt.toString(),
                                          agencyprice)));
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 16.h,
                                      // width: 360.w,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 3,
                                              offset: Offset(1, 2))
                                        ],
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0xff047B99),
                                              Color(0xff023E4D),
                                            ]),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 8, left: 20, bottom: 9),
                                            child: Row(
                                              children: [
                                                ///[travels name]
                                                Text(
                                                  //"Agency: NR Travels",
                                                  server1.agency.toString(),
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: "SegoeUI",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 20, bottom: 8),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  ///[price]
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Price:",
                                                        //server1.price.toString(),
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontFamily:
                                                                "SegoeUI",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      Text(
                                                        //" ₹ 22,000",
                                                        " ₹ " +
                                                            server1.price
                                                                .toString(),
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontFamily:
                                                                "SegoeUI",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color(
                                                                0xff69FF87)),
                                                      ),
                                                    ],
                                                  ),

                                                  /// [rating bar]
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 17.w),
                                                    child: RatingBar.builder(
                                                      ignoreGestures: true,
                                                      itemSize: 20,
                                                      initialRating: 5.0,
                                                      //  double.parse("${star[index]}")
                                                      //double.parse("${snapshots.data?.data?[index].star?[index].toString()}")
                                                      //!= null ?
                                                      //.parse("${star[index]}")
                                                      // double.parse("${snapshots.data?.data?[index].star?[index].toString()}")
                                                      // :double.parse("0.0"),
                                                      // double.parse("${snapshots.data?.data?[index].star?[index].toString()??""}"),

                                                      minRating: 1,
                                                      direction:
                                                          Axis.horizontal,
                                                      allowHalfRating: true,
                                                      itemCount: 5,
                                                      itemBuilder:
                                                          (context, _) => Icon(
                                                        Icons.star_rate_rounded,
                                                        color: Colors.white,
                                                      ),
                                                      onRatingUpdate: (star) {
                                                        rating_no =
                                                            star.toString();
                                                      },
                                                    ),
                                                  ),
                                                ]),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: 20,
                                              right: 50,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  // "Date: 25/11/2021",
                                                  server1.date.toString(),
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: "SegoeUI",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  "Total Reviews: ${star}",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: "SegoeUI",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          )
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 50,
                                      right: 15,
                                      child: Container(
                                        height: 3.h,
                                        width: 6.w,
                                        color: Colors.white,
                                        child: StatefulBuilder(
                                          builder: (context, setState) =>
                                              Checkbox(
                                            splashRadius: 5,
                                            value:
                                                selectedIndexs.contains(index),
                                            activeColor: Color(0xff0A6A73),
                                            onChanged: (value) {
                                              setState(() {});
                                              if (selectedIndexs
                                                  .contains(index)) {
                                                // checkboxList.removeAt(index);
                                                selectedIndexs.remove(index);

                                                checkboxList.removeWhere(
                                                    (element) =>
                                                        element.index == index);
                                                print(value.toString() +
                                                    "  value");

                                                print(
                                                    "<-------------selectedIndexs-------------->" +
                                                        selectedIndexs
                                                            .toString());
                                              } else {
                                                selectedIndexs.add(index);
                                                print(value.toString() +
                                                    "  value");

                                                checkboxList.add(CheckboxModel(
                                                    id: server1.sId.toString(),
                                                    price: server1.price
                                                        .toString(),
                                                    agency: server1.agency!
                                                        .toString(),
                                                    date:
                                                        server1.date.toString(),
                                                    index: index));

                                                print(
                                                    "<-------------selectedIndexs-------------->" +
                                                        selectedIndexs
                                                            .toString());
                                                setState(() {
                                                  loaddata();
                                                });
                                              }
                                            },
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
                  ),
                );
              } else if (snapshots.hasError) {
                return Text("Error");
              } else {
                return Text("No bid package available");
              }
            }),
      ]),
    );
  }
}
