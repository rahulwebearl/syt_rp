import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:number_selection/number_selection.dart';
import 'package:sizer/sizer.dart';
import 'package:syt/screens/hotel&meals.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MyDepartureDate extends StatefulWidget {
  String departure, destination, adult, childe, infant, personal_care;
  List<String> travelby, category;
  MyDepartureDate(this.departure, this.destination, this.adult, this.childe,
      this.infant, this.travelby, this.category, this.personal_care,
      {Key? key})
      : super(key: key);

  @override
  _MyDepartureDateState createState() => _MyDepartureDateState();
}

class _MyDepartureDateState extends State<MyDepartureDate> {
  String _selectedDate = '';
  String _dateCount = '';
  String _startrange = '';
  String _endrange = '';
  String _rangeCount = '';
  String days = '';

  bool dateDecided = true;
  var monthlyPickerDay;
  var data;
  var monthlyPicker = [DateTime.now()];

  int numberofDays = 00;
  @override
  Widget build(BuildContext context) {
    var height = 55.h;
    var width = 90.w;
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
                print("forward to HotelMeals");
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => HotelandMeals(
                //         widget.departure,
                //         widget.destination,
                //         widget.adult,
                //         widget.childe,
                //         widget.infant,
                //         widget.personal_care,
                //         widget.travelby,
                //         _startrange,
                //         _endrange,
                //         days,
                //         widget.category))
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HotelandMeals(
                            widget.departure,
                            widget.destination,
                            widget.adult,
                            widget.childe,
                            widget.infant,
                            widget.personal_care,
                            widget.travelby,
                            _startrange,
                            _endrange,
                            days,
                            widget.category)));
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
                  child: Text("Next",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "SegoeUI",
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
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
          "Departure Date Between ",
          style: TextStyle(
              fontSize: 12,
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
                    height: 60.h,
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
                      padding: EdgeInsets.only(
                          right: 25, left: 25, top: 36, bottom: 20),
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
                            height: 3.h,
                          ),
                          Container(
                            height: 30.h,
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
                                      textStyle:
                                          TextStyle(color: Colors.white)),
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
                                  selectionMode:
                                      DateRangePickerSelectionMode.range,
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
                            height: 1.h,
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
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 7.h,
                                width: 25.w,
                                child: NumberSelection(
                                  theme: NumberSelectionTheme(
                                      draggableCircleColor: Color(0xff004351),
                                      iconsColor: Colors.black,
                                      numberColor: Colors.white,
                                      backgroundColor: Colors.green.shade100,
                                      outOfConstraintsColor: Colors.deepOrange),
                                  initialValue: 3,
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
                                  onOutOfConstraints: () => print(
                                      "This value is too high or too low"),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Container(
                  //   width: 352.w,
                  //   height: 400.h,
                  //   // decoration: BoxDecoration(
                  //   //   borderRadius: BorderRadius.circular(15.r),
                  //   //   gradient: LinearGradient(
                  //   //     begin: Alignment.topCenter,
                  //   //     end: Alignment.bottomCenter,
                  //   //     colors: [
                  //   //       Color(0xff1DD9B7),
                  //   //       Color(0xff004148),
                  //   //     ]
                  //   //   )
                  //   // ),
                  //   child:
                  //
                  //
                  //
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
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
    setState(() {
      if (args.value is PickerDateRange) {
        _startrange =
            DateFormat('yyyy-MM-dd').format(args.value.startDate).toString();
        _endrange = DateFormat('yyyy-MM-dd')
            .format(args.value.endDate ?? args.value.startDate)
            .toString();
        print(_startrange);
        print(_endrange);
        print("df");
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
        print(_selectedDate);
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
        print(_dateCount);
      } else {
        _rangeCount = args.value.length.toString();
        print(_rangeCount);
      }
    });
  }
  // void _onSelectionChanged(
  //     DateRangePickerSelectionChangedArgs dateRangePickerSelectionChangedArgs) {
  //   setState(() {
  //
  //     monthlyPicker = dateRangePickerSelectionChangedArgs.value;
  //     print(monthlyPicker);
  //
  //     List <String> result=[];
  //     for (var date in monthlyPicker) {
  //       monthlyPickerDay = DateFormat.d().format(date);
  //       result.add(monthlyPickerDay);
  //     }
  //     data=result.join(",");
  //     print(data);
  //   });
  // }
}
