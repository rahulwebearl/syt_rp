

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class font extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Text( "Next",
         style: TextStyle(
             fontSize: 12,
             fontFamily: "SegoeUI",
             fontWeight: FontWeight.bold,
             color: Colors.white),)
      ],
    );
  }
}