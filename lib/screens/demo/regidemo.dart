import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegistrationPage extends StatefulWidget {
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController citycontroller = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  String gender = 'male'; // Default gender
  String state = 'Your State'; // Default state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Registration')),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              style: TextStyle(color: Colors.black),
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              style: TextStyle(color: Colors.black),
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              style: TextStyle(color: Colors.black),
              controller: mobileNumberController,
              decoration: InputDecoration(labelText: 'Mobile Number'),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              style: TextStyle(color: Colors.black),
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              style: TextStyle(color: Colors.black),
              controller: confirmPasswordController,
              decoration: InputDecoration(labelText: 'Confirm Password'),
              obscureText: true,
            ),
            TextField(
              style: TextStyle(color: Colors.black),
              controller: citycontroller,
              decoration: InputDecoration(labelText: 'city '),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OTPScreen(
                      userData: {
                        'name': nameController.text,
                        'email_address': emailController.text,
                        'phone': mobileNumberController.text,
                        'gender': gender,
                        'state': state,
                        'password': passwordController.text,
                        'city': citycontroller.text
                      },
                    ),
                  ),
                );
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

class OTPScreen extends StatefulWidget {
  final Map<String, String> userData;
  OTPScreen({required this.userData});
  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter OTP')),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Please enter the 6-digit OTP'),
            TextField(
              style: TextStyle(color: Colors.black),
              controller: otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'OTP'),
              maxLength: 6,
            ),
            ElevatedButton(
              onPressed: () {
                if (otpController.text == '123456') {
                  print("pressed");
                  _callAPI(widget.userData);
                }
              },
              child: Text('Submit OTP'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _callAPI(Map<String, String>? userData) async {
    if (userData != null) {
      final String name = userData['name']!;
      final String email = userData['email_address']!;
      final String mobileNumber = userData['phone']!;
      final String gender = userData['gender']!;
      final String state = userData['state']!;
      final String password = userData['password']!;
      final String city = userData['city']!;

      final Map<String, String> requestData = {
        'name': name,
        'email_address': email,
        'phone': mobileNumber,
        'gender': gender,
        'state': state,
        'otp': otpController.text,
        'password': password,
        'city': city
      };

      final Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      final Uri apiUri = Uri.parse('http://13.127.94.213:3000/user');

      try {
        final response = await http.post(
          apiUri,
          headers: headers,
          body: jsonEncode(requestData),
        );

        if (response.statusCode == 200) {
          var data = json.decode(response.body);
          print(data);
          // Handle a successful API response
        } else {
          print('Error: ${response.body}');
          // Handle API error (non-200 status code)
        }
      } catch (e) {
        print('Exception: $e');
        // Handle exceptions
      }
    } else {
      print('Null Data');
      // Handle null or missing user data
    }
  }
}
