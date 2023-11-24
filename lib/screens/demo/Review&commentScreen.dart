import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syt/Api.dart';

import '../../models/Review_Comment_model.dart';
import 'Review.dart';

class RatingPage extends StatefulWidget {
  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String id = "";
  String bookpacakgeid = "";
  String star = "";
  String comment_box = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddatass();
  }

  void loaddatass() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //  this line is syntex of sharedprefrences and all page have same syntex line like this------> SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() async {
      id = (prefs.getString("UserId").toString());
      ReviewComment data = await ReviewCommentAPI().reviedataList(
        bookpacakgeid = (prefs.getString("book_package_id")) ?? "",
        comment_box = (prefs.getString("comment_box")) ?? "",
        star = (prefs.getString("star")) ?? "",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.blackColor,
        ),
        title: Text(
          "Rating Screen",
          style: TextStyle(
              fontSize: 14,
              fontFamily: "SegoeUI",
              fontWeight: FontWeight.bold,
              color: Color(0xff004351)),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                showRatingDialog(context);
              },
              child: Text('Open Rating Dialog'),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyReviewScreen(),
                    ));
              },
              child: Text("Display ratings"))
        ],
      ),
    );
  }

  void showRatingDialog(BuildContext context) {
    final _dialog = RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: Text(
        'Rating Dialog',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15, color: Colors.black),
      ),
      // your app's logo?
      image: const FlutterLogo(size: 80),
      submitButtonText: 'Submit',
      commentHint: 'Set your custom comment hint',

      onCancelled: () => print('cancelled'),
      onSubmitted: (response) async {
        double rating =
            response.rating; // Get the double value from the response
        String ratingAsString = rating.toString(); // Convert double to String

        print('rating: $ratingAsString, comment: ${response.comment}');
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String bookPackageId = prefs.getString("book_package_id") ?? "";
        String star = ratingAsString;
        String commentBox = response.comment;

        ReviewComment data = await ReviewCommentAPI().reviedataList(
          bookPackageId,
          star,
          commentBox,
        );

        // TODO: add your own logic
        if (response.rating < 3.0) {
          // send their comments to your email or anywhere you wish
          // ask the user to contact you instead of leaving a bad review
        } else {
          _rateAndReviewApp();
        }
      },
    );

    showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => _dialog,
    );
  }

  void _rateAndReviewApp() {
    // Logic for rating and reviewing the app
    // e.g., navigating to the app store for leaving a review
  }
}

//For App Color
class AppColors {
  static Color whiteColor = Colors.white;
  static Color selectedColor = Color(0xff9D9D9D);
  static Color blackColor = Colors.black;
  static Color backGroundColor = Color(0xff262626);
  static Color greyText = Colors.grey.shade700;
}
