import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Api.dart';
import '../models/policy_model.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
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
            "Privacy Policy",
            style: TextStyle(
                fontSize: 18,
                fontFamily: "SegoeUI",
                fontWeight: FontWeight.bold,
                color: Color(0xff004351)),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<policy_model>(
            future: policy().policylist(),
            builder: (context, snapshots) {
              if (snapshots.hasData) {
                return Padding(
                      padding: EdgeInsets.only(left:20.r,right: 20.r),
                      child: Container(
                        color: Colors.white,
                        child: ListView(
                          children: [
                            // SizedBox(height: 15.h,),
                            // Text("policy_type : ${snapshots.data?.data?.policyData?[0].policyType.toString()}",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),),
                            // SizedBox(
                            //   height: 30.h,
                            // ),
                            // Text("policy_for : ${snapshots.data?.data?.policyData?[0].policyFor.toString()}",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),),
                            SizedBox(
                              height: 30.h,
                            ),
                            // Container(
                            //   padding: EdgeInsets.all(8.r),
                            //     width: 400.h,
                            //    decoration: BoxDecoration(
                            //      border: Border.all(style:BorderStyle.solid,color: Colors.black,width: 2 ),
                            //      borderRadius: BorderRadius.circular(10.r),
                            //    //gradient: LinearGradient(colors:[Colors.green,Colors.greenAccent])
                            //    ),
                            //    // color: Colors.indigoAccent,
                            //     child:
                            //     ),
                            Center(
                              child: AnimatedContainer(
                                //color: Colors.grey,
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
                                  child: Html(
                                   data: snapshots.data?.data?[2].termAndConditionContent.toString(),
                                    // style: TextStyle(
                                    //     color: Colors.white,
                                    //     fontSize: 16,
                                    //     fontWeight: FontWeight.bold
                                    // ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
