import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'honeymoondestinationsScreen.dart';

class SearchResult extends StatefulWidget {
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title:  Container(height: 50.h,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
          ),
          child: Padding(
            padding:  EdgeInsets.only(left: 8.w,bottom: 5.h),
            child: TextFormField(
              style: TextStyle(
                color: Colors.black
              ),
              initialValue: "goa",
              decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: IconButton(onPressed: () {  Navigator.of(context).pop(); },icon: Icon(Icons.close),),
              ),
              keyboardType: TextInputType.streetAddress,

            ),
          ),
        ),

      ),
      body: Container(
        color: Colors.white,
       child:
        ListView(
          children: [
            Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20.w,top: 20.h),
                    child: Text(
                      "Are You Looking For?",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "SegoeUI",
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 120.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20.w),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      HoneymoonDestinations()));
                            },
                            child: Container(
                              height: 76.h,
                              width: 85.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/Honeymoon.png"),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            "Honeymoon",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      HoneymoonDestinations()));
                            },
                            child: Container(
                              height: 76.h,
                              width: 85.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage("assets/Family.png"))),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            "Family",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      HoneymoonDestinations()));
                            },
                            child: Container(
                              height: 76.h,
                              width: 85.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                      AssetImage("assets/Adventure.png"))),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            "Adventure",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {


                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      HoneymoonDestinations()));
                            },
                            child: Container(
                              height: 76.h,
                              width: 85.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage("assets/friends.png"))),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            "Friends",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w,right: 20.w),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      HoneymoonDestinations()));
                            },
                            child: Container(
                              height: 76.h,
                              width: 85.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage("assets/nature.png"))),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            "Nature",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Goa",
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: "SegoeUI",
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                height: 160.h,
                width: 380.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                    boxShadow: [BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3.r,
                    offset: Offset(1,2)

                )]

                ),
                child: Container(
                  margin: EdgeInsets.only(top: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.calendar_today,color: Colors.black,),
                              SizedBox(width: 15.w,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Best Time to Visit",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    "Octo - Feb",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 20.h,),
                          Row(
                            children: [
                              Icon(Icons.watch_later_outlined,color: Colors.black,),
                              SizedBox(width: 15.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Ideal Duration",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    "4 - 5 Days",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),

                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.copy,color: Colors.black,),
                              SizedBox(width: 15.w,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Visa",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    "N/A",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 20.h,),
                          Row(
                            children: [
                              Icon(Icons.money,color: Colors.black,),
                              SizedBox(width: 15.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Starting From",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    "₹ 349",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),

                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20.w),
                    child: Text(
                      "Places To Visit In Goa",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "SegoeUI",
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>));
                    },
                    child: Text(
                      "View All",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "SegoeUI",
                          fontWeight: FontWeight.bold,
                          color: Color(0xffBE1C1C)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                height: 150.h,
                // color: Colors.green,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20.w),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: (){
                              //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PackagesScreen()));
                            },
                            child: Container(
                              height: 95.h,
                              width: 220.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "https://www.travelandleisureindia.in/wp-content/uploads/2020/04/Feature-image-Goa.jpg"),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "Calangute Beach (Goa)",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w),
                      child: Column(
                        children: [
                          Container(
                            height: 95.h,
                            width: 220.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://harstuff-travel.org/wp-content/uploads/2019/05/panaji-basilica-of-bom-jesus-147713353653-orijgp.jpg"),
                                )),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "Bom Jesus Goa Church",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w,right: 20.w),
                      child: Column(
                        children: [
                          Container(
                            height: 95.h,
                            width: 220.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://i.ytimg.com/vi/y9NDDxppjVI/maxresdefault.jpg"),
                                )),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "Ancient Goa",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20.w),
                    child: Text(
                      "Explore Things To Do In Goa",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "SegoeUI",
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>));
                    },
                    child: Text(
                      "View All",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "SegoeUI",
                          fontWeight: FontWeight.bold,
                          color: Color(0xffBE1C1C)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                // width: 100,
                height: 150.h,

                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20.w),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: (){
                              //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PackagesScreen()));
                            },
                            child: Container(
                              height: 110.h,
                              width: 220.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "https://www.travelandleisureindia.in/wp-content/uploads/2020/04/Feature-image-Goa.jpg"),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "Calangute Beach (Goa)",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w),
                      child: Column(
                        children: [
                          Container(
                            height: 95.h,
                            width: 220.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://harstuff-travel.org/wp-content/uploads/2019/05/panaji-basilica-of-bom-jesus-147713353653-orijgp.jpg"),
                                )),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "Bom Jesus Goa Church",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w,right: 20.w),
                      child: Column(
                        children: [
                          Container(
                            height: 95.h,
                            width: 220.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://i.ytimg.com/vi/y9NDDxppjVI/maxresdefault.jpg"),
                                )),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "Ancient Goa",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Traveller Reviews",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: "SegoeUI",
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 20.h,
              ),
            //  PageIndicatorContainer(child:
              Container(
                height: 150.h,
                margin: EdgeInsets.only(left: 20.w),
                // color: Colors.green,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: 380.w,
                      decoration: BoxDecoration(
                        // color: Colors.green,
                          borderRadius: BorderRadius.circular(10.r),
                          border:Border.all(color: Color(0xff707070))
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10.w,top: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 13.r,
                                      child: Center(child: Icon(Icons.person,size: 20,),),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      "Pratap",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "(Canada Trip)",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star,size: 20,color: Color(0xff1F08B1),),
                                    Icon(Icons.star,size: 20,color: Color(0xff1F08B1),),
                                    Icon(Icons.star,size: 20,color: Color(0xff1F08B1),),
                                    Icon(Icons.star,size: 20,color: Color(0xff1F08B1),),
                                    Icon(Icons.star_border,size: 20,color: Color(0xff1F08B1),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20.w,top: 10.h),
                            width: 340.w,
                            child: Text(
                              "Lprem is very wonderful experience. ipsum I sdn jaskk euifn hbe chek is very good I recommend to all lorem to visit.",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "SegoeUI",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Container(
                      width: 380.w,
                      decoration: BoxDecoration(
                        // color: Colors.green,
                          borderRadius: BorderRadius.circular(10.r),
                          border:Border.all(color: Color(0xff707070))
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10.w,top: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 13.r,
                                      child: Center(child: Icon(Icons.person,size: 20,),),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      "Pratap",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "(Canada Trip)",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star,size: 20,color: Color(0xff1F08B1),),
                                    Icon(Icons.star,size: 20,color: Color(0xff1F08B1),),
                                    Icon(Icons.star,size: 20,color: Color(0xff1F08B1),),
                                    Icon(Icons.star,size: 20,color: Color(0xff1F08B1),),
                                    Icon(Icons.star_border,size: 20,color: Color(0xff1F08B1),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20.w,top: 10.h),
                            width: 340.w,
                            child: Text(
                              "Lprem is very wonderful experience. ipsum I sdn jaskk euifn hbe chek is very good I recommend to all lorem to visit.",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "SegoeUI",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Container(
                      width: 380.w,
                      decoration: BoxDecoration(
                        // color: Colors.green,
                          borderRadius: BorderRadius.circular(10.r),
                          border:Border.all(color: Color(0xff707070))
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10.w,top: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 13.r,
                                      child: Center(child: Icon(Icons.person,size: 20,),),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      "Pratap",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "(Canada Trip)",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star,size: 20,color: Color(0xff1F08B1),),
                                    Icon(Icons.star,size: 20,color: Color(0xff1F08B1),),
                                    Icon(Icons.star,size: 20,color: Color(0xff1F08B1),),
                                    Icon(Icons.star,size: 20,color: Color(0xff1F08B1),),
                                    Icon(Icons.star_border,size: 20,color: Color(0xff1F08B1),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20.w,top: 10.h),
                            width: 340.w,
                            child: Text(
                              "Lprem is very wonderful experience. ipsum I sdn jaskk euifn hbe chek is very good I recommend to all lorem to visit.",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "SegoeUI",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Container(
                      width: 380.w,
                      decoration: BoxDecoration(
                        // color: Colors.green,
                          borderRadius: BorderRadius.circular(10.r),
                          border:Border.all(color: Color(0xff707070))
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10.w,top: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 13.r,
                                      child: Center(child: Icon(Icons.person,size: 20,),),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      "Pratap",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "(Canada Trip)",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star,size: 20,color: Color(0xff1F08B1),),
                                    Icon(Icons.star,size: 20,color: Color(0xff1F08B1),),
                                    Icon(Icons.star,size: 20,color: Color(0xff1F08B1),),
                                    Icon(Icons.star,size: 20,color: Color(0xff1F08B1),),
                                    Icon(Icons.star_border,size: 20,color: Color(0xff1F08B1),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20.w,top: 10.h),
                            width: 340.w,
                            child: Text(
                              "Lprem is very wonderful experience. ipsum I sdn jaskk euifn hbe chek is very good I recommend to all lorem to visit.",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "SegoeUI",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                  ],
                ),
              ),
                  // align: IndicatorAlign.bottom,
                  // length: 4,
                  // indicatorSpace: 20.0,
                  // padding: const EdgeInsets.all(10),
                  // indicatorColor: Colors.white,
                  // indicatorSelectorColor: Colors.blue,
                  // shape: IndicatorShape.circle(size: 12), ),

              SizedBox(
                height: 30.h,
              ),
            ],
          )
          ],
        ),
      )
    );
  }
}
