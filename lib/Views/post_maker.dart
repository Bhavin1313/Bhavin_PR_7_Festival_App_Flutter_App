import 'package:flutter/material.dart';

import '../Components/Utils/global.dart';

class Post_Maker extends StatefulWidget {
  const Post_Maker({super.key});

  @override
  State<Post_Maker> createState() => _Post_MakerState();
}

class _Post_MakerState extends State<Post_Maker> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Make Your Post ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              formKey.currentState!.reset();
              Global.postc.clear();
              Global.wishc.clear();
              setState(() {
                Global.post = "";
                Global.wish = "";
              });
            },
            icon: Icon(
              Icons.refresh,
              color: Colors.black,
            ),
          ),
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
        backgroundColor: Color(0xffd1eadd),
        elevation: 2,
        shadowColor: Colors.grey,
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
          GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        padding: EdgeInsets.all(15),
                        height: h * .20,
                        width: w * .9,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Enter Your Post",
                                style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                onFieldSubmitted: (val) {
                                  setState(() {
                                    Global.postc.text = val;
                                  });
                                },
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Plese Enter Descripation";
                                  }
                                },
                                controller: Global.postc,
                                onChanged: (val) {
                                  setState(() {
                                    Global.post = val;
                                  });
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  hintText: "post",
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 17,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        padding: EdgeInsets.all(15),
                        height: h * .21,
                        width: w * .9,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Enter Wish",
                                style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                onFieldSubmitted: (val) {
                                  setState(() {
                                    Global.wishc.text = val;
                                  });
                                },
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Happy Diwali";
                                  }
                                },
                                controller: Global.wishc,
                                onChanged: (val) {
                                  setState(() {
                                    Global.wish = val;
                                  });
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.grey,
                                  )),
                                  hintText: "Happy Diwali",
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 17,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "create_post");
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
                            color: Color(0xffd1eadd),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Create Post",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    ],
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
