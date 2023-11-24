import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syt/firebase%20notification/firebase_notification.dart';
import 'package:syt/screens/custompackagesScreen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:syt/screens/homeScreen.dart';
import 'package:syt/screens/myplaningScreen.dart';
import 'package:syt/screens/notificationScreen.dart';
import 'package:syt/screens/profileScreen.dart';

class NavigationBars extends StatefulWidget {
  const NavigationBars({Key? key}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBars> {
  late DateTime backbuttonpressedTime;
  final HomeScreen _homePage = HomeScreen();
  final CustomPackages _customPackagesPage = CustomPackages();
  final MyPlaniing _myPlaniingPage = MyPlaniing();
  final MyNotification _notificationPage = MyNotification();
  final ProfileScreen _profilePage = ProfileScreen();

  Widget _showPage = HomeScreen();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _homePage;
        break;
      case 1:
        return _notificationPage;
        break;
      case 2:
        return _myPlaniingPage;
        break;
      case 3:
        return _customPackagesPage;
        break;
      case 4:
        return _profilePage;
        break;
      default:
        return _homePage;
    }
  }

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 60.h,
        backgroundColor: Colors.white.withOpacity(0.3),
        color: Color(0xff00363D),
        index: pageIndex,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 35.h,
            color: Colors.white,
          ),
          Icon(
            Icons.notifications,
            size: 35.h,
            color: Colors.white,
          ),
          Icon(
            Icons.add,
            size: 35.h,
            color: Colors.white,
          ),
          Icon(
            Icons.shopping_bag,
            size: 35.h,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            size: 35.h,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          setState(() {
            _showPage = _pageChooser(index);
          });
        },
      ),
      body: DoubleBackToCloseApp(
          snackBar: SnackBar(
            content: Text("Tap back again to Leave"),
          ),
          child: _showPage),
    );
  }
}
