import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syt/screens/bookedpackages.dart';

class PaymentDetails extends StatefulWidget {
  String name;

  PaymentDetails(this.name, {Key? key}) : super(key: key);

  @override
  _PaymentDetailsState createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String radiogroup1="1";
  bool checkbox=false;

  String tripId = "";

  @override
  void initState() {

    super.initState();
    loaddata();
  }


  void loaddata() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      tripId = (prefs.getString("tripId"))??"";



    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),


        height: 60.h,
        child:   Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BookedPackages()));
            },
              child: Container(
                height: 40.h,
                width: 200.w,
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
                child:  Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Text("Pay Securely",style: TextStyle(
                        fontSize: 14,
                        fontFamily: "SegoeUI",
                        fontWeight: FontWeight.bold,
                        color: Colors.white

                    ),),
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
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
          icon: Icon(Icons.arrow_back,color:Color(0xff004351),),
        ),
        title:
        Text(
          "Payment Details",
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
                Container(
                  height: 65.h,
                  width: 420.w,
                  decoration: BoxDecoration(
                    color: Color(0xff063E42),

                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Trip ID: $tripId",
                              style: TextStyle(

                                  fontSize: 12,
                                  fontFamily: "SegoeUI",
                                  fontWeight: FontWeight.bold,
                                  color:Colors.white),
                            ),
                            Text(
                              "Name: ${widget.name}",
                              style: TextStyle(

                                  fontSize: 12,
                                  fontFamily: "SegoeUI",
                                  fontWeight: FontWeight.bold,
                                  color:Colors.white),
                            ),

                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Date: 16 Jul 2021",
                              style: TextStyle(

                                  fontSize: 12,
                                  fontFamily: "SegoeUI",
                                  fontWeight: FontWeight.bold,
                                  color:Colors.white),
                            ),
                            Text(
                              "Time: 09:13",
                              style: TextStyle(

                                  fontSize: 12,
                                  fontFamily: "SegoeUI",
                                  fontWeight: FontWeight.bold,
                                  color:Colors.white),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Text(
                  "Select Method",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: "SegoeUI",
                      fontWeight: FontWeight.bold,
                      color:Colors.black),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Radio(
                          activeColor: Color(0xff00555C),
                          value: "1",
                          groupValue: radiogroup1,
                          onChanged: (value) {
                            setState(() {
                              radiogroup1 = value.toString();
                              print(radiogroup1);
                            });
                          },
                        ),
                        Text(
                          "UPI",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "SegoeUI",
                              fontWeight: FontWeight.bold,
                              color:Colors.black),
                        ),

                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: Color(0xff00555C),
                          value: "2",
                          groupValue: radiogroup1,
                          onChanged: (value) {
                            setState(() {
                              radiogroup1 = value.toString();
                              print(radiogroup1);
                            });
                          },
                        ),
                        Text(
                          "Credit Card/Debit Card/ATM Card",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "SegoeUI",
                              fontWeight: FontWeight.bold,
                              color:Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 80.h,
                ),
                (radiogroup1=="1")?
                Container(
                  child: Column(
                    children: [
                      Container(
                          width: 350.w,
                          height: 240.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Color(0xff013C43),
                                    Color(0xff18676D),
                                  ]
                              )
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(right: 24.w,left: 24.w),
                                child:   Column(
                                  children: [
                                    SizedBox(
                                      height:30.h ,
                                    ),
                                    Container(
                                      height: 65.h,
                                      width:200.w,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("assets/upi.png")
                                        )
                                      ),
                                    ),
                                    SizedBox(
                                      height:55.h ,
                                    ),
                                    Container(
                                      height: 35.h,
                                      width: 300.w,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5.r),
                                          color: Colors.white
                                      ),
                                      child: Padding(
                                        padding:  EdgeInsets.only(left: 8.w,bottom: 2.h),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            hintText: "UPI ID",
                                            hintStyle: TextStyle(
                                                fontSize: 12
                                            ),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )


                      ),
                      SizedBox(
                        height: 45.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person,size: 20,color: Colors.black),
                          Text(
                            "2 x ₹ 4000",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color:Colors.black),
                          ),
                        ],
                      ),
                      Text(
                        "Total Amount: ₹ 8000",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "SegoeUI",
                            fontWeight: FontWeight.bold,
                            color:Colors.black),
                      ),
                    ],
                  ),
                ):
                    Container(
                      child: Column(
                        children: [
                          Container(
                              width: 350.w,
                              height: 240.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Color(0xff013C43),
                                        Color(0xff18676D),
                                      ]
                                  )
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(top:40.h,right: 24.w,left: 24.w),
                                    child:   Column(
                                      children: [
                                        Container(
                                          height: 30.h,
                                          width: 300.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5.r),
                                            color: Colors.white,
                                          ),
                                          child: Padding(
                                            padding:  EdgeInsets.only(left: 8.w),
                                            child: TextFormField(
                                              keyboardType: TextInputType.number,
                                              decoration: InputDecoration(
                                                  hintText: "Card Number",
                                                  hintStyle: TextStyle(
                                                      fontSize: 12
                                                  ),
                                                  suffixIcon: Icon(Icons.map,color: Colors.red,size: 20.h,),
                                                  border: InputBorder.none,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        Container(
                                          height: 30.h,
                                          width: 300.w,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5.r),
                                              color: Colors.white
                                          ),
                                          child: Padding(
                                            padding:  EdgeInsets.only(left: 8.w),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                hintText: "Card Holder Name",
                                                hintStyle: TextStyle(
                                                    fontSize: 12
                                                ),
                                                border: InputBorder.none,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: 30.h,
                                              width: 180.w,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5.r),
                                                  color: Colors.white
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.only(left: 8.w),
                                                child: TextFormField(
                                                  keyboardType: TextInputType.number,
                                                  decoration: InputDecoration(
                                                    hintText: "Valid Till (MM/YY)",
                                                    hintStyle: TextStyle(
                                                        fontSize: 12
                                                    ),
                                                    border: InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Container(
                                              height: 30.h,
                                              width: 110.w,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5.r),
                                                  color: Colors.white
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.only(left: 8.w),
                                                child: TextFormField(
                                                  keyboardType: TextInputType.number,
                                                  decoration: InputDecoration(
                                                    hintText: "CVV",
                                                    hintStyle: TextStyle(
                                                        fontSize: 12
                                                    ),
                                                    border: InputBorder.none,
                                                  ),

                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              child: Checkbox(
                                                splashRadius: 5.r,
                                                value: checkbox,
                                                activeColor: Color(0xff0A6A73),
                                                onChanged: (value) {
                                                  setState(() {
                                                    this.checkbox = value!;
                                                  });
                                                },
                                                side: BorderSide(
                                                  color: Colors.white
                                                ),
                                              ),
                                            ),
                                            Text("Save this card for faster payments",style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: "SegoeUI",
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                          ),
                          SizedBox(
                            height: 45.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.person,size: 20,color: Colors.black),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                "2 x ₹ 4000",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "SegoeUI",
                                    fontWeight: FontWeight.bold,
                                    color:Colors.black),
                              ),
                            ],
                          ),
                          Text(
                            "Total Amount: ₹ 8000",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color:Colors.black),
                          ),
                        ],
                      ),
                    ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
