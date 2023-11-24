import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Api.dart';
import '../models/mostLovedDisplayModel.dart';

class MostLovedDest extends StatefulWidget {
  @override
  State<MostLovedDest> createState() => _MostLovedDestState();
}

class _MostLovedDestState extends State<MostLovedDest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            // ),
          },
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff004351),
          ),
        ),
        title: Text(
          "Most Loved Destination",
          style: TextStyle(
              fontSize: 14,
              fontFamily: "SegoeUI",
              fontWeight: FontWeight.bold,
              color: Color(0xff004351)),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<MostLovedDisplayModel>(
        future: MostLovedData().MostLoved_DataList(),
        builder: (context, snapshots) {
          return (snapshots.hasData)
              ? ListView.builder(
                  itemCount: snapshots.data?.data?.length,
                  itemBuilder: (context, index) {
                    var server = snapshots.data?.data?[index];
                    var imgList = server!.placeToVisits
                            ?.map((place) => place.photo)
                            .toList() ??
                        [];

                    return Column(
                      children: [
                        SizedBox(
                          height: 3.h,
                        ),
                        InkWell(
                          onTap: () async {},
                          child: Stack(
                            children: [
                              Container(
                                width:
                                    double.infinity, // Use full available width
                                height: 200.h,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 3,
                                      offset: Offset(1, 2),
                                    ),
                                  ],
                                  color: Color.fromARGB(255, 231, 237, 243),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: imgList.map((imgUrl) {
                                      return Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: CachedNetworkImage(
                                              height: 200.h,
                                              width: 230.w,
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Text(""),
                                              imageUrl: imgUrl.toString(),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20.w,
                                          ),
                                        ],
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 100,
                                left: 250,
                                child: Text(
                                  server.destinationName.toString(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "SegoeUI",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                )

              // ? ListView.builder(
              //     itemCount: snapshots.data?.data?.length,
              //     itemBuilder: (context, index) {
              //       var server = snapshots.data?.data?[index];
              //       var img = server!.placeToVisits?[index].photo;
              //       return Column(
              //         children: [
              //           SizedBox(
              //             height: 3.h,
              //           ),
              //           InkWell(
              //             onTap: () async {},
              //             child: Stack(
              //               children: [
              //                 Container(
              //                   width: 400.w,
              //                   height: 200.h,
              //                   decoration: BoxDecoration(
              //                     boxShadow: [
              //                       BoxShadow(
              //                           color: Colors.grey,
              //                           blurRadius: 3,
              //                           offset: Offset(1, 2))
              //                     ],
              //                     color: Color.fromARGB(255, 136, 19, 19),
              //                     borderRadius: BorderRadius.circular(15),
              //                   ),
              //                   child: Row(
              //                     children: [
              //                       ClipRRect(
              //                         borderRadius: BorderRadius.circular(15),
              //                         child: CachedNetworkImage(
              //                           height: 200.h,
              //                           width: 230.w,
              //                           errorWidget: (context, url, error) =>
              //                               Image.network(
              //                                   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS53BL2jD0wQefIs3ceVdd6q0wKJHQZlclHVFyEK5oB4A&s"),
              //                           imageUrl:
              //                               // server!.placeToVisits.toString(),
              //                               // server!.placeToVisits![index].photo
              //                               //     .toString(),
              //                               img.toString(),
              //                           fit: BoxFit.cover,
              //                         ),
              //                       ),
              //                       SizedBox(
              //                         width: 20.w,
              //                       ),
              //                       Text(
              //                         //"MALDIVES",
              //                         server.destinationName.toString(),
              //                         //server.howToReach.toString(),
              //                         style: TextStyle(
              //                             fontSize: 12,
              //                             fontFamily: "SegoeUI",
              //                             fontWeight: FontWeight.bold,
              //                             color: Colors.black),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //                 // ClipRRect(
              //                 //   borderRadius: BorderRadius.circular(15),
              //                 //   child: CachedNetworkImage(
              //                 //     width: 90.w,
              //                 //     height: 18.h,
              //                 //     errorWidget: (context, url, error) => Text(""),
              //                 //     imageUrl: server!.placeToVisits.toString(),
              //                 //     fit: BoxFit.cover,
              //                 //   ),
              //                 // ),
              //                 // Positioned(
              //                 //   top: 4,
              //                 //   left: 15,
              //                 //   bottom: 4,
              //                 //   child: Text(
              //                 //     //"MALDIVES",
              //                 //     server.destinationName.toString(),
              //                 //     //server.howToReach.toString(),
              //                 //     style: TextStyle(
              //                 //         fontSize: 14.sp,
              //                 //         fontFamily: "SegoeUI",
              //                 //         fontWeight: FontWeight.bold,
              //                 //         color: Colors.black),
              //                 //   ),
              //                 // ),
              //               ],
              //             ),
              //           )
              //         ],
              //       );
              //     },
              //   )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
