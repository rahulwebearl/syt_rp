import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sizer/sizer.dart';
// import 'package:syt/firebase%20notification/firebase_model.dart';
import 'package:syt/notificationservice/local_notification_service.dart';
import 'package:syt/screens/drawerScreen.dart';

///ui

class MyNotification extends StatefulWidget {
  const MyNotification({Key? key}) : super(key: key);

  @override
  State<MyNotification> createState() => _MyNotificationState();
}

class _MyNotificationState extends State<MyNotification> {
  // Future createUser({required String title,required String description}) async{
  //   final docUser = FirebaseFirestore.instance.collection("UserToken").doc(deviceTokenToSendPushNotification).collection("Notification").doc();
  //   final json = {
  //     'title' : title,
  //     'description' : description
  //   };
  //
  //
  //   docUser.set(json);
  // }
  // Stream<List<FireUser>> readUser() =>
  //     FirebaseFirestore.instance
  //     .collection('notification')
  //     .snapshots()
  //     .map((snapshot) =>
  //         snapshot.docs.map((doc) => FireUser.fromJson(doc.data())).toList());

  // var _numberToMonth = {
  //   1: "jan",
  //   2: "fab",
  //   3: "mar",
  //   4: "apr",
  //   5: "may",
  //   6: "jun",
  //   7: "jul",
  //   8: "aug",
  //   9: "sap",
  //   10: "oct",
  //   11: "nov",
  //   12: "dec",
  // };
  // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =FlutterLocalNotificationsPlugin();
  // String? mtoken;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  //
  // Future<QuerySnapshot> loadAssignments() async {
  //   return await FirebaseFirestore.instance.collection('notification').get();
  // }
  // initInfo(){
  //   var androidInitailize = const AndroidInitializationSettings('@mipmap/ic_launcher');
  //   // var iOSInitialize = const IOSInitializationSettings();
  //   // var initializationSettingsIOs = const IOSInitializationSettings();
  //   var initializationSettings = InitializationSettings(android: androidInitailize);
  //
  //
  //   flutterLocalNotificationsPlugin.initialize(initializationSettings,
  //       onSelectNotification : (String? payload) async {
  //       try {
  //         if(payload != null && payload.isNotEmpty){
  //
  //         }else{
  //
  //         }
  //
  //       }catch(e){
  //
  //       }
  //       return;
  //   });
  // }


  // void requestPermission() async {
  //   FirebaseMessaging messaging = FirebaseMessaging.instance;
  //
  //   NotificationSettings settings= await messaging.requestPermission(
  //     alert: true,
  //     announcement: false,
  //     badge: true,
  //     carPlay: false,
  //     criticalAlert: false,
  //     provisional: false,
  //     sound: true
  //   );
  //   if(settings.authorizationStatus == AuthorizationStatus.authorized){
  //     print("user permission grant ");
  //   }if(settings.authorizationStatus == AuthorizationStatus.provisional){
  //     print("user grant provisional permission");
  //   }
  //   else{
  //     print("user declined or not accept permission");
  //   }
  // }
  // void getToken() async {
  //   await FirebaseMessaging.instance.getToken().then((token){
  //     setState(() {
  //       mtoken =token;
  //       print("my token is $mtoken");
  //     });
  //     saveToken(token!);
  //   } );
  // }
  // void saveToken(String token) async {
  //   FirebaseFirestore.instance.collection("UserToken").doc("user1").set(
  //       {'token': token});
  // }
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   requestPermission();
  //   getToken();
  //
  // }
  // @override
  // void initState() {
  //   super.initState();
  //
  //   // 1. This method call when app in terminated state and you get a notification
  //   // when you click on notification app open from terminated state and you can get notification data in this method
  //
  //   FirebaseMessaging.instance.getInitialMessage().then(
  //         (message) {
  //       print("FirebaseMessaging.instance.getInitialMessage");
  //       if (message != null) {
  //         print("New Notification");
  //         // if (message.data['_id'] != null) {
  //         //   Navigator.of(context).push(
  //         //     MaterialPageRoute(
  //         //       builder: (context) => DemoScreen(
  //         //         id: message.data['_id'],
  //         //       ),
  //         //     ),
  //         //   );
  //         // }
  //       }
  //     },
  //   );
  //
  //   // 2. This method only call when App in forground it mean app must be opened
  //   FirebaseMessaging.onMessage.listen(
  //         (message) {
  //       print("FirebaseMessaging.onMessage.listen");
  //       if (message.notification != null) {
  //         print(message.notification!.title);
  //         print(message.notification!.body);
  //         print("message.data11 ${message.data}");
  //         // LocalNotificationService.createanddisplaynotification(message);
  //
  //       }
  //     },
  //   );
  //
  //   // 3. This method only call when App in background and not terminated(not closed)
  //   FirebaseMessaging.onMessageOpenedApp.listen(
  //         (message) {
  //       print("FirebaseMessaging.onMessageOpenedApp.listen");
  //       if (message.notification != null) {
  //         print(message.notification!.title);
  //         print(message.notification!.body);
  //         print("message.data22 ${message.data['_id']}");
  //       }
  //     },
  //   );
  // }
  // String? deviceTokenToSendPushNotification;
  // Future<void> getDeviceTokenToSendNotification() async {
  //   final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  //   final token = await _fcm.getToken();
  //   deviceTokenToSendPushNotification = token.toString();
  //   print("Token Value $deviceTokenToSendPushNotification");
  // }

