import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syt/Api.dart';
import 'package:syt/models/BlogListModel.dart';
import 'package:syt/screens/Blog/BlogDetailsScreen.dart';

class Blog extends StatefulWidget {
  const Blog({Key? key}) : super(key: key);

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff004351),
          ),
        ),
        title: Text(
          "Blogs",
          style: TextStyle(
              fontSize: 14,
              fontFamily: "SegoeUI",
              fontWeight: FontWeight.bold,
              color: Color(0xff004351)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //   Container(
            //     color: Colors.grey.shade200,
            //     child: Padding(
            //       padding: const EdgeInsets.all(30),
            //       child: TextFormField(
            //
            //         decoration: InputDecoration(
            //           hintText: "Search Here",
            //             suffixIcon: Icon(Icons.search),
            //           enabledBorder: OutlineInputBorder(
            //         borderSide: BorderSide(color: Color(0xff0A6A73)),
            //         borderRadius: BorderRadius.circular(15)),
            // border: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(15)),
            // disabledBorder: OutlineInputBorder(
            //   borderSide: BorderSide(color: Color(0xff0A6A73)),
            // ),
            //         ),
            //       ),
            //     ),
            //   ),
            Container(
                height: 88.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                      child: Text("Blogger",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: "SegoeUI",
                          )),
                    ),
                    FutureBuilder<BlogListModel>(
                        future: BlogListApi().blogList(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasData) {
                            return ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data!.data!.length,
                              itemBuilder: (context, index) {
                                var server = snapshot.data!.data![index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BlogDetailsScreen(
                                                  id: server.sId.toString(),
                                                )));
                                  },
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                    width: 222,
                                                    child: Text(
                                                        server.blogTitle
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: "SegoeUI",
                                                        ))),
                                                SizedBox(
                                                    width: 222,
                                                    child: Text(
                                                        server.blogContent
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: "SegoeUI",
                                                        ))),
                                                SizedBox(
                                                    width: 222,
                                                    child: Text(
                                                        server.bloggerName
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: "SegoeUI",
                                                        ))),
                                              ],
                                            ),
                                            ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: SizedBox(
                                                  height: 100,
                                                  width: 80,
                                                  child: Image.network(server
                                                      .bloggerPhoto
                                                      .toString()),
                                                ))
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          height: 1,
                                          color: Colors.black,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        })
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
