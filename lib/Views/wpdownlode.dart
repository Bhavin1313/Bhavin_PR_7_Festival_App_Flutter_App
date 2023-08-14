import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';

class Downlode extends StatefulWidget {
  const Downlode({super.key});

  @override
  State<Downlode> createState() => _DownlodeState();
}

class _DownlodeState extends State<Downlode> {
  GlobalKey repaintboudry = GlobalKey();
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
    var data = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "DOWNLOAD",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xffd1eadd),
        elevation: 2,
        shadowColor: Colors.grey,
        actions: [
          IconButton(
            onPressed: () {
              ShareImage();
            },
            icon: const Icon(
              Icons.share,
              color: Colors.black,
            ),
          )
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "lib/Components/Assets/Color Accessibility _ UX Best Practices for Using Color in Design.webp"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: RepaintBoundary(
              key: repaintboudry,
              child: Container(
                height: h * .8,
                width: w * .9,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("${data}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
