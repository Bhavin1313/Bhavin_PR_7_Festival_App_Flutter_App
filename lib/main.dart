import 'package:festival_post/Views/create_post.dart';
import 'package:festival_post/Views/details_page.dart';
import 'package:festival_post/Views/post_maker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Views/festival_quote.dart';
import 'Views/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Color(0xff70cbe9),
      ),
      routes: {
        '/': (context) => Home_Page(),
        'all_Quotes': (context) => All_Quotes(),
        'post_maker': (context) => Post_Maker(),
        'create_post': (context) => Create_Post(),
        'details_page': (context) => Detail_Page(),
      },
    ),
  );
}
