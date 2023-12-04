import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mayradioval extends StatefulWidget {
  const Mayradioval({
    Key? key,
  }) : super(key: key);

  @override
  State<Mayradioval> createState() => _MayradiovalState();
}

class _MayradiovalState extends State<Mayradioval> {
  late SharedPreferences prefss;
  String receveRadiovalues1 = "";
  String RangeValues = "";
  String RangeValues1 = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initsharedPreferences();
  }

  _initsharedPreferences() async {
    prefss = await SharedPreferences.getInstance();
    _loadprefss();
  }

  void _loadprefss() {
    setState(() {
      receveRadiovalues1 = prefss.getString("radiogroup1") ?? "";
      RangeValues1 = (prefss.getString("RangeValues1"))!;
      RangeValues = (prefss.getString("RangeValues"))!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            // Text(
            //   'Radio Group 1 Value: ${widget.radioGroup1Value}',
            //   style: TextStyle(color: Colors.black),
            // ),
            // Text(
            //   'Radio Group 2 Value: ${widget.radioGroup2Value}',
            //   style: TextStyle(color: Colors.black),
            // ),
            // Text(
            //   'Radio Group 3 Value: ${widget.radioGroup3Value}',
            //   style: TextStyle(color: Colors.black),
            // ),
            Text(
              'Radio Group 4 Value: ${receveRadiovalues1}',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'Values: ${RangeValues1}',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'Values2: ${RangeValues}',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
