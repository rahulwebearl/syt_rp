import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:number_selection/number_selection.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:syt/models/get_destinationdata_model.dart';
import 'package:syt/screens/drawerScreen.dart';
import 'package:syt/screens/totaltravellerScreen.dart';
import '../Api.dart';
import '../models/getdestination_catagory_model.dart';
import '../models/gettravelby_catagory_model.dart';

class update_customrequirements extends StatefulWidget {
  String  departure, tripId, arrival, ondate,category,adult,child,infant,parsnalcar,travalby;
  //List<String> category;
 // List<String> category;
  update_customrequirements(

      this.departure,this.tripId, this.arrival, this.ondate,this.category,this.adult,this.child,this.infant,this.parsnalcar,this.travalby,

      {Key? key})
      : super(key: key);

  @override
  _update_customrequirementsState createState() => _update_customrequirementsState();

}

class _update_customrequirementsState extends State<update_customrequirements> {



  List<String> travelby = ["train"];
  // bool checkbox1 = true;
  // bool checkbox2 = false;
  // bool checkbox3 = false;
  // bool checkbox4 = false;
 // List checkbox = [true, false, false, false];



  String _selectedDate = '';
  String _dateCount = '';
  String _startrange = '';
  String _endrange = '';
  String _rangeCount = '';
  String days = '';

  String personal_care = "0";
  var adults = 1;
  var child = 0;
  var infant = 0;




  TextEditingController _addrequirement = TextEditingController();

  bool dateDecided = true;
  var monthlyPickerDay;
  var data;
  var monthlyPicker = [DateTime.now()];

  int numberofDays = 00;

  String mealstype = "veg";
  bool checkbox1 = false;
  bool checkbox2 = false;
  bool checkbox3 = false;
  bool checkbox4 = false;
  bool checkbox5 = false;
  bool checkbox6 = false;
  bool checkbox7 = true;
  bool checkbox8 = true;
  bool checkbox9 = false;
  bool checkbox10 = true;
  List<String> meals = ["breakfast", "dinner"];
  List<String> hotel = ["any"];
  @override
  void initState() {
    super.initState();

    departure.text = widget.departure;
    arrival.text = widget.arrival;

  }


