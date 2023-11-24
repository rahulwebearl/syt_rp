import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syt/screens/biddetails.dart';
import 'package:syt/screens/show_package.dart';

import '../Api.dart';
import '../models/get_bookpakeges_model.dart';
import '../models/submit_review_model.dart';

class BookedPackages extends StatefulWidget {
  @override
  _BookedPackagesState createState() => _BookedPackagesState();
}

class _BookedPackagesState extends State<BookedPackages> {
  String total_adult = "";
  String total_infant = "";
  String total_child = "";
  String Id = "";
  // String star = "";
  var userdata = [];

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  double height = 220.h;
  void _showRatingDialog() {
    final _dialog = RatingDialog(
      initialRating: 1,
      // your app's name?
      title: Text(
        'Rating Dialog',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),

      // encourage your user to leave a high rating?
      message: Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style: TextStyle(
          // color: Colors.black,
          fontSize: 15,
        ),
      ),
      // your app's logo?
      image: Image.asset("assets/splsscreen (2).png", height: 100),

      submitButtonText: 'Submit',
      commentHint: 'Set your custom comment hint',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) async {
        String book_package_id = Id;
        String star = response.rating.toString();
        String comment_box = response.comment.toString();
        print(book_package_id + "aaaaaaaaaaaaaaaaaaaaaa");
        print(star + "aaaaaaaaaaaaaaaaaaaaaa");
        print(comment_box + "aaaaaaaaaaaaaaaaaaaaaa");

        final SharedPreferences prefs = await _prefs;
        prefs.setString("star", star);
        print(star.toString() + "0000000000000");

        submit_review_model data = await submitreview()
            .submitreviewlist(book_package_id, star, comment_box);

        // print('rating: ${response.rating}, comment: ${response.comment}');

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(" Submit Your Successfully Review ..."),
          backgroundColor: Colors.green,
        ));
      },
    );

    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => _dialog,
      //useSafeArea: true,
    );
  }

  var totalperson;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loaddata();
  }

  void loaddata() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      total_adult = (prefs.getString("total_adult")) ?? "";
      total_infant = (prefs.getString("total_infant")) ?? "";
      total_child = (prefs.getString("total_child")) ?? "";
      Id = (prefs.getString("Id")) ?? "";

      print(total_adult.toString() + "000000000000");
      print(total_infant.toString() + "00000000000");
      print(total_child.toString() + "0000000000000");
      print(Id.toString() + "0000000000000");
    });
  }

  _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.w),
              ),
              child: Container(
                height: 350.h,
                width: 300.w,
                child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "why do you want to cancel your package?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "SegoeUI",
                              fontWeight: FontWeight.bold,
                              color: Color(0xff004351)),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.w),
                          child: TextFormField(
                            maxLines: 5,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "reason is required";
                              }
                            },
                            controller: _Reason,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff0A6A73),
                                  ),
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                  //borderSide: BorderSide(color: Color(0xff0A6A73)),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r)),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                hintText: "Your Reason"),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                if (!_formkey.currentState!.validate()) {
                                  setState(() {
                                    height = 10.h;
                                  });
                                  return;
                                } else {
                                  setState(() {
                                    request = "cancel";
                                    print(request);
                                    Fluttertoast.showToast(
                                      msg:
                                          "Your Cancel request has been submitted,we will contact you soon ",
                                      backgroundColor: Color(0xff09646D),
                                      textColor: Colors.white,
                                    );
                                  });

                                  Navigator.of(context).pop();
                                }
                              },
                              child: Container(
                                height: 35.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  color: Color(0xff09646D),
                                  borderRadius: BorderRadius.circular(10.r),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 3.r,
                                        offset: Offset(1, 2))
                                  ],
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 2.h),
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                height: 35.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  color: Color(0xff09646D),
                                  borderRadius: BorderRadius.circular(10.r),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 3.r,
                                        offset: Offset(1, 2))
                                  ],
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 2.h),
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ));
        });
  }

  TextEditingController _Reason = TextEditingController();
  String request = "";
  bool whatYouWrote1 = false;
  bool whatYouWrote2 = false;
  String? controlbt = "ABC";
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
            "My Booking",
            style: TextStyle(
                fontSize: 18,
                fontFamily: "SegoeUI",
                fontWeight: FontWeight.bold,
                color: Color(0xff004351)),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<get_bookpakege_model>(
            future: get_book().Getbooklist(Id),
            builder: (context, snapshots) {
              // var bookID = snapshots.data?.data?[0].customPackageId.toString()??"";
              // var bookdate = snapshots.data?.data?[0].bookdate.toString()??"";
              return (snapshots.hasData)
                  ? Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                          color: Colors.white,
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // SizedBox(
                                //   height: 30.h,
                                // ),
                                snapshots.data!.data!.isEmpty
                                    ? Center(child: No_data_found())
                                    : Expanded(
                                        child: ListView(
                                          padding: EdgeInsets.zero,
                                          children: [
                                            LimitedBox(
                                              maxHeight: 1100,
                                              // height: 1000,
                                              child: ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  itemCount: snapshots
                                                      .data?.data?.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    var server = snapshots
                                                        .data?.data?[index];
                                                    return Container(
                                                        height: 300.h,
                                                        // (whatYouWrote2 == true)
                                                        //     ? 250.h
                                                        //     : 160.h,
                                                        child: Stack(
                                                          children: [
                                                            Container(
                                                              width: 375
                                                                  .w, // a to g
                                                              height: 150.h,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(10
                                                                              .r),
                                                                  gradient: LinearGradient(
                                                                      begin: Alignment
                                                                          .topCenter,
                                                                      end: Alignment.bottomCenter,
                                                                      colors: [
                                                                        Color(
                                                                            0xff037491),
                                                                        Color(
                                                                            0xff000000)
                                                                      ])),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsets
                                                                        .only(
                                                                            top:
                                                                                5.h),
                                                                    child: Text(
                                                                      //"Ahmedabad To Goa",
                                                                      server!
                                                                          .departure
                                                                          .toString(),
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          fontFamily:
                                                                              "SegoeUI",
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Positioned(
                                                                top: 35.h,
                                                                left: 3.w,
                                                                child:
                                                                    Container(
                                                                  width: 370
                                                                      .w, // box

                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.r),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Color(
                                                                          0xff01576D),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.only(
                                                                        left:
                                                                            8.w,
                                                                        top:
                                                                            8.h,
                                                                        right: 8
                                                                            .w),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Row(
                                                                              children: [
                                                                                Text(
                                                                                  "Package Id : ",
                                                                                  style: TextStyle(fontSize: 12, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                                                ),
                                                                                Text(
                                                                                  snapshots.data!.data![index].customPackageId.toString().length > 15 ? "${snapshots.data!.data![index].customPackageId.toString().substring(0, 15)}" : snapshots.data!.data![index].customPackageId.toString() + "...",
                                                                                  //"Trip/package ID: ${server.customPackageId.toString()}",
                                                                                  style: TextStyle(fontSize: 12, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            SizedBox(
                                                                              height: 5.h, // up cancle
                                                                            ),
                                                                            Row(
                                                                              children: [
                                                                                Text(
                                                                                  "Booking Date : ",
                                                                                  style: TextStyle(fontSize: 12, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                                                ),
                                                                                Text(
                                                                                  snapshots.data!.data![index].bookdate.toString().length > 10 ? "${snapshots.data!.data![index].bookdate.toString().substring(0, 10)}" : snapshots.data!.data![index].bookdate.toString() + "...",
                                                                                  //"Booking Date: ${server.bookdate.toString()}",
                                                                                  style: TextStyle(fontSize: 12, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            SizedBox(
                                                                              height: 5.h,
                                                                            ),
                                                                            Row(
                                                                              children: [
                                                                                Text(
                                                                                  "Departure Date : ",
                                                                                  style: TextStyle(fontSize: 12, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                                                ),
                                                                                Text(
                                                                                  snapshots.data!.data![index].approxStartDate.toString().length > 10 ? "${snapshots.data!.data![index].approxStartDate.toString().substring(0, 10)}" : snapshots.data!.data![index].approxStartDate.toString() + "...",
                                                                                  //"Booking Date: ${server.bookdate.toString()}",
                                                                                  style: TextStyle(fontSize: 12, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            SizedBox(
                                                                              height: 5.h,
                                                                            ),
                                                                            Row(
                                                                              children: [
                                                                                Text(
                                                                                  "Total Person: ${snapshots.data!.data![index].totalPerson.toString()}",
                                                                                  style: TextStyle(fontSize: 12, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Row(
                                                                              children: [
                                                                                InkWell(
                                                                                  onTap: () {
                                                                                    print(controlbt.toString());
                                                                                    String departure = snapshots.data!.data![index].departure.toString();
                                                                                    String destination = snapshots.data!.data![index].destination ?? '';
                                                                                    String adult = snapshots.data!.data![index].totalAdult.toString();
                                                                                    String childe = snapshots.data!.data![index].totalChild.toString();
                                                                                    String infant = snapshots.data!.data![index].totalInfant.toString();
                                                                                    String care = snapshots.data!.data![index].personalCare.toString();
                                                                                    String agencyid = snapshots.data!.data![index].bidId.toString();
                                                                                    String agencyname = snapshots.data!.data![index].agencyName ?? '';
                                                                                    String agencydate = snapshots.data!.data![index].bidDate.toString();
                                                                                    String agencyprice = snapshots.data!.data![index].agencyprice.toString();

                                                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => BidDetails(departure, destination, adult, childe, infant, care, agencyid, agencydate, agencyname, agencyprice, controlbt.toString())));
                                                                                  },
                                                                                  child: Text(
                                                                                    "View More Details :",
                                                                                    style: TextStyle(fontSize: 12, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Color(0xffEE1B1B)),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            SizedBox(
                                                                              height: 5.h,
                                                                            ),
                                                                            Text(
                                                                              "Agency Contact No: ${snapshots.data?.data?[0].agencyContectNo.toString()}",
                                                                              style: TextStyle(fontSize: 12, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 5.h,
                                                                            ),
                                                                            Text(
                                                                              "Contact Person: ${snapshots.data?.data?[0].contactNumber.toString()}",
                                                                              style: TextStyle(fontSize: 12, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              5.h,
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            // /*snapshots.data.data[index].*/ Container(
                                                                            //    height: MediaQuery.of(context).size.height / 20, // unknown
                                                                            //    width: MediaQuery.of(context).size.width / 60, //   unknown
                                                                            //    decoration: BoxDecoration(
                                                                            //      color: Color(0xffEE1B1B),
                                                                            //      borderRadius: BorderRadius.circular(5.r),
                                                                            //    ),
                                                                            //    child: Center(
                                                                            //      child: Row(
                                                                            //        mainAxisAlignment: MainAxisAlignment.center,
                                                                            //        children: [
                                                                            //          Icon(
                                                                            //            Icons.clear,
                                                                            //            size: 10,
                                                                            //            color: Colors.white,
                                                                            //          ),
                                                                            //          SizedBox(
                                                                            //            width: MediaQuery.of(context).size.width / 20, //unknown
                                                                            //          ),
                                                                            //          Padding(
                                                                            //            padding: EdgeInsets.only(bottom: 2.h),
                                                                            //            child: Text(
                                                                            //              "Cancel",
                                                                            //              style: TextStyle(fontSize: 12, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.white),
                                                                            //            ),
                                                                            //          ),
                                                                            //        ],
                                                                            //      ),
                                                                            //    ),
                                                                            //  ),
                                                                            Container(
                                                                              width: 100.w, // button
                                                                              height: 30.h,
                                                                              decoration: BoxDecoration(
                                                                                  gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                                                                                    Color(0xff028C14),
                                                                                    Color(0xff322C2C)
                                                                                  ]),
                                                                                  borderRadius: BorderRadius.circular(10.r),
                                                                                  border: Border.all(color: Color(0xff01576D))),
                                                                              child: Center(
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.only(bottom: 3.h),
                                                                                  child: Text(
                                                                                    "Confirm",
                                                                                    style: TextStyle(fontSize: 14, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.white),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),

                                                                            (request != "")
                                                                                ? InkWell(
                                                                                    onTap: () {
                                                                                      setState(() {
                                                                                        whatYouWrote2 = !whatYouWrote2;
                                                                                      });
                                                                                    },
                                                                                    child: Row(
                                                                                      children: [
                                                                                        Text(
                                                                                          "What you wrote",
                                                                                          style: TextStyle(fontSize: 12, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Color(0xffEE1B1B)),
                                                                                        ),
                                                                                        (whatYouWrote2 == false) ? Icon(Icons.arrow_drop_down) : Icon(Icons.arrow_drop_up),
                                                                                      ],
                                                                                    ),
                                                                                  )
                                                                                : InkWell(
                                                                                    onTap: () {
                                                                                      setState(() {
                                                                                        _showDialog();
                                                                                      });
                                                                                    },
                                                                                    child: Container(
                                                                                      height: 35.h,
                                                                                      width: 130.w,
                                                                                      // color: Colors.green,
                                                                                      child: Center(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsets.only(bottom: 3.h),
                                                                                          child: Text(
                                                                                            "cancel package",
                                                                                            style: TextStyle(fontSize: 14, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Color(0xffEE1B1B)),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  )
                                                                          ],
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                )),
                                                            Positioned(
                                                              top: 145.h,
                                                              left: 22.w,
                                                              child: (whatYouWrote2 ==
                                                                      true)
                                                                  ? Container(
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .height /
                                                                          100,
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          Container(
                                                                            height:
                                                                                MediaQuery.of(context).size.height / 5,
                                                                            width:
                                                                                MediaQuery.of(context).size.width / 1,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Colors.white,
                                                                              boxShadow: [
                                                                                BoxShadow(color: Colors.grey, blurRadius: 3.r, offset: Offset(0, 2))
                                                                              ],
                                                                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.r), bottomRight: Radius.circular(10.r)),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.only(top: 15.h, left: 8.w),
                                                                              child: Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    _Reason.text,
                                                                                    style: TextStyle(fontSize: 14, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.grey),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: MediaQuery.of(context).size.height / 20, // unknown
                                                                                  ),
                                                                                  Text(
                                                                                    "Do you want to cancel your 'Cancel' request?",
                                                                                    style: TextStyle(fontSize: 14, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.grey),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Positioned(
                                                                              top: 68.h,
                                                                              right: 5.w,
                                                                              child: Container(
                                                                                height: MediaQuery.of(context).size.height / 20, // unknown
                                                                                width: MediaQuery.of(context).size.width / 60, //   unknown
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xffEE1B1B),
                                                                                  borderRadius: BorderRadius.circular(5.r),
                                                                                ),
                                                                                child: Center(
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Icon(
                                                                                        Icons.clear,
                                                                                        size: 10,
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                      SizedBox(
                                                                                        width: MediaQuery.of(context).size.width / 20, //unknown
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsets.only(bottom: 2.h),
                                                                                        child: Text(
                                                                                          "Cancel",
                                                                                          style: TextStyle(fontSize: 12, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.white),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              )),
                                                                        ],
                                                                      ),
                                                                    )
                                                                  : Container(
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .height /
                                                                          20,
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          2,
                                                                    ),
                                                            ),
                                                            // Positioned(
                                                            //   // top: 110.h,
                                                            //   bottom: 30.h,
                                                            //   left: 10.w,
                                                            //   child: Container(
                                                            //     width:
                                                            //     100.w, // button
                                                            //     height: 30.h,
                                                            //     decoration: BoxDecoration(
                                                            //         gradient: LinearGradient(
                                                            //             begin: Alignment
                                                            //                 .topCenter,
                                                            //             end: Alignment.bottomCenter,
                                                            //             colors: [
                                                            //               Color(
                                                            //                   0xff028C14),
                                                            //               Color(
                                                            //                   0xff322C2C)
                                                            //             ]),
                                                            //         borderRadius:
                                                            //         BorderRadius
                                                            //             .circular(10
                                                            //             .r),
                                                            //         border: Border.all(
                                                            //             color: Color(
                                                            //                 0xff01576D))),
                                                            //     child: Center(
                                                            //       child: Padding(
                                                            //         padding: EdgeInsets
                                                            //             .only(
                                                            //             bottom:
                                                            //             3.h),
                                                            //         child: Text(
                                                            //           "Confirm",
                                                            //           style: TextStyle(
                                                            //               fontSize:
                                                            //               16,
                                                            //               fontFamily:
                                                            //               "SegoeUI",
                                                            //               fontWeight:
                                                            //               FontWeight
                                                            //                   .bold,
                                                            //               color: Colors
                                                            //                   .white),
                                                            //         ),
                                                            //       ),
                                                            //     ),
                                                            //   ),
                                                            // ),
                                                          ],
                                                        ));
                                                  }),
                                            ),
                                            SizedBox(
                                              height: 5.h, // up cancle
                                            ),
                                            // Container(
                                            //   height:
                                            //       (whatYouWrote2 == true) ? 250.h : 160.h,
                                            //   child: Stack(
                                            //     children: [
                                            //       Container(
                                            //         width: 375.w, // a to g
                                            //         height: 150.h,
                                            //         decoration: BoxDecoration(
                                            //             borderRadius:
                                            //                 BorderRadius.circular(10.r),
                                            //             gradient: LinearGradient(
                                            //                 begin: Alignment.topCenter,
                                            //                 end: Alignment.bottomCenter,
                                            //                 colors: [
                                            //                   Color(0xff037491),
                                            //                   Color(0xff000000)
                                            //                 ])),
                                            //         child: Row(
                                            //           mainAxisAlignment:
                                            //               MainAxisAlignment.center,
                                            //           crossAxisAlignment:
                                            //               CrossAxisAlignment.start,
                                            //           children: [
                                            //             Padding(
                                            //               padding:
                                            //                   EdgeInsets.only(top: 8.h),
                                            //               child: Text(
                                            //                 "Ahmedabad To Goa",
                                            //                 style: TextStyle(
                                            //                     fontSize: 18,
                                            //                     fontFamily: "SegoeUI",
                                            //                     fontWeight:
                                            //                         FontWeight.bold,
                                            //                     color: Colors.white),
                                            //               ),
                                            //             ),
                                            //           ],
                                            //         ),
                                            //       ),
                                            //       Positioned(
                                            //           top: 35.h,
                                            //           left: 3.w,
                                            //           child: Container(
                                            //             width: 370.w, // box
                                            //             height: 110.h,
                                            //             decoration: BoxDecoration(
                                            //                 color: Colors.white,
                                            //                 borderRadius:
                                            //                     BorderRadius.circular(
                                            //                         10.r),
                                            //                 border: Border.all(
                                            //                     color:
                                            //                         Color(0xff01576D))),
                                            //             child: Padding(
                                            //               padding: EdgeInsets.only(
                                            //                   left: 8.w,
                                            //                   top: 8.h,
                                            //                   right: 8.w),
                                            //               child: Row(
                                            //                 mainAxisAlignment:
                                            //                     MainAxisAlignment
                                            //                         .spaceBetween,
                                            //                 children: [
                                            //                   Column(
                                            //                     crossAxisAlignment:
                                            //                         CrossAxisAlignment
                                            //                             .start,
                                            //                     children: [
                                            //                       Text(
                                            //                         // bookID.length > 15
                                            //                         //     ? "${bookID.substring(0, 15)}"
                                            //                         //     : bookID + "...",
                                            //                         "Trip/package ID: 123456",
                                            //                         style: TextStyle(
                                            //                             fontSize: 12,
                                            //                             fontFamily:
                                            //                                 "SegoeUI",
                                            //                             fontWeight:
                                            //                                 FontWeight
                                            //                                     .bold,
                                            //                             color:
                                            //                                 Colors.black),
                                            //                       ),
                                            //                       SizedBox(
                                            //                         height:
                                            //                             5.h, // up cancle
                                            //                       ),
                                            //                       Text(
                                            //                         // bookdate.length > 10
                                            //                         //     ? "${bookdate.substring(0, 10)}"
                                            //                         //     : bookdate + "...",
                                            //                         "Booking Date: 30-8-2022",
                                            //                         style: TextStyle(
                                            //                             fontSize: 12,
                                            //                             fontFamily:
                                            //                                 "SegoeUI",
                                            //                             fontWeight:
                                            //                                 FontWeight
                                            //                                     .bold,
                                            //                             color:
                                            //                                 Colors.black),
                                            //                       ),
                                            //                       SizedBox(
                                            //                         height:
                                            //                             5.h, // up cancle
                                            //                       ),
                                            //                       Text(
                                            //                         "Total Person: ${snapshots.data?.data?[0].totalPerson.toString()}",
                                            //                         style: TextStyle(
                                            //                             fontSize: 12,
                                            //                             fontFamily:
                                            //                                 "SegoeUI",
                                            //                             fontWeight:
                                            //                                 FontWeight
                                            //                                     .bold,
                                            //                             color:
                                            //                                 Colors.black),
                                            //                       ),
                                            //                     ],
                                            //                   ),
                                            //                   Column(
                                            //                     crossAxisAlignment:
                                            //                         CrossAxisAlignment
                                            //                             .start,
                                            //                     children: [
                                            //                       Text(
                                            //                         "View More Details",
                                            //                         style: TextStyle(
                                            //                             fontSize: 12,
                                            //                             fontFamily:
                                            //                                 "SegoeUI",
                                            //                             fontWeight:
                                            //                                 FontWeight
                                            //                                     .bold,
                                            //                             color: Color(
                                            //                                 0xffEE1B1B)),
                                            //                       ),
                                            //                       SizedBox(
                                            //                         height:
                                            //                             5.h, // up cancle
                                            //                       ),
                                            //                       Text(
                                            //                         "Agency Contact No: ${snapshots.data?.data?[0].agencyContectNo.toString()}",
                                            //                         style: TextStyle(
                                            //                             fontSize: 12,
                                            //                             fontFamily:
                                            //                                 "SegoeUI",
                                            //                             fontWeight:
                                            //                                 FontWeight
                                            //                                     .bold,
                                            //                             color:
                                            //                                 Colors.black),
                                            //                       ),
                                            //                       SizedBox(
                                            //                         height:
                                            //                             5.h, // up cancle
                                            //                       ),
                                            //                       Text(
                                            //                         "Contact Person: ${snapshots.data?.data?[0].contactNumber.toString()}",
                                            //                         style: TextStyle(
                                            //                             fontSize: 12,
                                            //                             fontFamily:
                                            //                                 "SegoeUI",
                                            //                             fontWeight:
                                            //                                 FontWeight
                                            //                                     .bold,
                                            //                             color:
                                            //                                 Colors.black),
                                            //                       ),
                                            //                     ],
                                            //                   ),
                                            //                 ],
                                            //               ),
                                            //             ),
                                            //           )),
                                            //       Positioned(
                                            //         top: 110.h,
                                            //         left: 10.w,
                                            //         child: Container(
                                            //           width: 100.w, // button
                                            //           height: 30.h,
                                            //           decoration: BoxDecoration(
                                            //               gradient: LinearGradient(
                                            //                   begin: Alignment.topCenter,
                                            //                   end: Alignment.bottomCenter,
                                            //                   colors: [
                                            //                     Color(0xff8C0202),
                                            //                     Color(0xff460301)
                                            //                   ]),
                                            //               borderRadius:
                                            //                   BorderRadius.circular(10.r),
                                            //               border: Border.all(
                                            //                   color: Color(0xff01576D))),
                                            //           child: Center(
                                            //             child: Padding(
                                            //               padding: EdgeInsets.only(
                                            //                   bottom: 3.h),
                                            //               child: Text(
                                            //                 "Cancelled",
                                            //                 style: TextStyle(
                                            //                     fontSize: 16,
                                            //                     fontFamily: "SegoeUI",
                                            //                     fontWeight:
                                            //                         FontWeight.bold,
                                            //                     color: Colors.white),
                                            //               ),
                                            //             ),
                                            //           ),
                                            //         ),
                                            //       ),
                                            //     ],
                                            //     //overflow: Overflow.visible,
                                            //   ),
                                            // ),
                                            // SizedBox(
                                            //   height: 5.h, // up cancle
                                            // ),
                                            // Container(
                                            //   child: Column(
                                            //     children: [
                                            //       Container(
                                            //         height: (whatYouWrote1 == true)
                                            //             ? 250.h
                                            //             : 160.h,
                                            //         child: Stack(
                                            //           children: [
                                            //             Container(
                                            //               width: 375.w, // a to g
                                            //               height: 150.h,
                                            //               decoration: BoxDecoration(
                                            //                   borderRadius:
                                            //                       BorderRadius.circular(
                                            //                           10.r),
                                            //                   gradient: LinearGradient(
                                            //                       begin:
                                            //                           Alignment.topCenter,
                                            //                       end: Alignment
                                            //                           .bottomCenter,
                                            //                       colors: [
                                            //                         Color(0xff037491),
                                            //                         Color(0xff000000)
                                            //                       ])),
                                            //               child: Row(
                                            //                 mainAxisAlignment:
                                            //                     MainAxisAlignment.center,
                                            //                 crossAxisAlignment:
                                            //                     CrossAxisAlignment.start,
                                            //                 children: [
                                            //                   Padding(
                                            //                     padding: EdgeInsets.only(
                                            //                         top: 8.h),
                                            //                     child: Text(
                                            //                       "Ahmedabad To Goa",
                                            //                       style: TextStyle(
                                            //                           fontSize: 18,
                                            //                           fontFamily:
                                            //                               "SegoeUI",
                                            //                           fontWeight:
                                            //                               FontWeight.bold,
                                            //                           color:
                                            //                               Colors.white),
                                            //                     ),
                                            //                   ),
                                            //                 ],
                                            //               ),
                                            //             ),
                                            //             Positioned(
                                            //                 top: 35.h,
                                            //                 left: 3.w,
                                            //                 child: Container(
                                            //                   width: 370.w, // box
                                            //                   height: 110.h,
                                            //                   decoration: BoxDecoration(
                                            //                       color: Colors.white,
                                            //                       borderRadius:
                                            //                           BorderRadius
                                            //                               .circular(10.r),
                                            //                       border: Border.all(
                                            //                           color: Color(
                                            //                               0xff01576D))),
                                            //                   child: Column(
                                            //                     children: [
                                            //                       Padding(
                                            //                         padding:
                                            //                             EdgeInsets.only(
                                            //                                 left: 8.w,
                                            //                                 top: 8.h,
                                            //                                 right: 8.w),
                                            //                         child: Row(
                                            //                           mainAxisAlignment:
                                            //                               MainAxisAlignment
                                            //                                   .spaceBetween,
                                            //                           children: [
                                            //                             Column(
                                            //                               crossAxisAlignment:
                                            //                                   CrossAxisAlignment
                                            //                                       .start,
                                            //                               children: [
                                            //                                 Text(
                                            //                                   // bookID.length > 15
                                            //                                   //     ? "${bookID.substring(0, 15)}"
                                            //                                   //     : bookID + "...",
                                            //                                   "Trip/package ID: 2548756523",
                                            //                                   style: TextStyle(
                                            //                                       fontSize: 12
                                            //                                           ,
                                            //                                       fontFamily:
                                            //                                           "SegoeUI",
                                            //                                       fontWeight:
                                            //                                           FontWeight
                                            //                                               .bold,
                                            //                                       color: Colors
                                            //                                           .black),
                                            //                                 ),
                                            //                                 SizedBox(
                                            //                                   height: 5.h,
                                            //                                 ),
                                            //                                 Text(
                                            //                                   // bookdate.length > 10
                                            //                                   //     ? "${bookdate.substring(0, 10)}"
                                            //                                   //     : bookdate + "...",
                                            //                                   "Booking Date: 27/02/2021",
                                            //                                   style: TextStyle(
                                            //                                       fontSize: 12
                                            //                                           ,
                                            //                                       fontFamily:
                                            //                                           "SegoeUI",
                                            //                                       fontWeight:
                                            //                                           FontWeight
                                            //                                               .bold,
                                            //                                       color: Colors
                                            //                                           .black),
                                            //                                 ),
                                            //                                 SizedBox(
                                            //                                   height: 5.h,
                                            //                                 ),
                                            //                                 Text(
                                            //                                   "Total Person: ${snapshots.data!.data![0].totalPerson.toString()}",
                                            //                                   style: TextStyle(
                                            //                                       fontSize: 12
                                            //                                           ,
                                            //                                       fontFamily:
                                            //                                           "SegoeUI",
                                            //                                       fontWeight:
                                            //                                           FontWeight
                                            //                                               .bold,
                                            //                                       color: Colors
                                            //                                           .black),
                                            //                                 ),
                                            //                               ],
                                            //                             ),
                                            //                             Column(
                                            //                               crossAxisAlignment:
                                            //                                   CrossAxisAlignment
                                            //                                       .start,
                                            //                               children: [
                                            //                                 Text(
                                            //                                   "View More Details",
                                            //                                   style: TextStyle(
                                            //                                       fontSize: 12
                                            //                                           ,
                                            //                                       fontFamily:
                                            //                                           "SegoeUI",
                                            //                                       fontWeight:
                                            //                                           FontWeight
                                            //                                               .bold,
                                            //                                       color: Color(
                                            //                                           0xffEE1B1B)),
                                            //                                 ),
                                            //                                 SizedBox(
                                            //                                   height: 5.h,
                                            //                                 ),
                                            //                                 Text(
                                            //                                   "Agency Contact : ${snapshots.data?.data?[0].agencyContectNo.toString()}",
                                            //                                   style: TextStyle(
                                            //                                       fontSize: 12
                                            //                                           ,
                                            //                                       fontFamily:
                                            //                                           "SegoeUI",
                                            //                                       fontWeight:
                                            //                                           FontWeight
                                            //                                               .bold,
                                            //                                       color: Colors
                                            //                                           .black),
                                            //                                 ),
                                            //                                 SizedBox(
                                            //                                   height: 5.h,
                                            //                                 ),
                                            //                                 Text(
                                            //                                   "Contact Person: ${snapshots.data?.data?[0].contactNumber.toString()}",
                                            //                                   style: TextStyle(
                                            //                                       fontSize: 12
                                            //                                           ,
                                            //                                       fontFamily:
                                            //                                           "SegoeUI",
                                            //                                       fontWeight:
                                            //                                           FontWeight
                                            //                                               .bold,
                                            //                                       color: Colors
                                            //                                           .black),
                                            //                                 ),
                                            //                               ],
                                            //                             ),
                                            //                           ],
                                            //                         ),
                                            //                       ),
                                            //                       SizedBox(
                                            //                         height: 5.h,
                                            //                       ),
                                            //                       Row(
                                            //                         mainAxisAlignment:
                                            //                             MainAxisAlignment
                                            //                                 .spaceBetween,
                                            //                         children: [
                                            //                           SizedBox(
                                            //                             width: 130.w,
                                            //                           ),
                                            //                           Row(
                                            //                             children: [
                                            //                               Icon(
                                            //                                 Icons.star,
                                            //                                 color: Color(
                                            //                                     0xff025B72),
                                            //                                 size: 20,
                                            //                               ),
                                            //                               Icon(
                                            //                                 Icons.star,
                                            //                                 color: Color(
                                            //                                     0xff025B72),
                                            //                                 size: 20,
                                            //                               ),
                                            //                               Icon(
                                            //                                 Icons.star,
                                            //                                 color: Color(
                                            //                                     0xff025B72),
                                            //                                 size: 20,
                                            //                               ),
                                            //                               Icon(
                                            //                                 Icons.star,
                                            //                                 color: Color(
                                            //                                     0xff025B72),
                                            //                                 size: 20,
                                            //                               ),
                                            //                               Icon(
                                            //                                 Icons
                                            //                                     .star_border,
                                            //                                 color: Color(
                                            //                                     0xff025B72),
                                            //                                 size: 20,
                                            //                               ),
                                            //                             ],
                                            //                           ),
                                            //                           InkWell(
                                            //                             onTap: () {
                                            //                               setState(() {
                                            //                                 whatYouWrote1 =
                                            //                                     !whatYouWrote1;
                                            //                               });
                                            //                             },
                                            //                             child: Row(
                                            //                               children: [
                                            //                                 Text(
                                            //                                   "What you wrote",
                                            //                                   style: TextStyle(
                                            //                                       fontSize: 12
                                            //                                           ,
                                            //                                       fontFamily:
                                            //                                           "SegoeUI",
                                            //                                       fontWeight:
                                            //                                           FontWeight
                                            //                                               .bold,
                                            //                                       color: Color(
                                            //                                           0xffEE1B1B)),
                                            //                                 ),
                                            //                                 (whatYouWrote1 ==
                                            //                                         false)
                                            //                                     ? Icon(Icons
                                            //                                         .arrow_drop_down)
                                            //                                     : Icon(Icons
                                            //                                         .arrow_drop_up),
                                            //                               ],
                                            //                             ),
                                            //                           )
                                            //                         ],
                                            //                       ),
                                            //                     ],
                                            //                   ),
                                            //                 )),
                                            //             Positioned(
                                            //               top: 145.h,
                                            //               left: 70.w,
                                            //               child: (whatYouWrote1 == true)
                                            //                   ? Container(
                                            //                       height: 100.h,
                                            //                       // color: Colors.green,
                                            //                       child: Stack(
                                            //                         children: [
                                            //                           Container(
                                            //                             height: 60.h,
                                            //                             width: 300.w,
                                            //                             decoration:
                                            //                                 BoxDecoration(
                                            //                               color: Colors
                                            //                                   .white,
                                            //                               boxShadow: [
                                            //                                 BoxShadow(
                                            //                                     color: Colors
                                            //                                         .grey,
                                            //                                     blurRadius:
                                            //                                         3.r,
                                            //                                     offset:
                                            //                                         Offset(
                                            //                                             1,
                                            //                                             1))
                                            //                               ],
                                            //                               borderRadius: BorderRadius.only(
                                            //                                   bottomLeft:
                                            //                                       Radius.circular(10
                                            //                                           .r),
                                            //                                   bottomRight:
                                            //                                       Radius.circular(
                                            //                                           10.r)),
                                            //                             ),
                                            //                             child: Padding(
                                            //                               padding: EdgeInsets
                                            //                                   .only(
                                            //                                       top: 15
                                            //                                           .h,
                                            //                                       left: 12
                                            //                                           .w),
                                            //                               child: Text(
                                            //                                 "Lorem ipsum adajdhfb fhoir feifja ytfeiuoae uag jyaegek kaunee oaehi ieqhii iueqi hdsu. Thankyou.",
                                            //                                 textAlign:
                                            //                                     TextAlign
                                            //                                         .left,
                                            //                                 style: TextStyle(
                                            //                                     fontSize:
                                            //                                         12,
                                            //                                     fontFamily:
                                            //                                         "SegoeUI",
                                            //                                     fontWeight:
                                            //                                         FontWeight
                                            //                                             .bold,
                                            //                                     color: Colors
                                            //                                         .grey),
                                            //                               ),
                                            //                             ),
                                            //                           ),
                                            //                           Positioned(
                                            //                             top: 69.h,
                                            //                             right: 82.w,
                                            //                             child: InkWell(
                                            //                               onTap: () {
                                            //                                 _showRatingDialog();
                                            //                                 // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RatingDialog(submitButtonText: '', title: Text('Reting') , onSubmitted: (RatingDialogResponse ) {  },)));
                                            //                               },
                                            //                               child:
                                            //                                   Container(
                                            //                                 height: 25.h,
                                            //                                 width: 70.w,
                                            //                                 decoration:
                                            //                                     BoxDecoration(
                                            //                                   color: Color(
                                            //                                       0xff004354),
                                            //                                   borderRadius:
                                            //                                       BorderRadius.circular(
                                            //                                           5.r),
                                            //                                 ),
                                            //                                 child: Center(
                                            //                                   child: Row(
                                            //                                     mainAxisAlignment:
                                            //                                         MainAxisAlignment
                                            //                                             .spaceEvenly,
                                            //                                     children: [
                                            //                                       Icon(
                                            //                                         Icons
                                            //                                             .edit,
                                            //                                         size:
                                            //                                             10,
                                            //                                         color:
                                            //                                             Colors.white,
                                            //                                       ),
                                            //                                       Text(
                                            //                                         "Edit",
                                            //                                         style: TextStyle(
                                            //                                             fontSize: 12,
                                            //                                             fontFamily: "SegoeUI",
                                            //                                             fontWeight: FontWeight.bold,
                                            //                                             color: Colors.white),
                                            //                                       ),
                                            //                                     ],
                                            //                                   ),
                                            //                                 ),
                                            //                               ),
                                            //                             ),
                                            //                           ),
                                            //                           Positioned(
                                            //                               top: 69.h,
                                            //                               right: 5.w,
                                            //                               child:
                                            //                                   Container(
                                            //                                 height: 25.h,
                                            //                                 width: 70.w,
                                            //                                 decoration:
                                            //                                     BoxDecoration(
                                            //                                   color: Color(
                                            //                                       0xffEE1B1B),
                                            //                                   borderRadius:
                                            //                                       BorderRadius.circular(
                                            //                                           5.r),
                                            //                                 ),
                                            //                                 child: Center(
                                            //                                   child: Row(
                                            //                                     mainAxisAlignment:
                                            //                                         MainAxisAlignment
                                            //                                             .spaceEvenly,
                                            //                                     children: [
                                            //                                       Icon(
                                            //                                         Icons
                                            //                                             .delete,
                                            //                                         size:
                                            //                                             10,
                                            //                                         color:
                                            //                                             Colors.white,
                                            //                                       ),
                                            //                                       Text(
                                            //                                         "Delete",
                                            //                                         style: TextStyle(
                                            //                                             fontSize: 12,
                                            //                                             fontFamily: "SegoeUI",
                                            //                                             fontWeight: FontWeight.bold,
                                            //                                             color: Colors.white),
                                            //                                       ),
                                            //                                     ],
                                            //                                   ),
                                            //                                 ),
                                            //                               )),
                                            //                         ],
                                            //                       ),
                                            //                     )
                                            //                   : Container(
                                            //                       height: 0.h,
                                            //                       width: 0.w,
                                            //                     ),
                                            //             ),
                                            //             Positioned(
                                            //               top: 110.h,
                                            //               left: 10.w,
                                            //               child: Container(
                                            //                 width: 100.w, // button
                                            //                 height: 30.h,
                                            //                 decoration: BoxDecoration(
                                            //                     gradient: LinearGradient(
                                            //                         begin: Alignment
                                            //                             .topCenter,
                                            //                         end: Alignment
                                            //                             .bottomCenter,
                                            //                         colors: [
                                            //                           Color(0xff037491),
                                            //                           Color(0xff013846)
                                            //                         ]),
                                            //                     borderRadius:
                                            //                         BorderRadius.circular(
                                            //                             10.r),
                                            //                     border: Border.all(
                                            //                         color: Color(
                                            //                             0xff01576D))),
                                            //                 child: Center(
                                            //                   child: Padding(
                                            //                     padding: EdgeInsets.only(
                                            //                         bottom: 3.h),
                                            //                     child: Text(
                                            //                       "Completed",
                                            //                       style: TextStyle(
                                            //                           fontSize: 16,
                                            //                           fontFamily:
                                            //                               "SegoeUI",
                                            //                           fontWeight:
                                            //                               FontWeight.bold,
                                            //                           color:
                                            //                               Colors.white),
                                            //                     ),
                                            //                   ),
                                            //                 ),
                                            //               ),
                                            //             ),
                                            //           ],
                                            //         ),
                                            //       ),
                                            //     ],
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                              ])))
                  : Center(child: CircularProgressIndicator());
            }));
  }
}

class No_data_found extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        Image.network(
            "https://img.freepik.com/free-vector/no-data-concept-illustration_114360-626.jpg?w=996&t=st=1662370078~exp=1662370678~hmac=f043fe6f7d79b6eee8c4a04ce2b450e2326987731796eb9ac635265156b0aad3",
            height: 150),
        SizedBox(height: 10),
        Text(
          "No Packages available",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
        )
      ],
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:rating_dialog/rating_dialog.dart';
//
// class BookedPackages extends StatefulWidget {
//   @override
//   _BookedPackagesState createState() => _BookedPackagesState();
// }
//
// class _BookedPackagesState extends State<BookedPackages> {
//   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
//   double height = 220.h;
//   void _showRatingDialog() {
//     // final _dialog = RatingDialog(
//     //   title: Text(
//     //     'Rating Dialog',
//     //     style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
//     //   ),
//     //   message: Text(
//     //     'Tap a star to set your rating. Add more description here if you want.',
//     //     style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
//     //   ),
//     //   image: Image.asset("assets/splashscreen.jpg"),
//     //   submitButtonText: 'Submit',
//     //   onCancelled: () => print('cancelled'),
//     //   onSubmitted: (response) async {
//     //     print('rating: ${response.rating}, comment: ${response.comment}');
//     //   },
//     // );
//     //
//     // // show the dialog
//     // showDialog(
//     //   context: context,
//     //   barrierDismissible: true, // set to false if you want to force a rating
//     //   builder: (context) => _dialog,
//     // );
//
//     final _dialog = RatingDialog(
//       initialRating: 1,
//       // your app's name?
//       title: Text(
//         'Rating Dialog',
//         textAlign: TextAlign.center,
//         style: const TextStyle(
//           fontSize: 25,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//       // encourage your user to leave a high rating?
//       message: Text(
//         'Tap a star to set your rating. Add more description here if you want.',
//         textAlign: TextAlign.center,
//         style: const TextStyle(fontSize: 15),
//       ),
//       // your app's logo?
//       image: Image.asset("assets/splashscreen.jpg"),
//       submitButtonText: 'Submit',
//       commentHint: 'Set your custom comment hint',
//       onCancelled: () => print('cancelled'),
//       onSubmitted: (response) {
//         print('rating: ${response.rating}, comment: ${response.comment}');
//       },
//     );
//
//     // show the dialog
//     showDialog(
//       context: context,
//       barrierDismissible: true, // set to false if you want to force a rating
//       builder: (context) => _dialog,
//     );
//   }
//
//   _showDialog() {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return Dialog(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(5.w),
//               ),
//               child: Container(
//                 height: 350.h,
//                 width: 300.w,
//                 child: Padding(
//                   padding: EdgeInsets.all(8.w),
//                   child: Form(
//                     key: _formkey,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "why do you want to cancel your package?",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               fontSize: 18.sp,
//                               fontFamily: "SegoeUI",
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xff004351)),
//                         ),
//                         SizedBox(
//                           height: 15.h,
//                         ),
//                         Padding(
//                           padding: EdgeInsets.all(8.w),
//                           child: TextFormField(
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return "reason is required";
//                               }
//                             },
//                             controller: _Reason,
//                             decoration: InputDecoration(
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Color(0xff0A6A73),
//                                   ),
//                                   borderRadius: BorderRadius.circular(15.r),
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(15.r),
//                                   //borderSide: BorderSide(color: Color(0xff0A6A73)),
//                                 ),
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(15.r)),
//                                 disabledBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(color: Colors.black),
//                                 ),
//                                 hintText: "Your Reason"),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 30.h,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             InkWell(
//                               onTap: () {
//                                 if (!_formkey.currentState!.validate()) {
//                                   setState(() {
//                                     height = 10.h;
//                                   });
//                                   return;
//                                 } else {
//                                   setState(() {
//                                     request = "cancel";
//                                     print(request);
//                                     Fluttertoast.showToast(
//                                       msg:
//                                       "Your Cancel request has been submitted,we will contact you soon ",
//                                       backgroundColor: Color(0xff09646D),
//                                       textColor: Colors.white,
//                                     );
//                                   });
//
//                                   Navigator.of(context).pop();
//                                 }
//                               },
//                               child: Container(
//                                 height: 35.h,
//                                 width: 100.w,
//                                 decoration: BoxDecoration(
//                                   color: Color(0xff09646D),
//                                   borderRadius: BorderRadius.circular(10.r),
//                                   boxShadow: [
//                                     BoxShadow(
//                                         color: Colors.grey,
//                                         blurRadius: 3.r,
//                                         offset: Offset(1, 2))
//                                   ],
//                                 ),
//                                 child: Center(
//                                   child: Padding(
//                                     padding: EdgeInsets.only(bottom: 2.h),
//                                     child: Text(
//                                       "Submit",
//                                       style: TextStyle(
//                                           fontSize: 18.sp,
//                                           fontFamily: "SegoeUI",
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.white),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 Navigator.of(context).pop();
//                               },
//                               child: Container(
//                                 height: 35.h,
//                                 width: 100.w,
//                                 decoration: BoxDecoration(
//                                   color: Color(0xff09646D),
//                                   borderRadius: BorderRadius.circular(10.r),
//                                   boxShadow: [
//                                     BoxShadow(
//                                         color: Colors.grey,
//                                         blurRadius: 3.r,
//                                         offset: Offset(1, 2))
//                                   ],
//                                 ),
//                                 child: Center(
//                                   child: Padding(
//                                     padding: EdgeInsets.only(bottom: 2.h),
//                                     child: Text(
//                                       "Cancel",
//                                       style: TextStyle(
//                                           fontSize: 18.sp,
//                                           fontFamily: "SegoeUI",
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.white),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ));
//         });
//   }
//
//   TextEditingController _Reason = TextEditingController();
//   String request = "";
//   bool whatYouWrote1 = false;
//   bool whatYouWrote2 = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
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
//             "My Packages",
//             style: TextStyle(
//                 fontSize: 18.sp,
//                 fontFamily: "SegoeUI",
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xff004351)),
//           ),
//           centerTitle: true,
//         ),
//         body: Container(
//           color: Colors.white,
//           child: ListView(children: [
//             Column(children: [
//               SizedBox(
//                 height: 30.h,
//               ),
//               Container(
//                 height: (whatYouWrote2 == true) ? 250.h : 160.h,
//                 child: Stack(
//                   children: [
//                     Container(
//                       width: 375.w, // a to g
//                       height: 150.h,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10.r),
//                           gradient: LinearGradient(
//                               begin: Alignment.topCenter,
//                               end: Alignment.bottomCenter,
//                               colors: [Color(0xff037491), Color(0xff000000)])),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.only(top: 5.h),
//                             child: Text(
//                               "Ahmedabad To Goa",
//                               style: TextStyle(
//                                   fontSize: 18.sp,
//                                   fontFamily: "SegoeUI",
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Positioned(
//                         top: 35.h,
//                         left: 3.w,
//                         child: Container(
//                           width: 370.w, // box
//                           height: 110.h,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10.r),
//                             border: Border.all(
//                               color: Color(0xff01576D),
//                             ),
//                           ),
//                           child: Padding(
//                             padding: EdgeInsets.only(
//                                 left: 8.w, top: 8.h, right: 8.w),
//                             child: Column(
//                               children: [
//                                 Row(
//                                   mainAxisAlignment:
//                                   MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Column(
//                                       crossAxisAlignment:
//                                       CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           "Trip/package ID: 2548756523",
//                                           style: TextStyle(
//                                               fontSize: 12.sp,
//                                               fontFamily: "SegoeUI",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.black),
//                                         ),
//                                         SizedBox(
//                                           height: 5.h, // up cancle
//                                         ),
//                                         Text(
//                                           "Booking Date: 27/02/2021",
//                                           style: TextStyle(
//                                               fontSize: 12.sp,
//                                               fontFamily: "SegoeUI",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.black),
//                                         ),
//                                         SizedBox(
//                                           height: 5.h,
//                                         ),
//                                         Text(
//                                           "Total Person: 2",
//                                           style: TextStyle(
//                                               fontSize: 12.sp,
//                                               fontFamily: "SegoeUI",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.black),
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       crossAxisAlignment:
//                                       CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           "View More Details",
//                                           style: TextStyle(
//                                               fontSize: 12.sp,
//                                               fontFamily: "SegoeUI",
//                                               fontWeight: FontWeight.bold,
//                                               color: Color(0xffEE1B1B)),
//                                         ),
//                                         SizedBox(
//                                           height: 5.h,
//                                         ),
//                                         Text(
//                                           "Agency Contact No: 96244**4*0",
//                                           style: TextStyle(
//                                               fontSize: 12.sp,
//                                               fontFamily: "SegoeUI",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.black),
//                                         ),
//                                         SizedBox(
//                                           height: 5.h,
//                                         ),
//                                         Text(
//                                           "Contact Person: Tour Bharat",
//                                           style: TextStyle(
//                                               fontSize: 12.sp,
//                                               fontFamily: "SegoeUI",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.black),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 5.h,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     (request != "")
//                                         ? InkWell(
//                                       onTap: () {
//                                         setState(() {
//                                           whatYouWrote2 = !whatYouWrote2;
//                                         });
//                                       },
//                                       child: Row(
//                                         children: [
//                                           Text(
//                                             "What you wrote",
//                                             style: TextStyle(
//                                                 fontSize: 12.sp,
//                                                 fontFamily: "SegoeUI",
//                                                 fontWeight:
//                                                 FontWeight.bold,
//                                                 color: Color(0xffEE1B1B)),
//                                           ),
//                                           (whatYouWrote2 == false)
//                                               ? Icon(
//                                               Icons.arrow_drop_down)
//                                               : Icon(Icons.arrow_drop_up),
//                                         ],
//                                       ),
//                                     )
//                                         : InkWell(
//                                       onTap: () {
//                                         setState(() {
//                                           _showDialog();
//                                         });
//                                       },
//                                       child: Container(
//                                         height: 35.h,
//                                         width: 130.w,
//                                         // color: Colors.green,
//                                         child: Center(
//                                           child: Padding(
//                                             padding: EdgeInsets.only(
//                                                 bottom: 3.h),
//                                             child: Text(
//                                               "cancel package",
//                                               style: TextStyle(
//                                                   fontSize: 16.sp,
//                                                   fontFamily: "SegoeUI",
//                                                   fontWeight:
//                                                   FontWeight.bold,
//                                                   color:
//                                                   Color(0xffEE1B1B)),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                         )),
//                     Positioned(
//                       top: 145.h,
//                       left: 22.w,
//                       child: (whatYouWrote2 == true)
//                           ? Container(
//                         height: MediaQuery.of(context).size.height / 100,
//                         child: Stack(
//                           children: [
//                             Container(
//                               height:
//                               MediaQuery.of(context).size.height / 5,
//                               width:
//                               MediaQuery.of(context).size.width / 1,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 boxShadow: [
//                                   BoxShadow(
//                                       color: Colors.grey,
//                                       blurRadius: 3.r,
//                                       offset: Offset(0, 2))
//                                 ],
//                                 borderRadius: BorderRadius.only(
//                                     bottomLeft: Radius.circular(10.r),
//                                     bottomRight: Radius.circular(10.r)),
//                               ),
//                               child: Padding(
//                                 padding:
//                                 EdgeInsets.only(top: 15.h, left: 8.w),
//                                 child: Column(
//                                   crossAxisAlignment:
//                                   CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       _Reason.text,
//                                       style: TextStyle(
//                                           fontSize: 14.sp,
//                                           fontFamily: "SegoeUI",
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.grey),
//                                     ),
//                                     SizedBox(
//                                       height: MediaQuery.of(context)
//                                           .size
//                                           .height /
//                                           20, // unknown
//                                     ),
//                                     Text(
//                                       "Do you want to cancel your 'Cancel' request?",
//                                       style: TextStyle(
//                                           fontSize: 14.sp,
//                                           fontFamily: "SegoeUI",
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.grey),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Positioned(
//                                 top: 68.h,
//                                 right: 5.w,
//                                 child: Container(
//                                   height:
//                                   MediaQuery.of(context).size.height /
//                                       20, // unknown
//                                   width:
//                                   MediaQuery.of(context).size.width /
//                                       60, //   unknown
//                                   decoration: BoxDecoration(
//                                     color: Color(0xffEE1B1B),
//                                     borderRadius:
//                                     BorderRadius.circular(5.r),
//                                   ),
//                                   child: Center(
//                                     child: Row(
//                                       mainAxisAlignment:
//                                       MainAxisAlignment.center,
//                                       children: [
//                                         Icon(
//                                           Icons.clear,
//                                           size: 10.sp,
//                                           color: Colors.white,
//                                         ),
//                                         SizedBox(
//                                           width: MediaQuery.of(context)
//                                               .size
//                                               .width /
//                                               20, //unknown
//                                         ),
//                                         Padding(
//                                           padding: EdgeInsets.only(
//                                               bottom: 2.h),
//                                           child: Text(
//                                             "Cancel",
//                                             style: TextStyle(
//                                                 fontSize: 12.sp,
//                                                 fontFamily: "SegoeUI",
//                                                 fontWeight:
//                                                 FontWeight.bold,
//                                                 color: Colors.white),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 )),
//                           ],
//                         ),
//                       )
//                           : Container(
//                         height: MediaQuery.of(context).size.height / 20,
//                         width: MediaQuery.of(context).size.width / 2,
//                       ),
//                     ),
//                     Positioned(
//                       top: 110.h,
//                       left: 10.w,
//                       child: Container(
//                         width: 100.w, // button
//                         height: 30.h,
//                         decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter,
//                                 colors: [Color(0xff028C14), Color(0xff322C2C)]),
//                             borderRadius: BorderRadius.circular(10.r),
//                             border: Border.all(color: Color(0xff01576D))),
//                         child: Center(
//                           child: Padding(
//                             padding: EdgeInsets.only(bottom: 3.h),
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
//                   ],
//                 ),
//               ),
//               // SizedBox(
//               //   height: 30.h,
//               // ),
//               // Container(
//               //   height: 170.h,
//               //   child: Stack(
//               //     children: [
//               //       Container(
//               //         width: 375.w, // a to g
//               //         height: 150.h,
//               //         decoration: BoxDecoration(
//               //             borderRadius: BorderRadius.circular(10.r),
//               //             gradient: LinearGradient(
//               //                 begin: Alignment.topCenter,
//               //                 end: Alignment.bottomCenter,
//               //                 colors: [Color(0xff037491), Color(0xff000000)])),
//               //         child: Row(
//               //           mainAxisAlignment: MainAxisAlignment.center,
//               //           crossAxisAlignment: CrossAxisAlignment.start,
//               //           children: [
//               //             Padding(
//               //               padding: EdgeInsets.only(top: 8.h),
//               //               child: Text(
//               //                 "Ahmedabad To Goa",
//               //                 style: TextStyle(
//               //                     fontSize: 18.sp,
//               //                     fontFamily: "SegoeUI",
//               //                     fontWeight: FontWeight.bold,
//               //                     color: Colors.white),
//               //               ),
//               //             ),
//               //           ],
//               //         ),
//               //       ),
//               //       Positioned(
//               //           top: 35.h,
//               //           left: 3.w,
//               //           child: Container(
//               //             width: 370.w, // box
//               //             height: 110.h,
//               //             decoration: BoxDecoration(
//               //                 color: Colors.white,
//               //                 borderRadius: BorderRadius.circular(10.r),
//               //                 border: Border.all(color: Color(0xff01576D))),
//               //             child: Padding(
//               //               padding: EdgeInsets.only(
//               //                   left: 8.w, top: 8.h, right: 8.w),
//               //               child: Row(
//               //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //                 children: [
//               //                   Column(
//               //                     crossAxisAlignment: CrossAxisAlignment.start,
//               //                     children: [
//               //                       Text(
//               //                         "Trip/package ID: 2548756523",
//               //                         style: TextStyle(
//               //                             fontSize: 12.sp,
//               //                             fontFamily: "SegoeUI",
//               //                             fontWeight: FontWeight.bold,
//               //                             color: Colors.black),
//               //                       ),
//               //                       SizedBox(
//               //                         height: 5.h, // up cancle
//               //                       ),
//               //                       Text(
//               //                         "Booking Date: 27/02/2021",
//               //                         style: TextStyle(
//               //                             fontSize: 12.sp,
//               //                             fontFamily: "SegoeUI",
//               //                             fontWeight: FontWeight.bold,
//               //                             color: Colors.black),
//               //                       ),
//               //                       SizedBox(
//               //                         height: 5.h, // up cancle
//               //                       ),
//               //                       Text(
//               //                         "Total Person: 2",
//               //                         style: TextStyle(
//               //                             fontSize: 12.sp,
//               //                             fontFamily: "SegoeUI",
//               //                             fontWeight: FontWeight.bold,
//               //                             color: Colors.black),
//               //                       ),
//               //                     ],
//               //                   ),
//               //                   Column(
//               //                     crossAxisAlignment: CrossAxisAlignment.start,
//               //                     children: [
//               //                       Text(
//               //                         "View More Details",
//               //                         style: TextStyle(
//               //                             fontSize: 12.sp,
//               //                             fontFamily: "SegoeUI",
//               //                             fontWeight: FontWeight.bold,
//               //                             color: Color(0xffEE1B1B)),
//               //                       ),
//               //                       SizedBox(
//               //                         height: 5.h, // up cancle
//               //                       ),
//               //                       Text(
//               //                         "Agency Contact No: 96244**4*0",
//               //                         style: TextStyle(
//               //                             fontSize: 12.sp,
//               //                             fontFamily: "SegoeUI",
//               //                             fontWeight: FontWeight.bold,
//               //                             color: Colors.black),
//               //                       ),
//               //                       SizedBox(
//               //                         height: 5.h, // up cancle
//               //                       ),
//               //                       Text(
//               //                         "Contact Person: Tour Bharat",
//               //                         style: TextStyle(
//               //                             fontSize: 12.sp,
//               //                             fontFamily: "SegoeUI",
//               //                             fontWeight: FontWeight.bold,
//               //                             color: Colors.black),
//               //                       ),
//               //                     ],
//               //                   ),
//               //                 ],
//               //               ),
//               //             ),
//               //           )),
//               //       Positioned(
//               //         top: 110.h,
//               //         left: 10.w,
//               //         child: Container(
//               //           width: 100.w, // button
//               //           height: 30.h,
//               //           decoration: BoxDecoration(
//               //               gradient: LinearGradient(
//               //                   begin: Alignment.topCenter,
//               //                   end: Alignment.bottomCenter,
//               //                   colors: [Color(0xff8C0202), Color(0xff460301)]),
//               //               borderRadius: BorderRadius.circular(10.r),
//               //               border: Border.all(color: Color(0xff01576D))),
//               //           child: Center(
//               //             child: Padding(
//               //               padding: EdgeInsets.only(bottom: 3.h),
//               //               child: Text(
//               //                 "Cancelled",
//               //                 style: TextStyle(
//               //                     fontSize: 16.sp,
//               //                     fontFamily: "SegoeUI",
//               //                     fontWeight: FontWeight.bold,
//               //                     color: Colors.white),
//               //               ),
//               //             ),
//               //           ),
//               //         ),
//               //       ),
//               //     ],
//               //     //overflow: Overflow.visible,
//               //   ),
//               // ),
//               // SizedBox(
//               //   height: 30.h,
//               // ),
//               // Container(
//               //   child: Column(
//               //     children: [
//               //       Container(
//               //         height: (whatYouWrote1 == true) ? 250.h : 160.h,
//               //         child: Stack(
//               //           children: [
//               //             Container(
//               //               width: 375.w, // a to g
//               //               height: 150.h,
//               //               decoration: BoxDecoration(
//               //                   borderRadius: BorderRadius.circular(10.r),
//               //                   gradient: LinearGradient(
//               //                       begin: Alignment.topCenter,
//               //                       end: Alignment.bottomCenter,
//               //                       colors: [
//               //                         Color(0xff037491),
//               //                         Color(0xff000000)
//               //                       ])),
//               //               child: Row(
//               //                 mainAxisAlignment: MainAxisAlignment.center,
//               //                 crossAxisAlignment: CrossAxisAlignment.start,
//               //                 children: [
//               //                   Padding(
//               //                     padding: EdgeInsets.only(top: 8.h),
//               //                     child: Text(
//               //                       "Ahmedabad To Goa",
//               //                       style: TextStyle(
//               //                           fontSize: 18.sp,
//               //                           fontFamily: "SegoeUI",
//               //                           fontWeight: FontWeight.bold,
//               //                           color: Colors.white),
//               //                     ),
//               //                   ),
//               //                 ],
//               //               ),
//               //             ),
//               //             Positioned(
//               //                 top: 35.h,
//               //                 left: 3.w,
//               //                 child: Container(
//               //                   width: 370.w, // box
//               //                   height: 110.h,
//               //                   decoration: BoxDecoration(
//               //                       color: Colors.white,
//               //                       borderRadius: BorderRadius.circular(10.r),
//               //                       border:
//               //                       Border.all(color: Color(0xff01576D))),
//               //                   child: Column(
//               //                     children: [
//               //                       Padding(
//               //                         padding: EdgeInsets.only(
//               //                             left: 8.w, top: 8.h, right: 8.w),
//               //                         child: Row(
//               //                           mainAxisAlignment:
//               //                           MainAxisAlignment.spaceBetween,
//               //                           children: [
//               //                             Column(
//               //                               crossAxisAlignment:
//               //                               CrossAxisAlignment.start,
//               //                               children: [
//               //                                 Text(
//               //                                   "Trip/package ID: 2548756523",
//               //                                   style: TextStyle(
//               //                                       fontSize: 12.sp,
//               //                                       fontFamily: "SegoeUI",
//               //                                       fontWeight: FontWeight.bold,
//               //                                       color: Colors.black),
//               //                                 ),
//               //                                 SizedBox(
//               //                                   height: 5.h,
//               //                                 ),
//               //                                 Text(
//               //                                   "Booking Date: 27/02/2021",
//               //                                   style: TextStyle(
//               //                                       fontSize: 12.sp,
//               //                                       fontFamily: "SegoeUI",
//               //                                       fontWeight: FontWeight.bold,
//               //                                       color: Colors.black),
//               //                                 ),
//               //                                 SizedBox(
//               //                                   height: 5.h,
//               //                                 ),
//               //                                 Text(
//               //                                   "Total Person: 2",
//               //                                   style: TextStyle(
//               //                                       fontSize: 12.sp,
//               //                                       fontFamily: "SegoeUI",
//               //                                       fontWeight: FontWeight.bold,
//               //                                       color: Colors.black),
//               //                                 ),
//               //                               ],
//               //                             ),
//               //                             Column(
//               //                               crossAxisAlignment:
//               //                               CrossAxisAlignment.start,
//               //                               children: [
//               //                                 Text(
//               //                                   "View More Details",
//               //                                   style: TextStyle(
//               //                                       fontSize: 12.sp,
//               //                                       fontFamily: "SegoeUI",
//               //                                       fontWeight: FontWeight.bold,
//               //                                       color: Color(0xffEE1B1B)),
//               //                                 ),
//               //                                 SizedBox(
//               //                                   height: 5.h,
//               //                                 ),
//               //                                 Text(
//               //                                   "Agency Contact No: 96244**4*0",
//               //                                   style: TextStyle(
//               //                                       fontSize: 12.sp,
//               //                                       fontFamily: "SegoeUI",
//               //                                       fontWeight: FontWeight.bold,
//               //                                       color: Colors.black),
//               //                                 ),
//               //                                 SizedBox(
//               //                                   height: 5.h,
//               //                                 ),
//               //                                 Text(
//               //                                   "Contact Person: Tour Bharat",
//               //                                   style: TextStyle(
//               //                                       fontSize: 12.sp,
//               //                                       fontFamily: "SegoeUI",
//               //                                       fontWeight: FontWeight.bold,
//               //                                       color: Colors.black),
//               //                                 ),
//               //                               ],
//               //                             ),
//               //                           ],
//               //                         ),
//               //                       ),
//               //                       SizedBox(
//               //                         height: 5.h,
//               //                       ),
//               //                       Row(
//               //                         mainAxisAlignment:
//               //                         MainAxisAlignment.spaceBetween,
//               //                         children: [
//               //                           SizedBox(
//               //                             width: 130.w,
//               //                           ),
//               //                           Row(
//               //                             children: [
//               //                               Icon(
//               //                                 Icons.star,
//               //                                 color: Color(0xff025B72),
//               //                                 size: 20.sp,
//               //                               ),
//               //                               Icon(
//               //                                 Icons.star,
//               //                                 color: Color(0xff025B72),
//               //                                 size: 20.sp,
//               //                               ),
//               //                               Icon(
//               //                                 Icons.star,
//               //                                 color: Color(0xff025B72),
//               //                                 size: 20.sp,
//               //                               ),
//               //                               Icon(
//               //                                 Icons.star,
//               //                                 color: Color(0xff025B72),
//               //                                 size: 20.sp,
//               //                               ),
//               //                               Icon(
//               //                                 Icons.star_border,
//               //                                 color: Color(0xff025B72),
//               //                                 size: 20.sp,
//               //                               ),
//               //                             ],
//               //                           ),
//               //                           InkWell(
//               //                             onTap: () {
//               //                               setState(() {
//               //                                 whatYouWrote1 = !whatYouWrote1;
//               //                               });
//               //                             },
//               //                             child: Row(
//               //                               children: [
//               //                                 Text(
//               //                                   "What you wrote",
//               //                                   style: TextStyle(
//               //                                       fontSize: 12.sp,
//               //                                       fontFamily: "SegoeUI",
//               //                                       fontWeight: FontWeight.bold,
//               //                                       color: Color(0xffEE1B1B)),
//               //                                 ),
//               //                                 (whatYouWrote1 == false)
//               //                                     ? Icon(Icons.arrow_drop_down)
//               //                                     : Icon(Icons.arrow_drop_up),
//               //                               ],
//               //                             ),
//               //                           )
//               //                         ],
//               //                       ),
//               //                     ],
//               //                   ),
//               //                 )),
//               //             Positioned(
//               //               top: 145.h,
//               //               left: 70.w,
//               //               child: (whatYouWrote1 == true)
//               //                   ? Container(
//               //                 height: 100.h,
//               //                 // color: Colors.green,
//               //                 child: Stack(
//               //                   children: [
//               //                     Container(
//               //                       height: 60.h,
//               //                       width: 300.w,
//               //                       decoration: BoxDecoration(
//               //                         color: Colors.white,
//               //                         boxShadow: [
//               //                           BoxShadow(
//               //                               color: Colors.grey,
//               //                               blurRadius: 3.r,
//               //                               offset: Offset(1, 1))
//               //                         ],
//               //                         borderRadius: BorderRadius.only(
//               //                             bottomLeft:
//               //                             Radius.circular(10.r),
//               //                             bottomRight:
//               //                             Radius.circular(10.r)),
//               //                       ),
//               //                       child: Padding(
//               //                         padding: EdgeInsets.only(
//               //                             top: 15.h, left: 12.w),
//               //                         child: Text(
//               //                           "Lorem ipsum adajdhfb fhoir feifja ytfeiuoae uag jyaegek kaunee oaehi ieqhii iueqi hdsu. Thankyou.",
//               //                           textAlign: TextAlign.left,
//               //                           style: TextStyle(
//               //                               fontSize: 12.sp,
//               //                               fontFamily: "SegoeUI",
//               //                               fontWeight: FontWeight.bold,
//               //                               color: Colors.grey),
//               //                         ),
//               //                       ),
//               //                     ),
//               //                     Positioned(
//               //                       top: 69.h,
//               //                       right: 82.w,
//               //                       child: InkWell(
//               //                         onTap: () {
//               //                           _showRatingDialog();
//               //                         },
//               //                         child: Container(
//               //                           height: 25.h,
//               //                           width: 70.w,
//               //                           decoration: BoxDecoration(
//               //                             color: Color(0xff004354),
//               //                             borderRadius:
//               //                             BorderRadius.circular(5.r),
//               //                           ),
//               //                           child: Center(
//               //                             child: Row(
//               //                               mainAxisAlignment:
//               //                               MainAxisAlignment
//               //                                   .spaceEvenly,
//               //                               children: [
//               //                                 Icon(
//               //                                   Icons.edit,
//               //                                   size: 10.sp,
//               //                                   color: Colors.white,
//               //                                 ),
//               //                                 Text(
//               //                                   "Edit",
//               //                                   style: TextStyle(
//               //                                       fontSize: 12.sp,
//               //                                       fontFamily: "SegoeUI",
//               //                                       fontWeight:
//               //                                       FontWeight.bold,
//               //                                       color: Colors.white),
//               //                                 ),
//               //                               ],
//               //                             ),
//               //                           ),
//               //                         ),
//               //                       ),
//               //                     ),
//               //                     Positioned(
//               //                         top: 69.h,
//               //                         right: 5.w,
//               //                         child: Container(
//               //                           height: 25.h,
//               //                           width: 70.w,
//               //                           decoration: BoxDecoration(
//               //                             color: Color(0xffEE1B1B),
//               //                             borderRadius:
//               //                             BorderRadius.circular(5.r),
//               //                           ),
//               //                           child: Center(
//               //                             child: Row(
//               //                               mainAxisAlignment:
//               //                               MainAxisAlignment
//               //                                   .spaceEvenly,
//               //                               children: [
//               //                                 Icon(
//               //                                   Icons.delete,
//               //                                   size: 10.sp,
//               //                                   color: Colors.white,
//               //                                 ),
//               //                                 Text(
//               //                                   "Delete",
//               //                                   style: TextStyle(
//               //                                       fontSize: 12.sp,
//               //                                       fontFamily: "SegoeUI",
//               //                                       fontWeight:
//               //                                       FontWeight.bold,
//               //                                       color: Colors.white),
//               //                                 ),
//               //                               ],
//               //                             ),
//               //                           ),
//               //                         )),
//               //                   ],
//               //                 ),
//               //               )
//               //                   : Container(
//               //                 height: 0.h,
//               //                 width: 0.w,
//               //               ),
//               //             ),
//               //             Positioned(
//               //               top: 110.h,
//               //               left: 10.w,
//               //               child: Container(
//               //                 width: 100.w, // button
//               //                 height: 30.h,
//               //                 decoration: BoxDecoration(
//               //                     gradient: LinearGradient(
//               //                         begin: Alignment.topCenter,
//               //                         end: Alignment.bottomCenter,
//               //                         colors: [
//               //                           Color(0xff037491),
//               //                           Color(0xff013846)
//               //                         ]),
//               //                     borderRadius: BorderRadius.circular(10.r),
//               //                     border: Border.all(color: Color(0xff01576D))),
//               //                 child: Center(
//               //                   child: Padding(
//               //                     padding: EdgeInsets.only(bottom: 3.h),
//               //                     child: Text(
//               //                       "Completed",
//               //                       style: TextStyle(
//               //                           fontSize: 16.sp,
//               //                           fontFamily: "SegoeUI",
//               //                           fontWeight: FontWeight.bold,
//               //                           color: Colors.white),
//               //                     ),
//               //                   ),
//               //                 ),
//               //               ),
//               //             ),
//               //           ],
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               // ),
//             ]),
//           ]),
//         ));
//   }
// }
