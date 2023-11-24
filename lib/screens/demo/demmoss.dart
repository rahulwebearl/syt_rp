import 'dart:convert';
import 'dart:io';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:syt/Api.dart';
import 'package:syt/main.dart';
import 'package:syt/models/update_profil_model.dart';
import 'package:syt/models/user_info_model.dart';
import 'package:syt/screens/additionaldetails.dart';
import 'package:syt/screens/bookedpackages.dart';
import 'package:syt/screens/change_password.dart';
import 'package:syt/screens/drawerScreen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syt/screens/newpassword.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // String? regid;
  // String? id;
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _state = TextEditingController();
  TextEditingController _address = TextEditingController();

  String countryValue = "";
  String stateValue = "";
  String cityValue = "";

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String userId = "";

  /// changable
  String name = "";
  String email = "";
  String city = "";
  String state = "";
  String phoneNo = "";

  @override
  void initState() {
    super.initState();
    loaddata();
    print(userId);
    print("IN INIT");
    data(name, email, phoneNo, state);
  }

  bool isSpin = false;

  void loaddata() async {
    final SharedPreferences prefs = await _prefs;
    userId = (prefs.getString("UserId")) ?? "1"; // "1" add extra
    user_info_model data = await UserInfo().userinfolist(userId);
    print("00${userId}");
    name = (prefs.getString("name")) ?? "";
    email = (prefs.getString("email_address")) ?? "";
    city = (prefs.getString("city")) ?? "";
    state = (prefs.getString("state")) ?? "";
    // phoneNo = (prefs.getString("phone"))!
    UserDetail? user = data.data?.first?.userDetails?.first;
    setState(() {
      _name = TextEditingController(text: user?.name ?? "Name");
      _email = TextEditingController(text: user?.emailAddress ?? "Email");
      _city = TextEditingController(text: user?.city ?? "City");
      _mobile = TextEditingController(
          text: data.data?.first?.phone.toString() ?? "Mobile Number");
      _state = TextEditingController(text: user?.state ?? "State");
    });
  }

  void data(String name, String email, String city, String state) async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      prefs.setString("name", name);
      prefs.setString("email_address", email);
      prefs.setString("city", city);
      prefs.setString("state", state);

      print(name + "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
      print(email + "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
      print(city + "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
      print(state + "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
    });
  }

  late String base64image;
  final picker = ImagePicker();
  File? image;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  String nulls = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
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
            "Profile",
            style: TextStyle(
                fontSize: 14,
                fontFamily: "SegoeUI",
                fontWeight: FontWeight.bold,
                color: Color(0xff004351)),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<user_info_model>(
            future: UserInfo().userinfolist(userId),
            builder: (context, snapshots) {
              if (snapshots.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshots.hasData && snapshots.data != null) {
                return Container(
                  height: 95.h,
                  color: Colors.red,
                  child: ListView.builder(
                      itemCount: snapshots.data?.data?.length,
                      itemBuilder: (context, index) {
                        var server = snapshots.data!.data![index];
                        var udetaills = server!.userDetails![index];

                        // data(name, email, phoneNo);
                        return Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 2.h,
                              ),

                              /// [profile image]
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    pickImage();
                                  });
                                },
                                child: (image != null)
                                    ? Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            border: Border.all(
                                                color: Color(0xff004351),
                                                width: 2.0)),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Image.file(
                                            image!,
                                            height: 10.h,
                                            width: 20.h,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        height: 9.h,
                                        width: 18.w,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/profile.png" ?? "")
                                                // image: AssetImage(server.photo.toString())
                                                ),
                                            shape: BoxShape.circle),
                                      ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),

                              /// [name]
                              Text(
                                //"Hardik Kanzariya",
                                udetaills!.name.toString() ?? "",

                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "SegoeUI",
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff004351)),
                              ),

                              SizedBox(
                                height: 1.h,
                              ),

                              /// [Divider]
                              Container(
                                width: 70.w,
                                child: Divider(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),

                              /// [buttons]
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BookedPackages()));
                                    },
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 5.h,
                                            width: 10.w,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/myBooking.png")),
                                                shape: BoxShape.circle),
                                          ),
                                          SizedBox(
                                            width: 1.5.w,
                                          ),
                                          Text(
                                            "My Bookings",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: "SegoeUI",
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ChangePassword()));
                                    },
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 5.h,
                                            width: 10.w,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/editprofile.png")),
                                                shape: BoxShape.circle),
                                          ),
                                          SizedBox(
                                            width: 1.5.w,
                                          ),
                                          Text(
                                            "Change Password",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: "SegoeUI",
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),

                              /// [Edit profile]
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade300),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    //height: MediaQuery.of(context).size.height * 0.78,
                                    // height: 750.h,
                                    width: 334.w,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Text(
                                          "Edit Profile",
                                          //server.userName.toString(),
                                          style: TextStyle(
                                              fontFamily: "Franklin_Gothic",
                                              color: Colors.black,
                                              fontSize: 14),
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),

                                        /// [name]
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 40),
                                          child: TextFormField(
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black),
                                            // initialValue:
                                            //     udetaills.name.toString(),
                                            controller: _name,
                                            decoration: InputDecoration(
                                                labelText: "Full Name",
                                                hintStyle: TextStyle(
                                                  fontSize: 12,
                                                ),
                                                labelStyle: TextStyle(
                                                  fontSize: 12,
                                                ),
                                                suffixIcon: Icon(
                                                  Icons.person,
                                                  size: 16,
                                                )),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),

                                        /// [mobile no.]
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 40),
                                          child: TextFormField(
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black),
                                            // initialValue: server.phone
                                            //     .toString(),
                                            controller: _mobile,
                                            decoration: InputDecoration(
                                                labelText: "Mobile No",
                                                labelStyle: TextStyle(
                                                  fontSize: 12,
                                                ),
                                                hintStyle: TextStyle(
                                                  fontSize: 12,
                                                ),
                                                suffixIcon: Icon(
                                                  Icons
                                                      .mobile_screen_share_sharp,
                                                  size: 16,
                                                )),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),

                                        /// [email id]
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 40),
                                          child: TextFormField(
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black),
                                            // initialValue: udetaills
                                            //     .emailAddress
                                            //     .toString(),
                                            controller: _email,
                                            decoration: InputDecoration(
                                                labelText: "Email Id",
                                                labelStyle: TextStyle(
                                                  fontSize: 12,
                                                ),
                                                hintStyle: TextStyle(
                                                  fontSize: 12,
                                                ),
                                                suffixIcon: Icon(
                                                  Icons.mail_outline,
                                                  size: 16,
                                                )),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),

                                        /// [city]
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 40),
                                          child: TextFormField(
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black),
                                            controller: _city,
                                            // initialValue:
                                            //     udetaills.city.toString(),
                                            decoration: InputDecoration(
                                                labelText: "City",
                                                labelStyle:
                                                    TextStyle(fontSize: 12),
                                                suffixIcon: Icon(
                                                  Icons.location_city_sharp,
                                                  size: 16,
                                                )),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),

                                        /// [state]
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 40),
                                          child: TextFormField(
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black),
                                            controller: _state,
                                            // initialValue:
                                            //     udetaills.state.toString(),
                                            decoration: InputDecoration(
                                                labelText: "State",
                                                labelStyle:
                                                    TextStyle(fontSize: 12),
                                                suffixIcon: Icon(
                                                  Icons.account_balance_sharp,
                                                  size: 16,
                                                )),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),

                                        /// [edit address heading]
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.event_note,
                                              size: 16,
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            Text(
                                              "Edit Address",
                                              style: TextStyle(
                                                  fontFamily: "Franklin_Gothic",
                                                  color: Colors.grey,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 40),
                                          child: TextFormField(
                                            maxLines: 5,
                                            controller: _address,
                                            style:
                                                TextStyle(color: Colors.black),
                                            cursorColor: Color(0xff09646D),
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xff0A6A73)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              disabledBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xff0A6A73)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),

                                        /// [update profile button]
                                        isSpin == false
                                            ? InkWell(
                                                onTap: () async {
                                                  var ProfileId = udetaills
                                                      .userId
                                                      .toString();
                                                  // var Name =
                                                  //     udetaills.name.toString();
                                                  // final SharedPreferences prefs =
                                                  //     await _prefs;
                                                  // prefs.setString(
                                                  //     "ProfileId", ProfileId);
                                                  // print("&&&&&&&&&");
                                                  // print(ProfileId);
                                                  // prefs.setString("name", name);
                                                  // print("&&&&&&&&&");
                                                  // print(name);
                                                  var Name = _name.text;
                                                  udetaills.name = _name.text;
                                                  //name=Name;

                                                  print("😀😀😀😀😀" + Name);
                                                  // // var update = update_profile();
                                                  // data(_name.text , _email.text , _city.text , _state.text);
                                                  update_profile data =
                                                      await updateProfile()
                                                          .updateprofileList(
                                                              _name.text,
                                                              _email.text,
                                                              _city.text,
                                                              _state.text,
                                                              _address.text);
                                                  setState(() {
                                                    isSpin = true;
                                                  });
                                                  if (data.code == 200) {
                                                    setState(() {
                                                      isSpin = false;
                                                    });
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            content: Text(
                                                                "Profile Update Successfully")));
                                                  } else {
                                                    setState(() {
                                                      isSpin = false;
                                                    });
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            content: Text(
                                                                "Profile Not Update")));
                                                  }
                                                },
                                                child: Container(
                                                  height: 4.h,
                                                  width: 40.w,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xff09646D),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.grey,
                                                          blurRadius: 3,
                                                          offset: Offset(1, 2))
                                                    ],
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "Update Profile",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily: "SegoeUI",
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : CircularProgressIndicator(),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                            ],
                          ),
                        );
                      }),
                );
              }
              return Center(
                  child: Text(
                'check your internet',
                style: TextStyle(color: Colors.black),
              ));
            }));
  }

  Future<void> pickImage() async {
    final _image = await ImagePicker().pickImage(source: ImageSource.gallery);

    final imageTemporary = File(_image!.path);
    setState(() {
      this.image = imageTemporary;
      base64image = base64Encode(image!.readAsBytesSync());
      print(image!.path);
    });
  }
}
