import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';

import '../Components/Utils/global.dart';
import '../Model/festival_model.dart';

class Detail_Page extends StatefulWidget {
  const Detail_Page({super.key});

  @override
  State<Detail_Page> createState() => _Detail_PageState();
}

class _Detail_PageState extends State<Detail_Page> {
  GlobalKey repaintboudry = GlobalKey();
  void CopytoClipBord({required String data}) {
    Clipboard.setData(ClipboardData(text: data));
  }

  void ShareImage() async {
    RenderRepaintBoundary res = await repaintboudry.currentContext!
        .findRenderObject() as RenderRepaintBoundary;

    var image = await res.toImage(pixelRatio: 5);
    print("${image}");

    ByteData? byte = await image.toByteData(format: ImageByteFormat.png);
    print("${byte}");

    Uint8List ulist = await byte!.buffer.asUint8List();
    print("${ulist}");

    Directory directory = await getApplicationSupportDirectory();
    print("${directory}");

    File file = File("${directory.path}.png");
    await file.writeAsBytes(ulist);
    print("${file}");

    ShareExtend.share(file.path, "Image");
    print("${image}");
  }

  @override
  Widget build(BuildContext context) {
    Posts data = ModalRoute.of(context)!.settings.arguments as Posts;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit Quotes"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ShareImage();
            },
            icon: Icon(
              Icons.share,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              CopytoClipBord(data: "${data.quote}");
            },
            icon: Icon(
              Icons.copy,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                Global.fontFamily = "Roboto";
                Global.fontColor = Colors.black;
                Global.bgColor = Colors.white;
                Global.bgImage = "";
              });
            },
            icon: Icon(
              Icons.restart_alt,
              color: Colors.black,
            ),
          ),
        ],
        backgroundColor: Color(0xfffe9baa),
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "lib/Components/Assets/w-qjCHPZbeXCQ-unsplash.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  RepaintBoundary(
                    key: repaintboudry,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Global.bgColor,
                        image: DecorationImage(
                          image: AssetImage(Global.bgImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SelectableText(
                            "${data.quote}",
                            style: GoogleFonts.getFont(Global.fontFamily)
                                .copyWith(
                                    fontSize: 20, color: Global.fontColor),
                          ),
                          SelectableText(
                            "- ${data.festival_name}",
                            style: GoogleFonts.getFont(Global.fontFamily)
                                .copyWith(
                                    fontSize: 18, color: Global.fontColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: Global.bgColorList
                          .map(
                            (e) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  Global.bgColor = e;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(18),
                                height: 100,
                                width: 100,
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: e,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "Background Color",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: Global.bgColorList
                          .map(
                            (e) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  Global.fontColor = e;
                                });
                              },
                              child: Container(
                                height: 80,
                                width: 80,
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: e,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "Text Color",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: Global.fontFamilyList
                          .map(
                            (e) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  Global.fontFamily = e;
                                });
                              },
                              child: Container(
                                height: 80,
                                width: 80,
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "A a",
                                  style: GoogleFonts.getFont(e).copyWith(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: Global.bgImageList
                          .map(
                            (e) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  Global.bgImage = e;
                                });
                              },
                              child: Container(
                                height: 80,
                                width: 80,
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(e),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
