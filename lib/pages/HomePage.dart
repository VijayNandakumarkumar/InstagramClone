import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/utils/Colors.dart';
import 'package:flutter_app/widgets/StoryWidget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  10,
                  (index) => StoryWidget(
                      name: "Vijay",
                      imageUrl:
                          "https://www.alamy.com/vjk-circular-emblem-alphabet-letter-vector-logo-template-image364755563.html")),
            ),
          ),
        ],
      ),
    );
  }
}

PreferredSize getAppBar() {
  return PreferredSize(
    preferredSize: Size.fromHeight(80.0),
    child: AppBar(
      toolbarHeight: 80,
      backgroundColor: appBarColor,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 2, top: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Instagram",
              style: TextStyle(fontFamily: 'Billabong', fontSize: 35),
            ),
            Row(
              children: [
                SvgPicture.asset(
                  "assets/images/upload_icon.svg",
                  width: 30,
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                    child: Stack(
                  children: [
                    SvgPicture.asset(
                      "assets/images/messenger.svg",
                      width: 35,
                      color: Colors.white,
                    ),
                    Positioned(
                        top: -3,
                        right: -3,
                        child: Container(
                          width: 19,
                          height: 19,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: unreadMessageColor),
                          child: Text("5",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              )),
                        ))
                  ],
                ))
              ],
            )
          ],
        ),
      ),
    ),
  );
}
