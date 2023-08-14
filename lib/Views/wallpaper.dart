import 'package:flutter/material.dart';

import '../Components/Utils/global.dart';

class WallPaper extends StatefulWidget {
  const WallPaper({super.key});

  @override
  State<WallPaper> createState() => _WallPaperState();
}

class _WallPaperState extends State<WallPaper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "WALLPAPER LIST",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 2,
        shadowColor: Colors.grey,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.refresh,
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
                    "lib/Components/Assets/iPhone-14-Purple-wallpaper.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView.builder(
            itemBuilder: (BuildContext context, int i) => Padding(
              padding: const EdgeInsets.only(top: 18, left: 18, right: 18),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "download",
                      arguments: Global.wallPaperList[i]);
                },
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("${Global.wallPaperList[i]}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            itemCount: Global.wallPaperList.length,
          ),
        ],
      ),
    );
  }
}