  TextEditingController departure = TextEditingController();
  TextEditingController arrival = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  List checkbox = [true, false, false, false, false, false];
  List category_id = [];
  List<String> category_name = ["622eeffe0eec039c98528632"];
  var height = 490.h;
  var width = 352.w;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    print(widget.child.toString() + """""""""""""""""""""""""""""""""""""");
    print(widget.infant.toString()+ """""""""""""""""""""""""""""""""""");
    print(widget.adult.toString()+ """""""""""""""""""""""""""""""""""");
   //var departure = widget.departure;
    print(departure.toString() + "++++++++++++++++++++++++++++++++++++++++++++++++");
    //print(widget.tripId + "=======================================");
    //print(widget.arrival + "=======================================");
    //print(widget.ondate + "=======================================");
    return Scaffold(
      key: scaffoldKey,
      bottomNavigationBar: Container(
        height: 100.h,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // InkWell(
            //   onTap: () {
            //     if (!_formkey.currentState!.validate()) {
            //       setState(() {
            //         this.height = MediaQuery.of(context).size.height / 10;
            //       });
            //
            //       return;
            //     } else {
            //       Navigator.of(context).push(MaterialPageRoute(
            //         builder: (context) => TotalTraveller(
            //             departure.text, _destination.text, category_name),
            //       ));
            //     }
            //   },
            //   child: Container(
            //     height: 35.h,
            //     width: 150.w,
            //     decoration: BoxDecoration(
            //       color: Color(0xff09646D),
            //       borderRadius: BorderRadius.circular(10.r),
            //       boxShadow: [
            //         BoxShadow(
            //             color: Colors.grey,
            //             blurRadius: 3.r,
            //             offset: Offset(1, 2))
            //       ],
            //     ),
            //     child: Center(
            //       child: Text(
            //         "Next",
            //         style: TextStyle(
            //             fontSize: 16.sp,
            //             fontFamily: "SegoeUI",
            //             fontWeight: FontWeight.bold,
            //             color: Colors.white),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
      drawer: DrawerScreen(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
          icon: Icon(Icons.menu),
          color: Colors.black,
        ),
        title: Text(
          "Update Customrequirements",
          style: TextStyle(
              fontSize: 14,
              fontFamily: "SegoeUI",
              fontWeight: FontWeight.bold,
              color: Color(0xff004351)),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 20.w,right: 20.w),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: 500.h,
              width: 380.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff1DD9B7),
                        Color(0xff004148),
                      ])),
              child: Form(
                key: _formkey,
                child: Padding(
                  padding: EdgeInsets.only(
                      right: 25.w, left: 25.w, top: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Departure & Destination",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "SegoeUI",
                            fontWeight: FontWeight.bold,
                            color: Color(0xffFFFFFF)),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding:
                        EdgeInsets.only(right: 11.w, left: 11.w),
                        child: TextFormField(

                          controller:departure,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Departure place is Required';
                            }
                          },
                          cursorColor: Color(0xff09646D),
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(

                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff09646D),
                                      width: 1.5.w)),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.white),
                              ),

                              //lable style

                              hintText: "Departure",
                              hintStyle: TextStyle(color: Colors.white),
                              suffixIcon: Image.asset(
                                "assets/departure.png",
                                scale: 1.5.sign,
                              )

                          ),

                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding:
                        EdgeInsets.only(right: 11.w, left: 11.w),
                        child: TextFormField(
                          controller: arrival,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Destination place is Required';
                            }
                          },
                          cursorColor: Color(0xff09646D),
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff09646D),
                                      width: 1.5)),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.white),
                              ),
                              hintText: "Destination",
                              hintStyle: TextStyle(color: Colors.white),
                              suffixIcon: Image.asset(
                                "assets/destination.png",
                                scale: 1.5,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        "Tour Category",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "SegoeUI",
                            fontWeight: FontWeight.bold,
                            color: Color(0xffFFFFFF)),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                          height: 180.h,
                          width: 310.w,
                          // color: Colors.red,
                          child:  Row(
                            children: [
                              Container(
                                child: Checkbox(
                                  side: BorderSide(
                                      color:
                                      Colors.white),
                                  splashRadius: 5.r,
                                  value:true, //checkbox[index],
                                  activeColor:
                                  Color(0xff0A6A73),
                                  onChanged: (value) {
                                    setState(() {
                                      this.checkbox[0] = value!;
                                    });
                                    if (checkbox[
                                    0] ==
                                        true) {
                                      category_name.add(widget.tripId);
                                    } else {
                                     // category_name.remove(server.sId.toString());
                                    }
                                    print(category_name
                                        .join(","));
                                  },
                                ),
                              ),
                              Text(
                                "Honeymoon",
                               // server.categoryName.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: "SegoeUI",
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),
                            ],
                          ),),
                    ],
                  ),
                ),
              ),
            ),
          ),

          ///Total Traveller

          Padding(
            padding:  EdgeInsets.only(right: 20.w,left: 20.w,top: 20.h),
            child: Container(
              // height: MediaQuery.of(context).size.height / 1.75,
              // width: MediaQuery.of(context).size.width / 1,
              height: 530.h,
              width: 380.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff1DD9B7),
                        Color(0xff004148),
                      ])),
              child: Form(
                child: Padding(
                  padding: EdgeInsets.only(
                      right: 35.w, left: 35.w, top: 36.h),
                  child: ListView(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 25.h,
                                width: 25.w,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/adult.png")),
                                  // color: Colors.red,
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                "Adult(12+ years)",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "SegoeUI",
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffFFFFFF)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
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
                                    size: 35.w,
                                  )),
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                widget.adult,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "SegoeUI",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
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
                                    size: 35.w,
                                  )),
                            ],
                          ),
                          Container(
                            width: 180.w,
                            child: Divider(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),

                          Row(
                            children: [
                              Container(
                                height: 25.h,
                                width: 25.w,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/2to12.png"))),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                "Children(2 to 12 years)",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "SegoeUI",
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffFFFFFF)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
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
                                    size: 35.w,
                                  )),
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                widget.child,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "SegoeUI",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
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
                                    size: 35.w,
                                  )),
                            ],
                          ),
                          Container(
                            width: 160.w,
                            child: Divider(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),

                          Row(
                            children: [
                              Container(
                                height: 25.h,
                                width: 25.w,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/0to2.png"))),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                "Infant(0 to 2 years)",
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
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                  onTap: () {
                                    if (infant > 0) {
                                      setState(() {
                                       infant --;
                                      });
                                    }
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 35.w,
                                  )),
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                widget.infant,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "SegoeUI",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
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
                                    size: 35.w,
                                  )),
                            ],
                          ),
                          Container(
                            width: 140.w,
                            child: Divider(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),

                          Row(
                            children: [
                              Text(
                                "Need any personal care?",
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
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    activeColor: Colors.white,
                                    value: widget.parsnalcar,
                                    groupValue: personal_care,
                                    onChanged: (value) {
                                      setState(() {
                                        widget.parsnalcar = value.toString();
                                        print(widget.parsnalcar.toString() + ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;");
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
          ),

          /// Travel By

          Padding(
            padding:  EdgeInsets.only(left: 20.w,right: 20.w,top: 20.h),
            child: Container(
              height: 280.h,
              width: 380.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff1DD9B7),
                        Color(0xff004148),
                      ])),
              child: Padding(
                padding:
                EdgeInsets.only(right: 25.w, left: 25.w, top: 36.h),
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
                    SizedBox(height: 25.h),
                    Container(
                        height: 150.h,
                        width: 310.w,
                        // color: Colors.red,
                        child: Row(
                          children: [
                            Container(
                              child: Checkbox(
                                side: BorderSide(
                                    color:
                                    Colors.white),
                                splashRadius: 5.r,
                                value:
                                checkbox[0],
                                activeColor:
                                Color(0xff0A6A73),
                                onChanged: (value) {
                                  setState(() {
                                    this.checkbox[
                                    0] =
                                    value!;
                                  });
                                  if (checkbox[
                                  0] ==
                                      true) {
                                    travelby.add(
                                        widget.travalby
                                    );
                                  } else {
                                    travelby.remove(
                                       widget.travalby
                                    );
                                  }
                                  print(travelby
                                      .join(","));
                                },
                              ),
                            ),
                            Text(
                              "server.name.toString()",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ),

          /// Departur Date Between

          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w,top: 20),
            child: Container(
              height: 520.h,
              width: 380.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff1DD9B7),
                        Color(0xff004148),
                      ])),
              child: Padding(
                padding: EdgeInsets.only(
                    right: 25.w, left: 25.w, top: 36.h, bottom: 20.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Departure Between",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "SegoeUI",
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFFFFFF)),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Container(
                      height: 300.h,
                      child: Builder(builder: (context) {
                        return SfDateRangePicker(
                            headerStyle: DateRangePickerHeaderStyle(
                              textStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            yearCellStyle: DateRangePickerYearCellStyle(
                                textStyle: TextStyle(
                              color: Colors.white,
                            )),
                            monthCellStyle: DateRangePickerMonthCellStyle(
                                textStyle: TextStyle(color: Colors.white)),
                            startRangeSelectionColor: Color(0xff004351),
                            endRangeSelectionColor: Color(0xff004351),
                            rangeSelectionColor: Colors.green.shade100,
                            todayHighlightColor: Color(0xff004351),
                            rangeTextStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            initialSelectedDate: DateTime.now(),
                            enablePastDates: false,
                            selectionMode: DateRangePickerSelectionMode.range,
                            onSelectionChanged: _onSelectionChanged
                            //(DateRangePickerSelectionChangedArgs args) {
                            //   print(args.value);
                            //
                            //   // if (args.value is PickerDateRange) {
                            //   //   final DateTime rangeStartDate = args.value.start;
                            //   //   final DateTime rangeEndDate = args.value.endDate;
                            //   //   print(rangeStartDate);
                            //   //   print(rangeEndDate);
                            //   // } else  if (args.value is List ) {
                            //   //   final List  selectedDates = args.value;
                            //   //   print(selectedDates);
                            //   // }
                            //
                            // }
                            );
                      }),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      "Tour days",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "SegoeUI",
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFFFFFF)),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 60.h,
                          width: 100.w,
                          child: NumberSelection(
                            theme: NumberSelectionTheme(
                                draggableCircleColor: Color(0xff004351),
                                iconsColor: Colors.black,
                                numberColor: Colors.white,
                                backgroundColor: Colors.green.shade100,
                                outOfConstraintsColor: Colors.deepOrange),
                            initialValue: 5,
                            minValue: 1,
                            maxValue: 30,
                            direction: Axis.horizontal,
                            withSpring: true,
                            onChanged: (int value) {
                              print("value: $value");
                              setState(() {
                                days = value.toString();
                                // print(days + "----------");
                              });
                            },
                            enableOnOutOfConstraintsAnimation: true,
                            onOutOfConstraints: () =>
                                print("This value is too high or too low"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// Hote & Meals

          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
            child: Container(
              height: 450.h,
              width: 380.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff1DD9B7),
                        Color(0xff004148),
                      ])),
              child: Padding(
                padding: EdgeInsets.only(
                    right: 20.w, left: 10.w, top: 20.h, bottom: 20.h),
                child: ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Hotel Type Using API
                        // Container(
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Text(
                        //         "Hotel Type",
                        //         style: TextStyle(
                        //             fontSize: 18.sp,
                        //             fontFamily: "SegoeUI",
                        //             fontWeight: FontWeight.bold,
                        //             color: Color(0xffFFFFFF)),
                        //       ),
                        //       Container(
                        //           height: 150.h,
                        //           width: 340.w,
                        //           // color: Colors.red,
                        //           child: FutureBuilder<gethoteltype_catagory_model>(
                        //               future: Gethoteltype_catagory()
                        //                   .gethoteltypeList(),
                        //               builder: (context, snapshots) {
                        //                 return (snapshots.hasData)
                        //                     ? GridView.builder(
                        //                         gridDelegate:
                        //                             SliverGridDelegateWithFixedCrossAxisCount(
                        //                           childAspectRatio: 2,
                        //                           crossAxisCount: 3,
                        //                         ),
                        //                         itemCount: snapshots
                        //                             .data!.data!.length,
                        //                         itemBuilder:
                        //                             (context, index) {
                        //                           var server = snapshots
                        //                               .data!.data![index];
                        //                           return SingleChildScrollView(
                        //                             scrollDirection:
                        //                                 Axis.horizontal,
                        //                             child: Row(
                        //                               children: [
                        //                                 Container(
                        //                                   child: Checkbox(
                        //                                     side: BorderSide(
                        //                                         color: Colors.white),
                        //                                     splashRadius:
                        //                                         5.r,
                        //                                     value: checkbox[index],
                        //                                     activeColor: Color(0xff0A6A73),
                        //                                     onChanged: (value) {
                        //                                       setState(() {
                        //                                         this.checkbox[index] = value!;
                        //                                       });
                        //                                       if (checkbox[index] == true) {
                        //                                         hotel.add(server.name.toString());
                        //                                       } else {
                        //                                         hotel.remove(server.name.toString());
                        //                                       }
                        //                                       print(hotel.join(","));
                        //                                     },
                        //                                   ),
                        //                                 ),
                        //                                 Text(
                        //                                   server.name
                        //                                       .toString(),
                        //                                   style:
                        //                                       TextStyle(
                        //                                     color: Colors
                        //                                         .white,
                        //                                     fontSize:
                        //                                         16.sp,
                        //                                     fontFamily:
                        //                                         "SegoeUI",
                        //                                     fontWeight:
                        //                                         FontWeight
                        //                                             .bold,
                        //                                   ),
                        //                                 ),
                        //                               ],
                        //                             ),
                        //                           );
                        //                         })
                        //                     : Center(
                        //                         child:
                        //                             CircularProgressIndicator());
                        //               })),
                        //     ],
                        //   ),
                        // ),

                        /// Hotel Type Using Static Data
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hotel Type",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "SegoeUI",
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffFFFFFF)),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            child: Checkbox(
                                              side: BorderSide(
                                                  color: Colors.white),
                                              splashRadius: 5.r,
                                              value: checkbox1,
                                              activeColor: Color(0xff0A6A73),
                                              onChanged: (value) {
                                                setState(() {
                                                  checkbox2 = false;
                                                  checkbox3 = false;
                                                  checkbox4 = false;
                                                  checkbox5 = false;
                                                  checkbox6 = false;
                                                  checkbox7 = false;
                                                  this.checkbox1 = value!;
                                                });
                                                if (checkbox1 == true) {
                                                  hotel.clear();
                                                  hotel.add("no");
                                                } else {
                                                  hotel.remove("no");
                                                }
                                                print(hotel);
                                              },
                                            ),
                                          ),
                                          Text(
                                            "No",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontFamily: "SegoeUI",
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            child: Checkbox(
                                              side: BorderSide(
                                                  color: Colors.white),
                                              splashRadius: 5.r,
                                              value: checkbox2,
                                              activeColor: Color(0xff0A6A73),
                                              onChanged: (value) {
                                                setState(() {
                                                  checkbox7 = false;
                                                  checkbox1 = false;
                                                  this.checkbox2 = value!;
                                                });
                                                if (checkbox2 == true) {
                                                  hotel.add("4");
                                                  hotel.remove("any");
                                                  hotel.remove("no");
                                                } else {
                                                  hotel.remove("4");
                                                }
                                                print(hotel);
                                              },
                                            ),
                                          ),
                                          Text(
                                            "4 Star",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontFamily: "SegoeUI",
                                              fontWeight: FontWeight.bold,
                                            ),
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
                                          Container(
                                            child: Checkbox(
                                              side: BorderSide(
                                                  color: Colors.white),
                                              splashRadius: 5.r,
                                              value: checkbox4,
                                              activeColor: Color(0xff0A6A73),
                                              onChanged: (value) {
                                                setState(() {
                                                  checkbox7 = false;
                                                  checkbox1 = false;
                                                  this.checkbox4 = value!;
                                                });
                                                if (checkbox4 == true) {
                                                  hotel.add("2");
                                                  hotel.remove("any");
                                                  hotel.remove("no");
                                                } else {
                                                  hotel.remove("2");
                                                }
                                                print(hotel);
                                              },
                                            ),
                                          ),
                                          Text(
                                            "2 Star",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontFamily: "SegoeUI",
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            child: Checkbox(
                                              side: BorderSide(
                                                  color: Colors.white),
                                              splashRadius: 5.r,
                                              value: checkbox5,
                                              activeColor: Color(0xff0A6A73),
                                              onChanged: (value) {
                                                setState(() {
                                                  checkbox7 = false;
                                                  checkbox1 = false;
                                                  this.checkbox5 = value!;
                                                });
                                                if (checkbox5 == true) {
                                                  hotel.add("5");
                                                  hotel.remove("any");
                                                  hotel.remove("no");
                                                } else {
                                                  hotel.remove("5");
                                                }
                                                print(hotel);
                                              },
                                            ),
                                          ),
                                          Text(
                                            "5 Star",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontFamily: "SegoeUI",
                                              fontWeight: FontWeight.bold,
                                            ),
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
                                          Container(
                                            child: Checkbox(
                                              side: BorderSide(
                                                  color: Colors.white),
                                              splashRadius: 5.r,
                                              value: checkbox6,
                                              activeColor: Color(0xff0A6A73),
                                              onChanged: (value) {
                                                setState(() {
                                                  checkbox7 = false;
                                                  checkbox1 = false;
                                                  this.checkbox6 = value!;
                                                });
                                                if (checkbox6 == true) {
                                                  hotel.add("3");
                                                } else {
                                                  hotel.remove("3");
                                                }
                                                print(hotel);
                                              },
                                            ),
                                          ),
                                          Text(
                                            "3 Star",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontFamily: "SegoeUI",
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            child: Checkbox(
                                              side: BorderSide(
                                                  color: Colors.white),
                                              splashRadius: 5.r,
                                              value: checkbox7,
                                              activeColor: Color(0xff0A6A73),
                                              onChanged: (value) {
                                                setState(() {
                                                  checkbox2 = false;
                                                  checkbox3 = false;
                                                  checkbox4 = false;
                                                  checkbox5 = false;
                                                  checkbox6 = false;
                                                  checkbox1 = false;
                                                  this.checkbox7 = value!;
                                                });
                                                if (checkbox7 == true) {
                                                  hotel.clear();
                                                  hotel.add("any");
                                                } else {
                                                  hotel.remove("any");
                                                }
                                                print(hotel);
                                              },
                                            ),
                                          ),
                                          Text(
                                            "Any",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontFamily: "SegoeUI",
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Checkbox(
                                      side: BorderSide(color: Colors.white),
                                      splashRadius: 5.r,
                                      value: checkbox3,
                                      activeColor: Color(0xff0A6A73),
                                      onChanged: (value) {
                                        setState(() {
                                          checkbox7 = false;
                                          checkbox1 = false;
                                          this.checkbox3 = value!;
                                        });
                                        if (checkbox3 == true) {
                                          hotel.add("Budgret Property");
                                          hotel.remove("any");
                                          hotel.remove("no");
                                        } else {
                                          hotel.remove("Budgret Property");
                                        }
                                        print(hotel);
                                      },
                                    ),
                                  ),
                                  Text(
                                    "Budgret Property",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),

                        /// Meals Catagory Using API
                        // Container(
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Text(
                        //         "Meals I Want",
                        //         style: TextStyle(
                        //             fontSize: 18.sp,
                        //             fontFamily: "SegoeUI",
                        //             fontWeight: FontWeight.bold,
                        //             color: Color(0xffFFFFFF)),
                        //       ),
                        //       Container(
                        //           height: 50.h,
                        //           width: 340.w,
                        //           // color: Colors.red,
                        //           child:
                        //               FutureBuilder<
                        //                       getmeal_catagory_model>(
                        //                   future: Getmeal_catagory()
                        //                       .getmealList(),
                        //                   builder: (context, snapshots) {
                        //                     return (snapshots.hasData)
                        //                         ? GridView.builder(
                        //                             gridDelegate:
                        //                                 SliverGridDelegateWithFixedCrossAxisCount(
                        //                               childAspectRatio: 2,
                        //                               crossAxisCount: 3,
                        //                             ),
                        //                             itemCount: snapshots
                        //                                 .data!
                        //                                 .data!
                        //                                 .length,
                        //                             itemBuilder:
                        //                                 (context, index) {
                        //                               var server =
                        //                                   snapshots.data!
                        //                                           .data![
                        //                                       index];
                        //                               return SingleChildScrollView(
                        //                                 scrollDirection:
                        //                                     Axis.horizontal,
                        //                                 child: Row(
                        //                                   children: [
                        //                                     Container(
                        //                                       child:
                        //                                           Checkbox(
                        //                                         side: BorderSide(
                        //                                             color:
                        //                                                 Colors.white),
                        //                                         splashRadius:
                        //                                             5.r,
                        //                                         value: checkbox1[
                        //                                             index],
                        //                                         activeColor:
                        //                                             Color(
                        //                                                 0xff0A6A73),
                        //                                         onChanged:
                        //                                             (value) {
                        //                                           setState(
                        //                                               () {
                        //                                             this.checkbox1[index] =
                        //                                                 value!;
                        //                                           });
                        //                                           if (checkbox1[index] ==
                        //                                               true) {
                        //                                             hotel.add(server
                        //                                                 .name
                        //                                                 .toString());
                        //                                           } else {
                        //                                             hotel.remove(server
                        //                                                 .name
                        //                                                 .toString());
                        //                                           }
                        //                                           print(hotel
                        //                                               .join(","));
                        //                                         },
                        //                                       ),
                        //                                     ),
                        //                                     Text(
                        //                                       server.name
                        //                                           .toString(),
                        //                                       style:
                        //                                           TextStyle(
                        //                                         color: Colors
                        //                                             .white,
                        //                                         fontSize:
                        //                                             16.sp,
                        //                                         fontFamily:
                        //                                             "SegoeUI",
                        //                                         fontWeight:
                        //                                             FontWeight
                        //                                                 .bold,
                        //                                       ),
                        //                                     ),
                        //                                   ],
                        //                                 ),
                        //                               );
                        //                             })
                        //                         : Center(
                        //                             child:
                        //                                 CircularProgressIndicator());
                        //                   })),
                        //     ],
                        //   ),
                        // ),

                        /// Meals Catagory Using Static Data
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Meals I Want",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "SegoeUI",
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffFFFFFF)),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        child: Checkbox(
                                          side: BorderSide(color: Colors.white),
                                          splashRadius: 5.r,
                                          value: checkbox8,
                                          activeColor: Color(0xff0A6A73),
                                          onChanged: (value) {
                                            setState(() {
                                              this.checkbox8 = value!;
                                            });
                                            if (checkbox8 == true) {
                                              meals.add("breakfast");
                                            } else {
                                              meals.remove("breakfast");
                                            }
                                            print(meals);
                                          },
                                        ),
                                      ),
                                      Text(
                                        "Breakfast",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Checkbox(
                                          side: BorderSide(color: Colors.white),
                                          splashRadius: 5.r,
                                          value: checkbox9,
                                          activeColor: Color(0xff0A6A73),
                                          onChanged: (value) {
                                            setState(() {
                                              this.checkbox9 = value!;
                                            });
                                            if (checkbox9 == true) {
                                              meals.add("lunch");
                                            } else {
                                              meals.remove("lunch");
                                            }
                                            print(meals);
                                          },
                                        ),
                                      ),
                                      Text(
                                        "Lunch",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Checkbox(
                                          side: BorderSide(color: Colors.white),
                                          splashRadius: 5.r,
                                          value: checkbox10,
                                          activeColor: Color(0xff0A6A73),
                                          onChanged: (value) {
                                            setState(() {
                                              this.checkbox10 = value!;
                                            });
                                            if (checkbox10 == true) {
                                              meals.add("dinner");
                                            } else {
                                              meals.remove("dinner");
                                            }
                                            print(meals);
                                          },
                                        ),
                                      ),
                                      Text(
                                        "Dinner",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),

                        /// Meal Types Using API
                        // Container(
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Text(
                        //         "Meals Types",
                        //         style: TextStyle(
                        //             fontSize: 18.sp,
                        //             fontFamily: "SegoeUI",
                        //             fontWeight: FontWeight.bold,
                        //             color: Color(0xffFFFFFF)),
                        //       ),
                        //       Container(
                        //           height: 80.h,
                        //           width: 340.w,
                        //           // color: Colors.red,
                        //           child:
                        //               FutureBuilder<
                        //                       getmealtype_catagory_model>(
                        //                   future: Getmealtype_catagory()
                        //                       .getmealtypeList(),
                        //                   builder: (context, snapshots) {
                        //                     return (snapshots.hasData)
                        //                         ? GridView.builder(
                        //                             gridDelegate:
                        //                                 SliverGridDelegateWithFixedCrossAxisCount(
                        //                               crossAxisCount: 3,
                        //                             ),
                        //                             itemCount: snapshots
                        //                                 .data!
                        //                                 .data!
                        //                                 .length,
                        //                             itemBuilder:
                        //                                 (context, index) {
                        //                               var server =
                        //                                   snapshots.data!
                        //                                           .data![
                        //                                       index];
                        //                               return SingleChildScrollView(
                        //                                 scrollDirection:
                        //                                     Axis.horizontal,
                        //                                 child: Row(
                        //                                   mainAxisAlignment:
                        //                                       MainAxisAlignment
                        //                                           .spaceBetween,
                        //                                   children: [
                        //                                     Row(
                        //                                       children: [
                        //                                         Radio(
                        //                                           activeColor:
                        //                                               Colors.white,
                        //                                           value: server.name.toString(),
                        //                                           groupValue: mealstype,
                        //                                           onChanged:
                        //                                               (value) {
                        //                                             setState(
                        //                                                 () {
                        //                                               mealstype =
                        //                                                   value.toString();
                        //                                               print(mealstype);
                        //                                             });
                        //                                           },
                        //                                         ),
                        //                                         Text(
                        //                                           server
                        //                                               .name
                        //                                               .toString(),
                        //                                           style: TextStyle(
                        //                                               fontSize: 16
                        //                                                   .sp,
                        //                                               fontFamily:
                        //                                                   "SegoeUI",
                        //                                               fontWeight:
                        //                                                   FontWeight.bold,
                        //                                               color: Colors.white,
                        //                                               // color:Color(0xff004351)
                        //                                               ),
                        //                                         ),
                        //                                       ],
                        //                                     ),
                        //                                   ],
                        //                                 ),
                        //                               );
                        //                             })
                        //                         : Center(
                        //                             child:
                        //                                 CircularProgressIndicator());
                        //                   })),
                        //     ],
                        //   ),
                        // )

                        /// Meal Types Using Static Data
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Meals Types",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "SegoeUI",
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffFFFFFF)),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        activeColor: Colors.white,
                                        value: "any",
                                        groupValue: mealstype,
                                        onChanged: (value) {
                                          setState(() {
                                            mealstype = value.toString();
                                            print(mealstype);
                                          });
                                        },
                                      ),
                                      Text(
                                        "Any",
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
                                        value: "veg",
                                        groupValue: mealstype,
                                        onChanged: (value) {
                                          setState(() {
                                            mealstype = value.toString();
                                            print(mealstype);
                                          });
                                        },
                                      ),
                                      Text(
                                        "Veg",
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
                                        value: "nonveg",
                                        groupValue: mealstype,
                                        onChanged: (value) {
                                          setState(() {
                                            mealstype = value.toString();
                                            print(mealstype);
                                          });
                                        },
                                      ),
                                      Text(
                                        "Non-Veg",
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
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// Additional requirements

          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
            child: Container(
              height: 350.h,
              width: 380.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff1DD9B7),
                        Color(0xff004148),
                      ])),
              child: Padding(
                padding: EdgeInsets.only(right: 25.w, left: 25.w, top: 36.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Additional Requirements?",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "SegoeUI",
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFFFFFF)),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 0.w, left: 0.w),
                      child: Container(
                        height: 220.h,
                        width: 310.w,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 10,
                                  offset: Offset(0, 3))
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: Color(0xff707070))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _addrequirement,
                            cursorColor: Color(0xff09646D),
                            maxLines: 10,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: 100.w,right: 100.w,top: 30.h),
            child: InkWell(
              onTap: () async {},
              child: Container(
                height: 35.h,
                width: 150.w,
                decoration: BoxDecoration(
                  color: Color(0xff09646D),
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 3, offset: Offset(1, 2))
                  ],
                ),
                child: Center(
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "SegoeUI",
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
  /// The argument value will return the changed date as [DateTime] when the
  /// widget [SfDateRangeSelectionMode] set as single.
  ///
  /// The argument value will return the changed dates as [List<DateTime>]
  /// when the widget [SfDateRangeSelectionMode] set as multiple.
  ///
  /// The argument value will return the changed range as [PickerDateRange]
  /// when the widget [SfDateRangeSelectionMode] set as range.
  ///
  /// The argument value will return the changed ranges as
  /// [List<PickerDateRange] when the widget [SfDateRangeSelectionMode] set as
  /// multi range.
}
