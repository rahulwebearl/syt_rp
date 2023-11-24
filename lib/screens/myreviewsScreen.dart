import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyReviews extends StatefulWidget {
  @override
  _MyReviewsState createState() => _MyReviewsState();
}

class _MyReviewsState extends State<MyReviews> {
  bool whatYouWrote1 = false;
  bool whatYouWrote2 = false;
  bool whatYouWrote3= false;
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
          "My Reviews",
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
            Column(children: [
              SizedBox(
                height: 25.h,
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      height: 145.h,
                      child: Stack(
                        children: [
                          Container(
                            width: 373.w,
                            height: 80.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xff037491),
                                      Color(0xff000000)
                                    ])),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 8.h),
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
                              top: 35.h,
                              left: 3.w,
                              child: Container(
                                width: 367.w,
                                height: 110.h,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.r),
                                    border: Border.all(color: Color(0xff01576D))),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 8.w, top: 8.h, right: 8.w),
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
                                                height: 3.h,
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
                                                height: 3.h,
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
                                                height: 3.h,
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
                                                height: 3.h,
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
                                      height: 8.h,

                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 70.w,
                                        ),
                                        Row(

                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Color(0xff025B72),
                                              size: 20,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Color(0xff025B72),
                                              size: 20,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Color(0xff025B72),
                                              size: 20,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Color(0xff025B72),
                                              size: 20,
                                            ),
                                            Icon(
                                              Icons.star_border,
                                              color: Color(0xff025B72),
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                        //SizedBox(width: 50.w,),
                                        InkWell(
                                          onTap: (){
                                            setState(() {
                                              whatYouWrote1 = !whatYouWrote1;
                                            });
                                          },
                                          child: Row(
                                            children: [
                                              Text(
                                                "What you wrote",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: "SegoeUI",
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xffEE1B1B)),
                                              ),
                                              (whatYouWrote1==false)?Icon(Icons.arrow_drop_down):Icon(Icons.arrow_drop_up),

                                            ],
                                          ),
                                        )
                                      ],
                                    ),

                                  ],
                                ),
                              )),

                        ],
                      ),
                    ),
                    (whatYouWrote1==true)?
                    Container(
                      height: 90.h,
                      child: Stack(
                        children: [
                          Container(height: 77.h,width: 310,decoration: BoxDecoration(color:Colors.white,
                            boxShadow: [BoxShadow(
                                color: Colors.grey,
                                blurRadius: 3,
                                offset: Offset(0,2)

                            )
                            ],
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.r),
                                bottomRight: Radius.circular(10.r)),

                          ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Lorem ipsum adajdhfb fhoir feifja ytfeiuoae uag jyaegek kaunee oaehi ieqhii iueqi hdsu. Thankyou.",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "SegoeUI",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                            ),),
                          Positioned(top: 68.h,right: 82.w,
                            child: Container(
                              height: 22.h,
                              width: 70.w,
                              decoration: BoxDecoration(
                                color: Color(0xff004354),
                                borderRadius: BorderRadius.circular(5.r),

                              ),
                              child: Center(
                                child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    Icon(Icons.edit,size: 10,color: Colors.white,),
                                    SizedBox(
                                      width:5.w ,
                                    ),
                                    Text(
                                      "Edit",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(top: 68.h,right: 5.w,
                              child: Container(
                                height: 22.h,
                                width: 70.w,
                                decoration: BoxDecoration(
                                  color: Color(0xffEE1B1B),
                                  borderRadius: BorderRadius.circular(5.r),

                                ),
                                child: Center(
                                  child:  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      Icon(Icons.delete,size: 10,color: Colors.white,),
                                      SizedBox(
                                        width:5.w ,
                                      ),
                                      Text(
                                        "Delete",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: "SegoeUI",
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              )),

                        ],
                      ),
                    ):Container(height: 0,width: 0,),

                  ],
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      height: 145.h,
                      child: Stack(
                        children: [
                          Container(
                            width: 373.w,
                            height: 80.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xff037491),
                                      Color(0xff000000)
                                    ])),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 8.h),
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
                              top: 35.h,
                              left: 3.w,
                              child: Container(
                                width: 367.w,
                                height: 110.h,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.r),
                                    border: Border.all(color: Color(0xff01576D))),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 8.w, top: 8.h, right: 8.w),
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
                                                height: 3.h,
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
                                                height: 3.h,
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
                                                height: 3.h,
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
                                                height: 3.h,
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
                                      height: 8.h,

                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 70.w,
                                        ),
                                        Row(

                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Color(0xff025B72),
                                              size: 20,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Color(0xff025B72),
                                              size: 20,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Color(0xff025B72),
                                              size: 20,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Color(0xff025B72),
                                              size: 20,
                                            ),
                                            Icon(
                                              Icons.star_border,
                                              color: Color(0xff025B72),
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                        //SizedBox(width: 50.w,),
                                        InkWell(
                                          onTap: (){
                                            setState(() {
                                              whatYouWrote2 = !whatYouWrote2;
                                            });
                                          },
                                          child: Row(
                                            children: [
                                              Text(
                                                "What you wrote",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: "SegoeUI",
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xffEE1B1B)),
                                              ),
                                              (whatYouWrote2==false)?Icon(Icons.arrow_drop_down):Icon(Icons.arrow_drop_up),

                                            ],
                                          ),
                                        )
                                      ],
                                    ),

                                  ],
                                ),
                              )),

                        ],
                      ),
                    ),
                    (whatYouWrote2==true)?
                    Container(
                      height: 90.h,
                      child: Stack(
                        children: [
                          Container(height: 77.h,width: 310,decoration: BoxDecoration(color:Colors.white,
                            boxShadow: [BoxShadow(
                                color: Colors.grey,
                                blurRadius: 3,
                                offset: Offset(0,2)

                            )
                            ],
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.r),
                                bottomRight: Radius.circular(10.r)),

                          ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Lorem ipsum adajdhfb fhoir feifja ytfeiuoae uag jyaegek kaunee oaehi ieqhii iueqi hdsu. Thankyou.",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "SegoeUI",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                            ),),
                          Positioned(top: 68.h,right: 82.w,
                            child: Container(
                              height: 22.h,
                              width: 70.w,
                              decoration: BoxDecoration(
                                color: Color(0xff004354),
                                borderRadius: BorderRadius.circular(5.r),

                              ),
                              child: Center(
                                child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    Icon(Icons.edit,size: 10,color: Colors.white,),
                                    SizedBox(
                                      width:5.w ,
                                    ),
                                    Text(
                                      "Edit",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(top: 68.h,right: 5.w,
                              child: Container(
                                height: 22.h,
                                width: 70.w,
                                decoration: BoxDecoration(
                                  color: Color(0xffEE1B1B),
                                  borderRadius: BorderRadius.circular(5.r),

                                ),
                                child: Center(
                                  child:  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      Icon(Icons.delete,size: 10,color: Colors.white,),
                                      SizedBox(
                                        width:5.w ,
                                      ),
                                      Text(
                                        "Delete",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: "SegoeUI",
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              )),

                        ],
                      ),
                    ):Container(height: 0,width: 0,),

                  ],
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      height: 145.h,
                      child: Stack(
                        children: [
                          Container(
                            width: 373.w,
                            height: 80.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xff037491),
                                      Color(0xff000000)
                                    ])),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 8.h),
                                  child: Text(
                                    "Ahmedabad To Goa",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                              top: 35.h,
                              left: 3.w,
                              child: Container(
                                width: 367.w,
                                height: 110.h,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.r),
                                    border: Border.all(color: Color(0xff01576D))),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 8.w, top: 8.h, right: 8.w),
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
                                                height: 3.h,
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
                                                height: 3.h,
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
                                                height: 3.h,
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
                                                height: 3.h,
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
                                      height: 8.h,

                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 70.w,
                                        ),
                                        Row(

                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Color(0xff025B72),
                                              size: 20,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Color(0xff025B72),
                                              size: 20,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Color(0xff025B72),
                                              size: 20,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Color(0xff025B72),
                                              size: 20,
                                            ),
                                            Icon(
                                              Icons.star_border,
                                              color: Color(0xff025B72),
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                        //SizedBox(width: 50.w,),
                                        InkWell(
                                          onTap: (){
                                            setState(() {
                                              whatYouWrote3= !whatYouWrote3;
                                            });
                                          },
                                          child: Row(
                                            children: [
                                              Text(
                                                "What you wrote",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: "SegoeUI",
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xffEE1B1B)),
                                              ),
                                              (whatYouWrote3==false)?Icon(Icons.arrow_drop_down):Icon(Icons.arrow_drop_up),

                                            ],
                                          ),
                                        )
                                      ],
                                    ),

                                  ],
                                ),
                              )),

                        ],
                      ),
                    ),
                    (whatYouWrote3==true)?
                    Container(
                      height: 90.h,
                      child: Stack(
                        children: [
                          Container(height: 77.h,width: 310,decoration: BoxDecoration(color:Colors.white,
                            boxShadow: [BoxShadow(
                                color: Colors.grey,
                                blurRadius: 3,
                                offset: Offset(0,2)

                            )
                            ],
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.r),
                                bottomRight: Radius.circular(10.r)),

                          ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Lorem ipsum adajdhfb fhoir feifja ytfeiuoae uag jyaegek kaunee oaehi ieqhii iueqi hdsu. Thankyou.",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "SegoeUI",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                            ),),
                          Positioned(top: 68.h,right: 82.w,
                            child: Container(
                              height: 22.h,
                              width: 70.w,
                              decoration: BoxDecoration(
                                color: Color(0xff004354),
                                borderRadius: BorderRadius.circular(5.r),

                              ),
                              child: Center(
                                child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    Icon(Icons.edit,size: 10,color: Colors.white,),
                                    SizedBox(
                                      width:5.w ,
                                    ),
                                    Text(
                                      "Edit",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(top: 68.h,right: 5.w,
                              child: Container(
                                height: 22.h,
                                width: 70.w,
                                decoration: BoxDecoration(
                                  color: Color(0xffEE1B1B),
                                  borderRadius: BorderRadius.circular(5.r),

                                ),
                                child: Center(
                                  child:  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      Icon(Icons.delete,size: 10,color: Colors.white,),
                                      SizedBox(
                                        width:5.w ,
                                      ),
                                      Text(
                                        "Delete",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: "SegoeUI",
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              )),

                        ],
                      ),
                    ):Container(height: 0,width: 0,),

                  ],
                ),
              ),
              SizedBox(
                height: (whatYouWrote3==false)?120.h:30.h,
              ),


            ],)
          ],
        ),
      ),
    );
  }
}
