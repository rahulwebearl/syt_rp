import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:syt/notificationservice/locaNotificationInitialize.dart';
import 'package:syt/screens/homeScreen.dart';
import 'package:syt/screens/splashScreen.dart';

import 'screens/demo/Review.dart';
import 'screens/demo/regidemo.dart';

// import 'notificationservice/local_notification_service.dart';

String? name;
Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main() async {
// await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );
  if (name != null) {
    var len = name!.length;
  }
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  final HttpLink httpLink =
      HttpLink("https://start-your-tour-app-main.herokuapp.com/syt");
  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: InMemoryStore()),
    ),
  );
  var app = GraphQLProvider(
    client: client,
    child: body(),
  );

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.getInitialMessage();
  // LocalNotificationService.initialize();
  LocalNotificationService.initialize();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  runApp(app);
}

class body extends StatefulWidget {
  @override
  _bodyState createState() => _bodyState();
}

class _bodyState extends State<body> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Sizer(
          builder: (context, orientation, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'First Method',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1),
              ),
              home:
                  // MyReviewScreen()
                  // HomeScreen()
                  SplashScreen(),
              // RegistrationPage()
            );
          },
        );
      },
      child: SplashScreen(),
    );
  }
}
