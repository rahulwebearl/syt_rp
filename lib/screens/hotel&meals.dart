import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:syt/screens/additionalrequirementsScreen.dart';

class HotelandMeals extends StatefulWidget {
  String departure,
      destination,
      adult,
      childe,
      infant,
      startrange,
      endrange,
      days,
      personal_care;
  List<String> travelby, category;
  HotelandMeals(
      this.departure,
      this.destination,
      this.adult,
      this.childe,
      this.infant,
      this.personal_care,
      this.travelby,
      this.startrange,
      this.endrange,
      this.days,
      this.category,
      {Key? key})
      : super(key: key);

  @override
  _HotelandMealsState createState() => _HotelandMealsState();
}

class _HotelandMealsState extends State<HotelandMeals> {
  // String mealstype = "veg";
  // List mealvalue = ["any", "veg", "nonveg"];
  // List checkbox = [false, false, false, false, false, true, false];
  // List checkbox1 = [true, false, true];
  // List<String> meals = ["breakfast", "dinner"];
  // List<String> hotel = ["any"];

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
                print("forward to AdditionalRequirements");
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => AdditionalRequirements(
                //         widget.departure,
                //         widget.destination,
                //         widget.adult,
                //         widget.childe,
                //         widget.infant,
                //         widget.personal_care,
                //         widget.travelby,
                //         meals,
                //         mealstype,
                //         hotel,
                //         widget.startrange,
                //         widget.endrange,
                //         widget.days,
                //         widget.category))
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdditionalRequirements(
                          widget.departure,
                          widget.destination,
                          widget.adult,
                          widget.childe,
                          widget.infant,
                          widget.personal_care,
                          widget.travelby,
                          meals,
                          mealstype,
                          hotel,
                          widget.startrange,
                          widget.endrange,
                          widget.days,
                          widget.category),
                    ));
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
          "Hotel & Meals",
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
                    height: 50.h,
                    width: 97.w,
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
                          right: 20, left: 10, top: 20, bottom: 20),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                    splashRadius: 5,
                                                    value: checkbox1,
                                                    activeColor:
                                                        Color(0xff0A6A73),
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
                                                    splashRadius: 5,
                                                    value: checkbox2,
                                                    activeColor:
                                                        Color(0xff0A6A73),
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
                                                    splashRadius: 5,
                                                    value: checkbox4,
                                                    activeColor:
                                                        Color(0xff0A6A73),
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
                                                    splashRadius: 5,
                                                    value: checkbox5,
                                                    activeColor:
                                                        Color(0xff0A6A73),
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
                                                    splashRadius: 5,
                                                    value: checkbox6,
                                                    activeColor:
                                                        Color(0xff0A6A73),
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
                                                    splashRadius: 5,
                                                    value: checkbox7,
                                                    activeColor:
                                                        Color(0xff0A6A73),
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
                                            side:
                                                BorderSide(color: Colors.white),
                                            splashRadius: 5,
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
                                                hotel
                                                    .remove("Budgret Property");
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
                                height: 2.h,
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
                                                side: BorderSide(
                                                    color: Colors.white),
                                                splashRadius: 5,
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
                                                side: BorderSide(
                                                    color: Colors.white),
                                                splashRadius: 5,
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
                                                side: BorderSide(
                                                    color: Colors.white),
                                                splashRadius: 5,
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
                                height: 2.h,
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