  Widget build(BuildContext context) {
    //getDeviceTokenToSendNotification();
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
            "Notifications",
            style: TextStyle(
                fontSize: 14,
                fontFamily: "SegoeUI",
                fontWeight: FontWeight.bold,
                color: Color(0xff004351)),
          ),
          centerTitle: true,
        ),
        body:
        // ElevatedButton(onPressed: (){
        //   createUser(title: "title", description: "description");
        // },child: Text("send"),)
        // StreamBuilder<List<FireUser>>(
        //     // future: readUser(),
        //     //stream: readUser(),
        //     builder: (context, snapshots) {
        //       final data = snapshots.data;
        //       // dynamic data = snapshots.data.data();
        //
        //       return (snapshots.hasData)
        //           ?
              ListView.builder(
                      //scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        // Timestamp t = data[index].dateandtime as Timestamp;
                        // DateTime date= t.toDate();

                        // var server = snapshots.data?.data?[index];
                        return Container(
                          color: Colors.white,
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 15, left: 16, bottom: 16),
                                  //height: 150.h,
                                  width: 95.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border:
                                        Border.all(color: Color(0xff004351)),
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 3,
                                          offset: Offset(1, 2))
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 12, right: 8, top: 3, bottom: 3),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 70.w,
                                              child: Text(
                                                // data[index]!.title.toString(),
                                                "Package booked successfully",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: "SegoeUI",
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff004351)),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                // Text(
                                                //   "12:30",
                                                //   style: TextStyle(
                                                //       fontSize: 12.sp,
                                                //       fontFamily: "SegoeUI",
                                                //       fontWeight:
                                                //       FontWeight.bold,
                                                //       color: Color(0xff004351)),
                                                // ),
                                                // SizedBox(
                                                //   width: 10.w,
                                                // ),
                                                Text(
                                                  // data[index].title.toString(),
                                                  "20/02/2021",
                                                  style: TextStyle(
                                                      fontSize: 8,
                                                      fontFamily: "SegoeUI",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xff004351)),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Text(
                                          // data[index].description.toString(),
                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has beenthe industry's standard dummy text ever since the 1500s,when an",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontFamily: "SegoeUI",
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff333333)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),


                                // Text("${date.day}${_numberToMonth[date.month]} ${date.year}"),
                              ],
                            ),
                          ),
                        );
                      })
                  // : Center(child: CircularProgressIndicator());
            // }),
    );
  }
}
