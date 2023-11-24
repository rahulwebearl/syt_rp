// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:syt/Api.dart';
// import 'package:syt/models/mostLovedDisplayModel.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// class ImagesliderDEMO extends StatefulWidget {
//   const ImagesliderDEMO({Key? key}) : super(key: key);

//   @override
//   State<ImagesliderDEMO> createState() => _ImagesliderDEMOState();
// }

// class _ImagesliderDEMOState extends State<ImagesliderDEMO> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Image_slider"),
//         ),
//         body: FutureBuilder<MostLovedDisplayModel>(
//           future: MostLovedData().MostLoved_DataList(),
//           builder: (context, snapshot) {
//             return (snapshot.hasData)
//                 ? ListView.builder(
//                     itemCount: snapshot.data?.data?.length,
//                     itemBuilder: (context, index) {
//                       final data = snapshot.data?.data?[index];
//                       final imgs =
//                           data?.placeToVisits?.map((e) => e.photo).toList() ??
//                               [];

//                       return Column(
//                         children: [
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Container(
//                               child: Column(
//                                   children: imgs.map((photos) {
//                             return 
//                             CarouselSlider(
//                               options: CarouselOptions(
//                                 autoPlay: true,
//                                 aspectRatio: 2.0,
//                                 enlargeCenterPage: true,
//                                 enlargeStrategy:
//                                     CenterPageEnlargeStrategy.height,
//                               ),
//                               items:  ,
//                             );
//                           }).toList()))
//                         ],
//                       );
//                     },
//                   )
//                 : Center(
//                     child: CircularProgressIndicator(),
//                   );
//           },

          
//         ),
        
        
//         );
//   }
// }

