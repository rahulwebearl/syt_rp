import 'dart:convert';

import 'package:delta_to_html/delta_to_html.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_quill/flutter_quill.dart';
//import 'package:flutter_quill/flutter_quill.dart';

import 'package:sizer/sizer.dart';
import 'package:syt/screens/Budget%20and%20Details.dart';

import 'TextCompunet.dart';

class AdditionalRequirements extends StatefulWidget {
  String departure,
      destination,
      adult,
      childe,
      infant,
      mealtype,
      startrange,
      personal_care,
      endrange,
      days;
  List<String> travelby, category;
  List<String> meals, hotel;
  AdditionalRequirements(
      this.departure,
      this.destination,
      this.adult,
      this.childe,
      this.infant,
      this.personal_care,
      this.travelby,
      this.meals,
      this.mealtype,
      this.hotel,
      this.startrange,
      this.endrange,
      this.days,
      this.category,
      {Key? key})
      : super(key: key);

  @override
  _AdditionalRequirementsState createState() => _AdditionalRequirementsState();
}

class _AdditionalRequirementsState extends State<AdditionalRequirements> {
  final FocusNode _focusNode = FocusNode();
  var json = "";
  final ScrollController _scrollController = ScrollController();
  // static Document quillDoc = Document()..insert(0, '');
  // final _addrequirement = QuillController(document: quillDoc, selection: TextSelection.collapsed(offset: 0));
  // String html = DeltaToHTML.encode(quillDoc.toDelta());

  //late FocusNode _focusNode;
  TextEditingController _addrequirement = TextEditingController();
  TextEditingController _addrequirement2 = TextEditingController();

  String result = '';
  // @override
  // void dispose() {
  //   _addrequirement.dispose();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        height: 10.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                print("Forward to Details and BudgetS");
                //json = jsonEncode(_addrequirement.document.toDelta().toJson());
                // print(html + "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<,");
                //  Navigator.of(context).push(MaterialPageRoute(
                //      builder: (context) => DetailsandBudget(
                //          widget.departure,
                //          widget.destination,
                //          widget.adult,
                //          widget.childe,
                //          widget.infant,
                //          widget.personal_care,
                //          widget.travelby,
                //          widget.meals,
                //          widget.mealtype,
                //          _addrequirement.document.toDelta().toJson().toString(),
                //          //json,
                //          widget.hotel,
                //          widget.startrange,
                //          widget.endrange,
                //          widget.days,
                //          widget.category))
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsandBudget(
                          widget.departure,
                          widget.destination,
                          widget.adult,
                          widget.childe,
                          widget.infant,
                          widget.personal_care,
                          widget.travelby,
                          widget.meals,
                          widget.mealtype,
                          // "no",
                          _addrequirement.text,
                          // _addrequirement.document
                          //     .toDelta()
                          //     .toJson()
                          //     .toString(),
                          // ani jgyaye "" khali String pass kari che
                          //json,
                          widget.hotel,
                          widget.startrange,
                          widget.endrange,
                          widget.days,
                          widget.category),
                    ));
              },
              child: Container(
                height: 30,
                width: 22.w,
                decoration: BoxDecoration(
                  color: Color(0xff09646D),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 3, offset: Offset(1, 2))
                  ],
                ),
                child: Center(
                  child: Text(
                    "Next",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "SegoeUI",
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
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
          "Additional Requirements",
          style: TextStyle(
              fontSize: 14,
              fontFamily: "SegoeUI",
              fontWeight: FontWeight.bold,
              color: Color(0xff004351)),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 17, right: 26, left: 26),
              child: Column(
                children: [
                  Container(
                    height: 10.h,
                    width: 20.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      // fit: BoxFit.cover,
                      image: AssetImage("assets/navigate.png"),
                    )),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Center(
                    child: Container(
                      width: 100.w,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54),
                          borderRadius: BorderRadius.circular(20)),
                      height: 400,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              maxLines: 5,
                              decoration: InputDecoration(
                                helperText: "Write your requirement here",
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xff0A6A73)),
                                    borderRadius: BorderRadius.circular(15)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                disabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff0A6A73)),
                                ),
                              ),
                              controller: _addrequirement,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                            // child: QuillToolbar.basic(
                            //    toolbarIconSize: 20,
                            //    showUnderLineButton: true,
                            //    controller: _addrequirement,
                            //    multiRowsDisplay: false,
                            //    showColorButton: false,
                            //    showStrikeThrough: false,
                            //    //showVideoButton: false,
                            //    //showImageButton: false,
                            //    showBackgroundColorButton: false,
                            //    showCodeBlock: false,
                            //    // showInlineCode: false,
                            //  ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                maxLines: 5,
                                decoration: InputDecoration(
                                  helperText: "Write your requirement here",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xff0A6A73)),
                                      borderRadius: BorderRadius.circular(15)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  disabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xff0A6A73)),
                                  ),
                                ),
                                controller: _addrequirement2,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              // child: QuillEditor(
                              //      placeholder: "Type Your Requirement",
                              //      controller: _addrequirement,
                              //      focusNode: _focusNode,
                              //      scrollController: _scrollController,
                              //      scrollable: true,
                              //      padding: EdgeInsets.zero,
                              //      autoFocus: false,
                              //      readOnly: false,
                              //      expands: false),
                            ),
                          ),
                          // MarkdownBody(data: quillToMarkdown(json),shrinkWrap: true,)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
