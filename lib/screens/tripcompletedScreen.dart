import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TripCompleted extends StatefulWidget {
  @override
  _TripCompletedState createState() => _TripCompletedState();
}

class _TripCompletedState extends State<TripCompleted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
          icon: Icon(Icons.arrow_back,color:Color(0xff004351) ,),
        ),
        title: Text(
          "Trip Completed",
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
            Column(
              children: [
                SizedBox(
                  height: 2.5.h,
                ),
                Container(
                  height: 13.h,
                  child: Stack(
                    children: [
                      Container(
                        width: 90.w,
                        height: 12.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xff037491),
                                  Color(0xff000000),
                                ])),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 1.h),
                              child: Text(
                                "Ahmedabad To Goa",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "SegoeUI",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          top: 35,
                          left: 3,
                          child: Container(
                            width: 90.w,
                            height: 9.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Color(0xff01576D))),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 8, top: 8, right: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Trip/package ID: 2548756523",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: "SegoeUI",
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 0.5.h,
                                          ),
                                          Text(
                                            "Booking Date: 27/02/2021",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: "SegoeUI",
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 0.5.h,
                                          ),
                                          Text(
                                            "Total Person: 2",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: "SegoeUI",
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "View More Details",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: "SegoeUI",
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xffEE1B1B)),
                                          ),
                                          SizedBox(
                                            height: 0.5.h,
                                          ),
                                          Text(
                                            "Agency Contact No: 96244**4*0",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: "SegoeUI",
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 0.5.h,
                                          ),
                                          Text(
                                            "Contact Person: Tour Bharat",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: "SegoeUI",
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(right: 8, left: 8),
                                  child: Text(
                                    "Trip Completed",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff2A9D00)),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 70, left: 70),
                  child: Text(
                    "We hope your journey was great, Please share your Experience with us.",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "SegoeUI",
                        fontWeight: FontWeight.bold,
                        color: Color(0xff7F7F7F)),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: Color(0xff025B72),
                      size: 24,
                    ),
                    Icon(
                      Icons.star,
                      color: Color(0xff025B72),
                      size: 24,
                    ),
                    Icon(
                      Icons.star,
                      color: Color(0xff025B72),
                      size: 24,
                    ),
                    Icon(
                      Icons.star,
                      color: Color(0xff025B72),
                      size: 24,
                    ),
                    Icon(
                      Icons.star_border,
                      color: Color(0xff025B72),
                      size: 24,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  height: 11.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3,
                        offset: Offset(0,2)
                    )
                    ],
                    borderRadius: BorderRadius.circular(15),

                ),
                  child: Padding(
                    padding: EdgeInsets.only(right: 8,left: 8),
                    child: TextFormField(
                      maxLines: 10,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Write experience here...",
                        hintStyle: TextStyle(
                          fontSize: 12,
                          color: Color(0xff7F7F7F)
                        )

                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                SizedBox(
                  height: 8.h,
                ),
                InkWell(onTap: (){
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NavigationBar()));
                },
                  child: Container(
                    height: 4.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                      color: Color(0xff09646D),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3,
                          offset: Offset(1,2)
                      )
                      ],
                    ),
                    child:  Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 2),
                        child: Text("Submit",style: TextStyle(
                            fontSize: 12,
                            fontFamily: "SegoeUI",
                            fontWeight: FontWeight.bold,
                            color: Colors.white

                        ),),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
