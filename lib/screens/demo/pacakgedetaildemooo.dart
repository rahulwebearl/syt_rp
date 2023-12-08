import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:syt/Api.dart';
import 'package:syt/models/get_destinationdata_model.dart';
import 'package:syt/models/get_pakege_details_modal.dart';
import 'package:syt/screens/bookingScreen.dart';
import 'package:syt/screens/myplaningScreen.dart';

class PackageDetails112 extends StatefulWidget {
  final String packageId;

  const PackageDetails112({Key? key, required this.packageId})
      : super(key: key);

  @override
  _PackageDetails112State createState() => _PackageDetails112State();
}

class _PackageDetails112State extends State<PackageDetails112> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  var Packages_id = "";
  var getpackagedetails112_api = "";
  var destination_id = "";
  var destination_package = "";

  @override
  void initState() {
    super.initState();
    loaddata();
  }

  void loaddata() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      Packages_id = (prefs.getString("Packages_id")) ?? "";
      destination_id = (prefs.getString("destination_id")) ?? "";
      destination_package = (prefs.getString("destination_package")) ?? "";
    });
  }

  var top;
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        FutureBuilder<get_pakege_details_modal>(
          future: GetPackageDetails().pakegedetailsList(widget.packageId),
          builder: (context, snapshot) {
            print("RP::-- ${snapshot}");
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              // Ensure data is accessed correctly
              final packageDetails = snapshot.data; // Access the retrieved data
              if (packageDetails != null && packageDetails.data != null) {
                return ListView.builder(
                  itemCount: packageDetails.data!.length,
                  itemBuilder: (context, index) {
                    var server = packageDetails.data![index];
                    // Check if 'name' is a list
                    if (server.name != null && server.name is List) {
                      // If 'name' is a list, join the list items into a string
                      var names = server.name!; // Adjust delimiter as needed
                      return Container(
                        child: Text(names),
                      );
                    } else {
                      // If 'name' is not a list, treat it as a single value
                      return Container(
                        child: Text(server.name.toString()),
                      );
                    }
                  },
                );
              } else {
                return Center(
                  child: Text(
                    "No data available",
                    style: TextStyle(color: Colors.black),
                  ),
                );
              }
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                  style: TextStyle(color: Colors.black),
                ),
              );
            } else {
              return Center(
                child: Text(
                  "No data or error",
                  style: TextStyle(color: Colors.black),
                ),
              );
            }
          },
        )
      ],
    ));
  }
}
