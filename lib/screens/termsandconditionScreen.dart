import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Api.dart';
import '../models/policy_model.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({Key? key}) : super(key: key);

  @override
  _TermsAndConditionState createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
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
            "Terms And Condition",
            style: TextStyle(
                fontSize: 14,
                fontFamily: "SegoeUI",
                fontWeight: FontWeight.bold,
                color: Color(0xff004351)),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<policy_model>(
            future: policy().policylist(),
            builder: (context, snapshots) {
              return (snapshots.hasData)
                  ? Padding(
                      padding: EdgeInsets.only(left:20.r,right: 20.r),
                      child: Container(
                        color: Colors.white,
                        child: ListView(
                          children: [
                            SizedBox(
                              height: 15.h,
                            ),
                            // Text("term_and_condition_type : ${snapshots.data?.data?.termAndCondition?[0].termAndConditionType.toString()}",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),),
                            // SizedBox(
                            //   height: 30.h,
                            // ),
                            // Text("term_and_condition_for : ${snapshots.data?.data?.termAndCondition?[0].termAndConditionFor.toString()}",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),),
                            // SizedBox(
                            //   height: 30.h,
                            // ),

                            AnimatedContainer(
                              //height: 200.h,
                              duration: Duration(milliseconds: 300),
                              decoration: BoxDecoration(
                                color: Color(0xff004148),
                                  borderRadius: BorderRadius.circular(15),
                                  // gradient: LinearGradient(
                                  //     begin: Alignment.topCenter,
                                  //     end: Alignment.bottomCenter,
                                  //     colors: [
                                  //       Color(0xff1DD9B7),
                                  //       Color(0xff004148),
                                  //     ])
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(11.0),
                                child: Column(
                                  children: [
                                    Html(
                                     data:  snapshots.data?.data?[1].termAndConditionContent,
                                    ),
                                    Html(
                                     data:  snapshots.data?.data?[0].termAndConditionContent,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : Center(child: CircularProgressIndicator());
            }));
  }
}
