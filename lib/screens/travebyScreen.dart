import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:syt/screens/mydeparturedateScreen.dart';
import '../Api.dart';
import '../models/gettravelby_catagory_model.dart';

class TravelBy extends StatefulWidget {
  String departure, destination, adult, childe, infant, personal_care;
  List<String> category;
  TravelBy(this.departure, this.destination, this.adult, this.childe,
      this.infant, this.category, this.personal_care,
      {Key? key})
      : super(key: key);

  @override
  _TravelByState createState() => _TravelByState();
}

class _TravelByState extends State<TravelBy> {
  List<String> travelby = ["train"];
  // bool checkbox1 = true;
  // bool checkbox2 = false;
  // bool checkbox3 = false;
  // bool checkbox4 = false;
  List checkbox = [true, false, false, false];
  // use only for chek validation
  // bool isAnyCheckboxSelected = false;

  // // chek validatate
  // @override
  // void initState() {
  //   super.initState();
  //   checkIfAnyCheckboxSelected();
  // }

  // void checkIfAnyCheckboxSelected() {
  //   setState(() {
  //     isAnyCheckboxSelected = checkbox.contains(true);
  //   });
  // }

  // end
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),

        // height: MediaQuery.of(context).size.height / 10,
        height: 10.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                bool isAnycheckboxSelcted = checkbox.contains(true);
                if (isAnycheckboxSelcted) {
                  print("Forward to MyDeparturedPage");
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => MyDepartureDate(
                  //         widget.departure,
                  //         widget.destination,
                  //         widget.adult,
                  //         widget.childe,
                  //         widget.infant,
                  //         travelby,
                  //         widget.category,
                  //         widget.personal_care,
                  //     ))
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyDepartureDate(
                          widget.departure,
                          widget.destination,
                          widget.adult,
                          widget.childe,
                          widget.infant,
                          travelby,
                          widget.category,
                          widget.personal_care,
                        ),
                      ));
                } else {
                  print("Please select at least one travel option.");
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
                        color: Colors.grey, blurRadius: 3, offset: Offset(1, 2))
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
      backgroundColor: Colors.white,
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
          "Travel By",
          style: TextStyle(
              fontSize: 12,
              fontFamily: "SegoeUI",
              fontWeight: FontWeight.bold,
              color: Color(0xff004351)),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 17, right: 26, left: 26),
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
                    height: 5.h,
                  ),
                  Container(
                    height: 30.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xff1DD9B7),
                              Color(0xff004148),
                            ])),
                    child: Padding(
                      padding: EdgeInsets.only(right: 25, left: 25, top: 36),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Travel By",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Color(0xffFFFFFF)),
                          ),
                          SizedBox(height: 3.h),
                          Container(
                              height: 15.h,
                              width: 88.w,
                              // color: Colors.red,
                              child: FutureBuilder<gettravelby_catagory_model>(
                                  future:
                                      Gettravelby_catagory().gettravelbyList(),
                                  builder: (context, snapshots) {
                                    return (snapshots.hasData)
                                        ? GridView.builder(
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              childAspectRatio: 3,
                                              crossAxisCount: 2,
                                            ),
                                            itemCount:
                                                snapshots.data!.data!.length,
                                            itemBuilder: (context, index) {
                                              var server =
                                                  snapshots.data!.data![index];
                                              return Row(
                                                children: [
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
                                                          travelby.add(server
                                                              .name
                                                              .toString());
                                                        } else {
                                                          travelby.remove(server
                                                              .name
                                                              .toString());
                                                        }
                                                        //  print( + ">>>>>>>>>>>>>>>>>>>>");
                                                        print(jsonEncode(
                                                                travelby) +
                                                            "999999999999999999999");

                                                        print(
                                                            travelby.join(","));
                                                      },
                                                    ),
                                                  ),
                                                  Text(
                                                    server.name.toString(),
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
                                            })
                                        : Center(
                                            child: CircularProgressIndicator());
                                  })),
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
    );
  }
}
