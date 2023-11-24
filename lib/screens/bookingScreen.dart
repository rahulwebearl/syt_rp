import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:syt/screens/paymant_screen/New_payment.dart';
// import 'package:syt/screens/paymentdetailsScreen.dart';

import '../Api.dart';
import '../models/get_bookpakeges_model.dart';
import '../models/user_info_model.dart';

class BookingScreen extends StatefulWidget {
  // String departure, destination, infant, adult, childe;

  // BookingScreen(
  //     this.departure, this.destination, this.infant, this.childe, this.adult,
  //     {Key? key})
  //     : super(key: key);
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // late Razorpay _razorpay;
  var adults = 1;
  var child = 0;
  var infant = 0;
  var totalVal = 0;
  String name = "";
  String email = "";
  String phoneNo = "";
  String bid_package_id = "";
  String total_adult = "";
  String total_child = "";
  String total_infant = "";
  String departure = "";
  String agencyprice = "";
  String destination = "";
  String totalday = "";
  TextEditingController _duration = TextEditingController();

  // TextEditingController _email = TextEditingController();
  // TextEditingController _departure = TextEditingController();
  //TextEditingController _mobile = TextEditingController();
  ScrollController _scrollController = ScrollController();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _departure = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loaddata();
    bookload();
    // _razorpay = Razorpay();
    // _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    // _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    // _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void loaddata() async {
    final SharedPreferences prefs = await _prefs;
    var userId = (prefs.getString("UserId"))!;
    print("dataloded");

