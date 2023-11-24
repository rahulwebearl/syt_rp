import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class PlaceApi extends StatefulWidget {
  const PlaceApi({Key? key}) : super(key: key);

  @override
  State<PlaceApi> createState() => _PlaceApiState();
}

class _PlaceApiState extends State<PlaceApi> {
  TextEditingController controller = TextEditingController();
  var uuid = Uuid();
  String sessionToken = "112233";
  List<dynamic> placeList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.addListener(() {
      onChange();
    });
  }

  void onChange() {
    if (sessionToken == null) {
      setState(() {
        sessionToken = uuid.v4();
      });
    }
    getSuggesion(controller.text);
  }

  void getSuggesion(String input) async {
    //add place api key
    // String place_key = "";
    //base url add
    String baseUrl = "https://start-your-tour.onrender.com";
    // add req
    String request = "$baseUrl?input=&sessiontoken=$sessionToken";
    // $input&key=$place_key

    var response = await http.get(Uri.parse(request));
    print(response.body.toString());
    if (response.statusCode == 200) {
      placeList = jsonDecode(response.body.toString())['predictions'];
    } else {
      throw Exception("faild to load");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            TextFormField(
              controller: controller,
              decoration: InputDecoration(),
            ),
            ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {},
                  title: Text(placeList[index]['description']),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
