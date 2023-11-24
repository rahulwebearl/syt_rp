import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:syt/main.dart';

class Regidemo {
  mydemoregiapi() async {
    var link = "http://13.127.94.213:3000/user";

    var url = Uri.parse(link);

    var response = await http.post(url,
        headers: {"content-type": "application/json"},
        body: jsonEncode({
          "name": "",
          "email_address": "",
          "phone": "mobile_number",
          "gender": "",
          "state": ""
        }));

    var data = json.decode(response.body);

    print(data);
  }
}
