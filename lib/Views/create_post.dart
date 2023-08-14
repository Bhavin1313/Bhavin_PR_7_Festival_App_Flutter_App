import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';

import '../Components/Utils/global.dart';

class Create_Post extends StatefulWidget {
  const Create_Post({super.key});

  @override
  State<Create_Post> createState() => _Create_PostState();
}

class _Create_PostState extends State<Create_Post> {
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
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "EDIT POST",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ShareImage();
            },
            icon: Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              CopytoClipBord(data: "${Global.post}");
            },
            icon: Icon(
              Icons.copy,
              color: Colors.white,
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
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: Color(0xff002564),
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("lib/Components/Assets/images (9).jpg"),
              fit: BoxFit.cover,
            )),
          ),
          SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  RepaintBoundary(
                    key: repaintboudry,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      height: h * .4,
                      width: w * .90,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Global.bgImage),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        color: Global.bgColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SelectableText(
                            "${Global.post}",
                            style: GoogleFonts.getFont(Global.fontFamily).merge(
                              TextStyle(
                                color: Global.fontColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SelectableText(
                            "${Global.wish}",
                            style: GoogleFonts.getFont(Global.fontFamily).merge(
                              TextStyle(
                                color: Global.fontColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showDialog(
                          context: context,
                          builder: (context) => Center(
                            child: Container(
                              height: h * .3,
                              width: w * .8,
                              child: SingleChildScrollView(
                                child: Wrap(
                                  children: Global.bgColorList
                                      .map(
                                        (e) => GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              Global.bgColor = e;
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            margin: EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: e,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                    },
                    child: Container(
                      height: h * .1,
                      width: w * .9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Change BackGroung Color",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showDialog(
                          context: context,
                          builder: (context) => Center(
                            child: Container(
                              height: h * .3,
                              width: w * .8,
                              child: SingleChildScrollView(
                                child: Wrap(
                                  children: Global.fontFamilyList
                                      .map(
                                        (e) => GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              Global.fontFamily = e;
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            margin: EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white,
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              "A a",
                                              style: GoogleFonts.getFont(e)
                                                  .copyWith(
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                    },
                    child: Container(
                      height: h * .1,
                      width: w * .9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Change Font Style",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showDialog(
                          context: context,
                          builder: (context) => Center(
                            child: Container(
                              height: h * .3,
                              width: w * .8,
                              child: SingleChildScrollView(
                                child: Wrap(
                                  children: Global.bgColorList
                                      .map(
                                        (e) => GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              Global.fontColor = e;
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            margin: EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: e,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                    },
                    child: Container(
                      height: h * .1,
                      width: w * .9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Change Font Color",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showDialog(
                          context: context,
                          builder: (context) => Center(
                            child: Container(
                              height: h * .3,
                              width: w * .8,
                              child: SingleChildScrollView(
                                child: Wrap(
                                  children: Global.bgImageList
                                      .map(
                                        (e) => GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              Global.bgImage = e;
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            height: 90,
                                            width: 90,
                                            margin: EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage("${e}"),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                    },
                    child: Container(
                      height: h * .1,
                      width: w * .9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Change BackGroung Image",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
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

// SingleChildScrollView(
// scrollDirection: Axis.horizontal,
// child: Row(
// children: Global.bgColorList
//     .map(
// (e) => GestureDetector(
// onTap: () {
// setState(() {
// Global.bgColor = e;
// });
// },
// child: Container(
// height: 100,
// width: 100,
// margin: EdgeInsets.all(5),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10),
// color: e,
// ),
// alignment: Alignment.center,
// child: Text(
// "BG COLOR",
// style: TextStyle(
// fontWeight: FontWeight.bold,
// ),
// ),
// ),
// ),
// )
//     .toList(),
// ),
// ),
// SingleChildScrollView(
// scrollDirection: Axis.horizontal,
// child: Row(
// children: Global.fontFamilyList
//     .map(
// (e) => GestureDetector(
// onTap: () {
// setState(() {
// Global.fontFamily = e;
// });
// },
// child: Container(
// height: 60,
// width: 60,
// margin: EdgeInsets.all(5),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10),
// color: Colors.white,
// ),
// alignment: Alignment.center,
// child: Text(
// "A a",
// style: GoogleFonts.getFont(e).copyWith(
// fontSize: 20,
// ),
// ),
// ),
// ),
// )
//     .toList(),
// ),
// ),
// SingleChildScrollView(
// scrollDirection: Axis.horizontal,
// child: Row(
// children: Global.bgColorList
//     .map(
// (e) => GestureDetector(
// onTap: () {
// setState(() {
// Global.fontColor = e;
// });
// },
// child: Container(
// height: 70,
// width: 70,
// margin: EdgeInsets.all(5),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10),
// color: e,
// ),
// alignment: Alignment.center,
// child: Text(
// "Text Color",
// style: TextStyle(
// fontWeight: FontWeight.bold,
// ),
// ),
// ),
// ),
// )
//     .toList(),
// ),
// ),
// SingleChildScrollView(
// scrollDirection: Axis.horizontal,
// child: Row(
// children: Global.bgImageList
//     .map(
// (e) => GestureDetector(
// onTap: () {
// setState(() {
// Global.bgImage = e;
// });
// },
// child: Container(
// height: 100,
// width: 100,
// margin: EdgeInsets.all(5),
// decoration: BoxDecoration(
// image: DecorationImage(
// image: AssetImage(e),
// fit: BoxFit.cover,
// ),
// borderRadius: BorderRadius.circular(10),
// color: Colors.white,
// ),
// alignment: Alignment.center,
// ),
// ),
// )
//     .toList(),
// ),
// ),
