import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:syt/screens/travebyScreen.dart';

class TotalTraveller extends StatefulWidget {
  String departure, destination;
  List<String> category;
  TotalTraveller(this.departure, this.destination, this.category, {Key? key})
      : super(key: key);

  @override
  _TotalTravellerState createState() => _TotalTravellerState();
}

class _TotalTravellerState extends State<TotalTraveller> {
  String personal_care = "0";
  var adults = 1;
  var child = 0;
  var infant = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        height: 10.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                print("forward to Travel By page");
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => TravelBy(
                //         widget.departure,
                //         widget.destination,
                //         adults.toString(),
                //         child.toString(),
                //         infant.toString(),
                //         widget.category,
                //         personal_care,
                //     ))
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TravelBy(
                        widget.departure,
                        widget.destination,
                        adults.toString(),
                        child.toString(),
                        infant.toString(),
                        widget.category,
                        personal_care,
                      ),
                    ));
              },
              child: Container(
                height: 30,
                width: 24.w,
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
          "Total Traveller",
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
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 17, right: 26, left: 26),
              child: Column(
                children: [
                  Container(
                    // height: MediaQuery.of(context).size.height / 9,
                    // width: MediaQuery.of(context).size.width / 5,
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
                  Container(
                    // height: MediaQuery.of(context).size.height / 1.75,
                    // width: MediaQuery.of(context).size.width / 1,
                    height: 60.h,
                    width: 93.w,
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
                      child: Padding(
                        padding: EdgeInsets.only(right: 35, left: 35, top: 36),
                        child: ListView(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 3.h,
                                      width: 6.w,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                AssetImage("assets/adult.png")),
                                        // color: Colors.red,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text(
                                      "Adult(12+ years)",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffFFFFFF)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          if (adults > 1) {
                                            setState(() {
                                              adults--;
                                            });
                                          }
                                        },
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                          size: 30,
                                        )),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Text(
                                      "${adults}",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            adults++;
                                          });
                                        },
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 30,
                                        )),
                                  ],
                                ),
                                Container(
                                  width: 50.w,
                                  child: Divider(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 3.h,
                                      width: 6.w,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/2to12.png"))),
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Text(
                                      "Children(2 to 12 years)",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffFFFFFF)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          if (child > 0) {
                                            setState(() {
                                              child--;
                                            });
                                          }
                                        },
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                          size: 30,
                                        )),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Text(
                                      "${child}",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            child++;
                                          });
                                        },
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 30,
                                        )),
                                  ],
                                ),
                                Container(
                                  width: 40.w,
                                  child: Divider(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 3.h,
                                      width: 6.w,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/0to2.png"))),
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Text(
                                      "Infant(0 to 2 years)",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                          // color:Color(0xff004351)
                                          ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          if (infant > 0) {
                                            setState(() {
                                              infant--;
                                            });
                                          }
                                        },
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                          size: 30,
                                        )),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Text(
                                      "${infant}",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            infant++;
                                          });
                                        },
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 30,
                                        )),
                                  ],
                                ),
                                Container(
                                  width: 30.w,
                                  child: Divider(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Need any personal care?",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                          // color:Color(0xff004351)
                                          ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        Radio(
                                          activeColor: Colors.white,
                                          value: "1",
                                          groupValue: personal_care,
                                          onChanged: (value) {
                                            setState(() {
                                              personal_care = value.toString();
                                              print(personal_care);
                                            });
                                          },
                                        ),
                                        Text(
                                          "Yes",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: "SegoeUI",
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white
                                              // color:Color(0xff004351)
                                              ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                          activeColor: Colors.white,
                                          value: "0",
                                          groupValue: personal_care,
                                          onChanged: (value) {
                                            setState(() {
                                              personal_care = value.toString();
                                              print(personal_care);
                                            });
                                          },
                                        ),
                                        Text(
                                          "No",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: "SegoeUI",
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white
                                              // color:Color(0xff004351)
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
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
      ),
    );
  }
}
