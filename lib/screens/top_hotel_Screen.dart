import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syt/Api.dart';
import 'package:syt/models/top_hotelDisplay.dart';

class HotelScreen extends StatefulWidget {
  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Top Rated Hotels In Alberta",
          style: TextStyle(
              fontSize: 14,
              fontFamily: "SegoeUI",
              fontWeight: FontWeight.bold,
              color: Color(0xff004351)),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<HotelDisplayModel>(
        future: TopHotel().TopHotel_DataList(),
        builder: (context, snapshots) {
          return (snapshots.hasData)
              ? ListView.builder(
                  itemCount: snapshots.data?.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    var server = snapshots.data?.data?[index];
                    return Column(
                      children: [
                        SizedBox(
                          height: 5.h,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 200.h,
                            width: 400.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 3.r,
                                    offset: Offset(0, 2)),
                              ],
                              color: Colors.red,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 200,
                                  width: 230,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      topLeft: Radius.circular(15),
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      topLeft: Radius.circular(15),
                                    ),
                                    child: Image.network(
                                      "${server?.hotelPhoto![index]}",
                                      fit: BoxFit.cover,
                                      errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace) {
                                        // Return a placeholder/fallback error image when the original image fails to load
                                        return Image.network(
                                            "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg?w=900&t=st=1699166205~exp=1699166805~hmac=8dc1731f5fe253037337ade0117d84a9f305b0471e08ac73921721c3026bc415"); // Replace 'error_image.png' with your error image path
                                      },
                                    ),
                                  ),
                                ),

                                // Container(
                                //   height: 200.h,
                                //   width: 230.w,
                                //   decoration: BoxDecoration(
                                //       borderRadius: BorderRadius.only(
                                //           bottomLeft: Radius.circular(15.r),
                                //           topLeft: Radius.circular(15.r)),
                                //       image: DecorationImage(
                                //         fit: BoxFit.cover,
                                //         image: NetworkImage(
                                //             "${server?.hotelPhoto![index]}"),
                                //       )),
                                // ),
                                Container(
                                  height: 200.h,
                                  width: 170.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(15.r),
                                        topRight: Radius.circular(15.r)),
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xff00778F),
                                          Color(0xff000405),
                                        ]),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 10.w, top: 10.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          //"Rose Velley Resort Alberta",
                                          server!.hotelName.toString(),
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: "SegoeUI",
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xffFFFFFF)),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.add_location,
                                              size: 12,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Text(
                                              //"Alberta",
                                              server.city.toString(),
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: "SegoeUI",
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xffFFFFFF)),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "${server.hotelDescription}",
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 12,
                                              fontFamily: "SegoeUI",
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xffFFFFFF)),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "₹ 19,000/Person",
                                              //server.rooms![index].price.toString(),
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: "SegoeUI",
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff94F5A4)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  },
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
