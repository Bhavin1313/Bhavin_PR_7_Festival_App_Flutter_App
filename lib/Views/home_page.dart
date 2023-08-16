import 'dart:math';

import 'package:festival_post/Components/Utils/list.dart';
import 'package:flutter/material.dart';

import '../Components/Utils/global.dart';
import '../Model/festival_model.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  Random random = Random();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Global.QuotsData =
        FestivalQuoteList.map((e) => Posts.fromMap(Data: e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    int RandomIndex = random.nextInt(Global.QuotsData.length);
    Posts quotes = Global.QuotsData[RandomIndex];
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "FESTIVAL POST",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xffd1eadd),
        elevation: 2,
        shadowColor: Colors.grey,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.account_circle_outlined,
              color: Colors.black,
            ),
          )
        ],
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
            )),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 18,
              left: 18,
              right: 18,
            ),
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: h * .3,
                      width: w * .9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...FestivalImageList.map(
                              (e) => Container(
                                height: h * .3,
                                width: w * .9,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: NetworkImage("${e['post_image']}"),
                                  ),
                                ),
                              ),
                            ).toList(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "post_maker");
                    },
                    child: Container(
                      height: h * .08,
                      width: w * .9,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffd1eadd).withOpacity(.4),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Create Your Poster",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "all_Quotes");
                    },
                    child: Container(
                      height: h * .08,
                      width: w * .9,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffd1eadd).withOpacity(.4),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Show All Poster",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "WALLPAPER",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "wallpaper");
                        },
                        child: Container(
                          height: h * .35,
                          width: w * .42,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            image: DecorationImage(
                              image: AssetImage(
                                "lib/Components/Assets/DreamShaper_v7_diwali_festival_background_2.jpg",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "wallpaper");
                        },
                        child: Container(
                          height: h * .35,
                          width: w * .42,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            image: DecorationImage(
                              image: AssetImage(
                                "lib/Components/Assets/Default_holi_colorfull_background_2.jpg",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18,
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