    user_info_model data = await UserInfo().userinfolist(userId);
    setState(() {
      name = (prefs.getString("name")) ?? "";
      email = (prefs.getString("email")) ?? "";
      phoneNo = (prefs.getString("mnum")) ?? "";
      bid_package_id = (prefs.getString("bid_package_id")) ?? "";
      total_adult = (prefs.getString("total_adult")) ?? "";
      total_child = (prefs.getString("total_child")) ?? "";
      total_infant = (prefs.getString("total_infant")) ?? "";
      departure = (prefs.getString("departure")) ?? "";
      agencyprice = (prefs.getString("agencyprice")) ?? "";
      destination = (prefs.getString("destination")) ?? "";
      totalday = (prefs.getString("totalday")) ?? "";

      totalVal = int.parse(total_adult.trim()) +
          int.parse(total_child.trim()) +
          int.parse(total_infant.trim());
      name = (prefs.getString("name"))!;
      email = (prefs.getString("email_address"))!;
      // city = (prefs.getString("city"))!;
      // state = (prefs.getString("state"))!;

      _name = TextEditingController(text: name);
      _email = TextEditingController(text: email);
      _mobile = TextEditingController(text: phoneNo);
      _departure = TextEditingController(text: departure);
      _name.text = data.data![0]!.userDetails![0]!.name.toString();
      _email.text = data.data![0]!.userDetails![0]!.emailAddress.toString();
      _mobile.text = phoneNo;
      _departure.text = departure;

      print(name.toString() + ">>>>>>>>>>>>>>>>>>>>>>>>");
      print(email + ">>>>>>>>>>>>>>>>>>>>>>>>");
      print(phoneNo + ">>>>>>>>>>>>>>>>>>>>>>>>");
      print(bid_package_id + ">>>>>>>>>>>>>>>>>>>>>>>>");
      print(total_adult + ">>>>>>>>>>>>>>>>>>>>>>>>");
      print(total_child + ">>>>>>>>>>>>>>>>>>>>>>>>");
      print(total_infant + ">>>>>>>>>>>>>>>>>>>>>>>>");
      print(departure + ">>>>>>>>>>>>>>>>>>>>>>>>");
      print(destination + ">>>>>>>>>>>>>>>>>>>>>>>>");
    });
  }

  //apicall  bookdata function

  var contact_number = "";

  var totalnight = "";
  var totaldays = "";
  var meal = "";
  var meal_type = "";
  var siteseeing = "";
  var transport_mode = "";
  var hoteltype = "";
  var priceperperson = "";
  var category = "";
  var custom_package_id = "";

  var user_name = "";

  var approx_start_date = "";
  var approx_end_date = "";
  var payment_type = "";
  var personal_care = "";
  var othere_requirement = "";
  var total_person = "";
  var transport_include_exclude = "";

  void bookload() async {
    final SharedPreferences prefs = await _prefs;
    var userId = (prefs.getString("UserId"))!;
    print("BookedLoad");

    get_bookpakege_model dataas = await get_book().Getbooklist(userId);
    setState(() {
      name = (prefs.getString("name")) ?? "";
      total_adult = (prefs.getString("total_adult")) ?? "";
      total_child = (prefs.getString("total_child")) ?? "";
      total_infant = (prefs.getString("total_infant")) ?? "";
      contact_number = (prefs.getString("contact_number")) ?? "";
      email = (prefs.getString("email_id")) ?? "";
      totalnight = (prefs.getString("totalnight")) ?? "";
      totaldays = (prefs.getString("totalday")) ?? "";
      meal = (prefs.getString("meal")) ?? "";
      meal_type = (prefs.getString("meal_type")) ?? "";
      siteseeing = (prefs.getString("siteseeing")) ?? "";
      transport_mode = (prefs.getString("transport")) ?? "";
      hoteltype = (prefs.getString("hoteltype")) ?? "";
      priceperperson = (prefs.getString("priceperperson")) ?? "";
      category = (prefs.getString("caregory")) ?? "";
      custom_package_id = (prefs.getString("custom_package_id")) ?? "";
      departure = (prefs.getString("departure")) ?? "";

      bid_package_id = (prefs.getString("bid_package_id")) ?? "";
      approx_start_date = (prefs.getString("approx_start_date")) ?? "";
      approx_end_date = (prefs.getString("approx_end_date")) ?? "";
      payment_type = (prefs.getString("payment_type")) ?? "";
      personal_care = (prefs.getString("personal_care")) ?? "";
      othere_requirement = (prefs.getString("other_requirement")) ?? "";
      total_person = (prefs.getString("total_person")) ?? "";
      transport_include_exclude =
          (prefs.getString("transport_include_exclude")) ?? "";
      siteseeing = (prefs.getString("siteseeing")) ?? "";

      _name = TextEditingController(text: name);
      _email = TextEditingController(text: email);
      _mobile = TextEditingController(text: phoneNo);
      _departure = TextEditingController(text: departure);
      // _name.text = dataas.data![0]!.userName![0].toString();
      // _email.text = dataas.data![0]!.emailId![0].toString();
      _mobile.text = phoneNo;
      _departure.text = departure;

      print(" half data pass");

      print(category + "pass category");
      print(bid_package_id + "pass bidpack id");
    });
  }

  /// payment function

  int def_index = 0;
  void openCheckout() async {
    // if (def_index == 1) {
    var options = {
      'key': 'rzp_test_bUJ7MC41hh6fYD',
      'amount': num.parse(agencyprice) * 100,
      'name': 'StartYourTour',
      'description': 'payment',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '${phoneNo}', 'email': '${email}'},
      // 'external': {
      //   'wallets': ['paytm']
      // }
    };
    try {
      // _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
    // }
  }

  // void _handlePaymentSuccess(PaymentSuccessResponse response) {
  //   print('Success Response: $response');
  //   Fluttertoast.showToast(
  //       msg: "SUCCESS: " + response.paymentId.toString(),
  //       toastLength: Toast.LENGTH_SHORT);
  // }

  // void _handlePaymentError(PaymentFailureResponse response) {
  //   print('Error Response: $response');
  //   Fluttertoast.showToast(
  //       msg: "ERROR: " +
  //           response.code.toString() +
  //           " - " +
  //           response.message.toString(),
  //       toastLength: Toast.LENGTH_SHORT);
  // }

  // void _handleExternalWallet(ExternalWalletResponse response) {
  //   print('External SDK Response: $response');
  //   Fluttertoast.showToast(
  //       msg: "EXTERNAL_WALLET: " + response.walletName.toString(),
  //       toastLength: Toast.LENGTH_SHORT);
  // }

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
          "Booking",
          style: TextStyle(
              fontSize: 14,
              fontFamily: "SegoeUI",
              fontWeight: FontWeight.bold,
              color: Color(0xff004351)),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        height: 70.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                print("pressed");
                bookload();
                // loaddata();
                // openCheckout();
                bookload();

                print("all call");
                // print("---Forward to BookedPackages");

                // if (!_formkey.currentState!.validate()) {
                //   loaddata();
                //   openCheckout();
                // } else {
                //   // Navigator.of(context).push(MaterialPageRoute(builder: (context) => payment(name, email, phoneNo, agencyprice)));
                //   openCheckout();
                // }
              },
              child: Container(
                height: 40.h,
                width: 180.w,
                decoration: BoxDecoration(
                  color: Color(0xff09646D),
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3.r,
                        offset: Offset(1, 2))
                  ],
                ),
                child: Center(
                  child: Text(
                    "Proceed To Pay",
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
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: 200.h,
                  width: 380.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.r),
                        bottomRight: Radius.circular(10.r),
                        topRight: Radius.circular(10.r),
                        topLeft: Radius.circular(10.r),
                      ),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/canadaDetails.png"))),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.w),
                      child: Row(
                        children: [
                          Container(
                            width: 200.w,
                            child: Text(
                              "${departure} ${"to"} ${destination}",
                              // "Canada Package with CN Tower Tour",
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
                    Padding(
                      padding: EdgeInsets.only(right: 15.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.star,
                            color: Color(0xff1F08B1),
                            size: 20,
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0xff1F08B1),
                            size: 20,
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0xff1F08B1),
                            size: 20,
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0xff1F08B1),
                            size: 20,
                          ),
                          Icon(
                            Icons.star_border,
                            color: Color(0xff1F08B1),
                            size: 20,
                          ),
                          Text(
                            "(2074)",
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
                Container(
                  margin: EdgeInsets.only(right: 10.w),
                  height: 80.h,
                  width: 380.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 5.w, left: 5.w),
                        child: Row(
                          children: [
                            Text(
                              //"₹ 1,98,000/- ₹ 2,50,000/-",
                              "${"₹"}${agencyprice}",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "SegoeUI",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 5.w),
                            child: Row(
                              children: [
                                Text(
                                  "Per Person on twin sharing",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.end,
                          //   children: [
                          //     Text(
                          //       "${destination} ($totalday)",
                          //       style: TextStyle(
                          //           fontSize: 12,
                          //           fontFamily: "SegoeUI",
                          //           fontWeight: FontWeight.bold,
                          //           color: Colors.grey),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "Booking Details",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "SegoeUI",
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Form(
                  key: _formkey,
                  child: Container(
                    width: 340.w,
                    // height: 267.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xff013C43),
                              Color(0xff18676D),
                            ])),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 35.h, right: 45.w, bottom: 35.h, left: 45.w),
                      child: Column(
                        children: [
                          TextFormField(
                            // readOnly: false,
                            controller: _name,

                            // initialValue: name,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Name is Required';
                              }
                            },
                            style: TextStyle(fontSize: 12, color: Colors.white),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                                hintText: "Full Name",
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 12),
                                suffixIcon: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                          ),
                          TextFormField(
                            controller: _departure,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Departure location is Required';
                              }
                              return null;
                            },
                            style: TextStyle(fontSize: 12, color: Colors.white),
                            decoration: InputDecoration(
                                hintText: "Departure",
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 12),
                                suffixIcon: Icon(
                                  CupertinoIcons.airplane,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                          ),
                          TextFormField(
                            readOnly: false,
                            controller: _email,
                            //initialValue: email,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email is Required';
                              }
                              if (!EmailValidator.validate(value)) {
                                return 'Email is not valid';
                              }
                            },
                            style: TextStyle(fontSize: 12, color: Colors.white),
                            decoration: InputDecoration(
                                hintText: "EmailId",
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 12),
                                suffixIcon: Icon(
                                  CupertinoIcons.mail_solid,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                          ),
                          TextFormField(
                            // readOnly: true,
                            controller: _mobile,
                            // initialValue:phoneNo,
                            keyboardType: TextInputType.number,
                            maxLength: 10,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Mobile No is Required';
                              }
                              if (value.length < 10) {
                                return "Enter valid mobile number";
                              }
                            },
                            style: TextStyle(fontSize: 12, color: Colors.white),
                            decoration: InputDecoration(
                                counterText: "",
                                hintText: "Mobile",
                                //"+91 Mobile No",
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 12),
                                suffixIcon: Icon(
                                  Icons.mobile_friendly_outlined,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Adult :- $adults",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Text(
                                    "Child :- $child",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Infant :- $infant",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Text(
                                    "Total :- ${totalVal /*int.parse(total_adult.trim()) + int.parse(total_child.trim()) + int.parse(total_infant.trim())*/}",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
//   void _onSelectionChanged(DateRangePickerSelectionChangedArgs dateRangePickerSelectionChangedArgs) {
//    var startDate = dateRangePickerSelectionChangedArgs.value.startDate;
//    var endDate = dateRangePickerSelectionChangedArgs.value.endDate;
//     var date1=(endDate==null)? "${DateFormat('dd-MM-yyyy').format(startDate)}": DateFormat('dd-MM-yyyy').format(endDate);
// setState(() {
//   String date="${DateFormat('dd-MM-yyyy').format(startDate)} to $date1";
//   _duration.text=date;
//   //"${DateFormat.yMd().format(monthlyPicker)} to ${DateFormat.yMd().format(dateRangePickerSelectionChangedArgs.value.endDate)}";
//
// });
//
//
//   }
}
