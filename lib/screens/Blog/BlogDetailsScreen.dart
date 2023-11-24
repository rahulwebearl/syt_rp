import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:syt/Api.dart';
import 'package:syt/models/BlogDetailsModel.dart';

class BlogDetailsScreen extends StatefulWidget {
  const BlogDetailsScreen({Key? key, required this.id}) : super(key: key);
final String id;
  @override
  State<BlogDetailsScreen> createState() => _BlogDetailsScreenState();
}

class _BlogDetailsScreenState extends State<BlogDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            // scaffoldKey.currentState?.openDrawer();
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        title: Text(
          "Blogger",
          style: TextStyle(
              fontSize: 14,
              fontFamily: "SegoeUI",
              fontWeight: FontWeight.bold,
              color: Color(0xff004351)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<BlogDetailsModel>(
          future: BlogDetailsApi().blogList(widget.id),
          builder: (context, snapshot)  {
            if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
            }
            else if(snapshot.hasData){
              var server = snapshot.data!.data![0];
              return SizedBox(
                height: 88.h,
                child: Stack(
                  children: [
                    const SizedBox(),
                    Positioned(
                        child: Image.asset("assets/MALDIVES.png",
                            height: 30.h, width: 100.w, fit: BoxFit.cover)),
                    Positioned(
                        top: 27.h,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          height: 100.h,
                          width: 100.w,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                               server.blogTitle.toString() ,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "SegoeUI",
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff004351)),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(100),
                                            child: Image.asset(
                                              "assets/profile.png",
                                              height: 50,
                                              width: 50,
                                            )),
                                      ),
                                      Container(
                                        width: 50.w,
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(server.bloggerSytDetails![0].blogOwnerName.toString(),
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: "SegoeUI",
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff004351))),
                                            Text(server.bloggerSytDetails![0].emaiId.toString(),
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: "SegoeUI",
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff004351))),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.share,
                                        size: 16,
                                      ))
                                ],
                              ),

                              Container(
                                margin: EdgeInsets.symmetric(vertical: 20),
                                height: 1,
                                color: Colors.black54,
                              ),
                              Text(server.blogCategory.toString(), style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "SegoeUI",
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff004351))
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(server.blogContent.toString(), style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "SegoeUI",
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff004351))
                                ),
                              ),



                            ],
                          ),
                        ))
                  ],
                ),
              );
            }
            return Center(child: CircularProgressIndicator(),);
          }
        ),
      ),
    );
  }
}
