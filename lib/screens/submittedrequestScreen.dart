import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubmittedRequest extends StatefulWidget {
  @override
  _SubmittedRequestState createState() => _SubmittedRequestState();
}

class _SubmittedRequestState extends State<SubmittedRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Submitted Request",
          style: TextStyle(
              fontSize: 14,
              fontFamily: "SegoeUI",
              fontWeight: FontWeight.bold,
              color: Color(0xff004351)),
        ),
        centerTitle: true,
      ),
      body: InkWell(
        onTap: () {
          //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CustomPackages()));
        },
        child: Container(
          color: Colors.white,
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 160.h,
                  ),
                  Container(
                    height: 140.h,
                    width: 140.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff005B62),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff005B62),
                            spreadRadius: 50.r,
                            blurRadius: 70.r,
                            offset: Offset(0, 0),
                          )
                        ]),
                    child: Center(
                      child: Image.asset("assets/thank-you.png"),
                    ),
                  ),
                  SizedBox(
                    height: 120.h,
                  ),
                  Text(
                    "Thank You..",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "SegoeUI",
                        fontWeight: FontWeight.bold,
                        color: Color(0xff004351)),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 78.w, left: 78.w),
                    child: Text(
                      "Your request has been submitted successfully. We will get In touch with you in 24hrs",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "SegoeUI",
                          fontWeight: FontWeight.bold,
                          color: Color(0xff7FAAAE)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
