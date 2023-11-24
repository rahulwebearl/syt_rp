import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syt/screens/additionaldetails.dart';
    
    class SetYourBudget extends StatefulWidget {
      const SetYourBudget({Key? key}) : super(key: key);
    
      @override
      _SetYourBudgetState createState() => _SetYourBudgetState();
    }
    
    class _SetYourBudgetState extends State<SetYourBudget> {
  int selected =0;
  _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              child:
              Container(
                height: 357.h,
                width: 357.w,
                child: Column(
                  children: [
                    SizedBox(
                      height: 18.h,
                    ),
                    Text(
                      "Contact Details",
                      style: TextStyle(
                          fontFamily: "Franklin_Gothic",
                          color: Colors.black,
                          fontSize: 14),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Container(
                      width: 250.w,
                      child:
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Please enter Email ID",
                          hintStyle: TextStyle(
                            fontSize: 12,
                          ),
                          suffixIcon: Icon(Icons.mail,
                            size: 20,
                          )
                        ),
                      ),
                    ),
                    Container(
                      width:250.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Container(
                            width: 30.w,
                            child: TextFormField(
                              initialValue: "+91",
                              readOnly: true,
                            ),
                          ),
                          Container(
                            width: 217.w,
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Mobile No",
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                ),


                            ),
                          ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 250.w,
                      child:
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "User Name",
                            hintStyle: TextStyle(
                              fontSize: 12,
                            ),
                            )
                        ),
                      ),
                    SizedBox(
                      height: 45.h,
                    ),
                    InkWell(
                      onTap: (){
                         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AdditionalDetails()));
                      },
                      child: Container(
                        height: 35.h,
                        width: 180.w,
                        decoration: BoxDecoration(
                          color: Color(0xff09646D),
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [BoxShadow(
                              color: Colors.grey,
                              blurRadius: 3,
                              offset: Offset(1,2)

                          )
                          ],
                        ),
                        child: Center(
                          child:  Text(
                            "Next",
                            style: TextStyle(

                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color:Colors.white),
                          ),
                        ),

                      ),
                    ),
                  ],
                ),
              ));
        });
  }

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
            title:
            Text(
              "Set Your Budget",
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "SegoeUI",
                  fontWeight: FontWeight.bold,
                  color:Color(0xff004351)),
            ),
            centerTitle: true,
          ),
          body: Container(
            color: Colors.white,
            child: ListView(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Column(
                          children: [
                            customButton("1", 0),
                            SizedBox(
                              height: 16.h,
                            ),
                            Text(
                              "15,450 - 17,550",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "SegoeUI",
                                  fontWeight: FontWeight.bold,
                                  color:Color(0xff004351)),
                            ),
                            SizedBox(
                              height: 7.h,
                            ),
                            Text(
                              "Per Person",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "SegoeUI",
                                  fontWeight: FontWeight.bold,
                                  color:Colors.grey),
                            ),
                          ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              customButton("2", 1),
                              SizedBox(
                                height: 16.h,
                              ),
                              Text(
                                "18,550 - 20,700",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "SegoeUI",
                                    fontWeight: FontWeight.bold,
                                    color:Color(0xff004351)),
                              ),
                              SizedBox(
                                height: 7.h,
                              ),
                              Text(
                                "Per Person",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "SegoeUI",
                                    fontWeight: FontWeight.bold,
                                    color:Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              customButton("3", 2),
                              SizedBox(
                                height: 16.h,
                              ),
                              Text(
                                "21,600 - 24,700",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "SegoeUI",
                                    fontWeight: FontWeight.bold,
                                    color:Color(0xff004351)),
                              ),
                              SizedBox(
                                height: 7.h,
                              ),
                              Text(
                                "Per Person",
                                style: TextStyle(

                                    fontSize: 12,
                                    fontFamily: "SegoeUI",
                                    fontWeight: FontWeight.bold,
                                    color:Colors.grey),
                              ),
                            ],
                          ),
                        ),



                      ],
                    ),
                    SizedBox(
                      height: 43.h,
                    ),
                    Text(
                      "Or",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "SegoeUI",
                          fontWeight: FontWeight.bold,
                          color:Color(0xff000000)),
                    ),
                    SizedBox(
                      height: 27.h,
                    ),
                    Text(
                      "Customise Your Budget",
                      style: TextStyle(

                          fontSize: 12,
                          fontFamily: "SegoeUI",
                          fontWeight: FontWeight.bold,
                          color:Color(0xff000000)),
                    ),
                    SizedBox(
                      height: 63.h,
                    ),
                    Container(
                      width: 220.w,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                        hintText:"Enter Your Budget Amount",
                          hintStyle: TextStyle(
                            fontSize: 12,
                          ),
                          suffixIcon: Icon(Icons.swap_vert_circle_outlined),
                        ),
                      ),
                    ),
                     Row(
                       children: [
                         SizedBox(
                           width: 248.w,
                         ),
                         Text(
                          "Per Person",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "SegoeUI",
                              fontWeight: FontWeight.bold,
                              color:Colors.grey)),
                       ],
                     ),
                    SizedBox(
                      height: 104.h,
                    ),
                    InkWell(
                      onTap: (){
                        _showDialog();
                       // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SetYourBudget()));
                      },
                      child: Container(
                        height: 35.h,
                        width: 180.w,
                        decoration: BoxDecoration(
                          color: Color(0xff09646D),
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [BoxShadow(
                              color: Colors.grey,
                              blurRadius: 3,
                              offset: Offset(1,2)

                          )
                          ],
                        ),
                        child: Center(
                          child:  Text(
                            "Next",
                            style: TextStyle(

                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color:Colors.white),
                          ),
                        ),

                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }

      Widget customButton(String image,int index){
        return InkWell(
          onTap: (){
            setState(() {
              selected = index;
            });

          },
          child: Container(
            height: 75.h,
            width: 75.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: (selected==index)?Colors.red:Colors.grey)
            ),
            child:Center(
              child: Text(
                image
              ),
            )
           // Image.network(image,fit: BoxFit.fill,),

          ),
        );
      }
    }
    