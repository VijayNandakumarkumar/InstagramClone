import 'package:flutter/material.dart';
import 'package:flutter_app/pages/AccountPage.dart';
import 'package:flutter_app/pages/HomePage.dart';
import 'package:flutter_app/pages/LikedPage.dart';
import 'package:flutter_app/pages/SearchPage.dart';
import 'package:flutter_app/pages/UploadPage.dart';
import 'package:flutter_app/utils/Colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this, initialIndex: 0);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          print("Came here");
          debugPrint("Came here" + selectedIndex.toString());
          selectedIndex = _tabController.index;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: black,
      bottomNavigationBar: getBottomNavBar(),
      body: TabBarView(
        controller: _tabController,
        children: [
          HomePage(),
          SearchPage(),
          UploadPage(),
          LikedPage(),
          AccountPage()
        ],
      ),
    );
  }

  Widget getBottomNavBar() {
    return Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(color: bottomNavColor),
        child: TabBar(
          indicatorColor: Colors.transparent,
          labelPadding: EdgeInsets.symmetric(horizontal: 2.0),
          controller: _tabController,
          tabs: [
            Tab(
              icon: SvgPicture.asset(
                selectedIndex == 0
                    ? "assets/images/home_active_icon.svg"
                    : "assets/images/home_icon.svg",
                color: white,
                width: 27,
              ),
            ),
            Tab(
                child: SvgPicture.asset(
              selectedIndex == 1
                  ? "assets/images/search_active_icon.svg"
                  : "assets/images/search_icon.svg",
              color: white,
              width: 27,
            )),
            Tab(
                child: SvgPicture.asset(
              selectedIndex == 2
                  ? "assets/images/instagram-reels-active.svg"
                  : "assets/images/instagram-reels.svg",
              width: 37,
                  color: Colors.white,
            )),
            Tab(
                child: SvgPicture.asset(
              selectedIndex == 3
                  ? "assets/images/love_active_icon.svg"
                  : "assets/images/love_icon.svg",
              color: white,
              width: 27,
            )),
            Tab(
                child: SvgPicture.asset(
              selectedIndex == 4
                  ? "assets/images/account_active_icon.svg"
                  : "assets/images/account_icon.svg",
              color: white,
              width: 27,
            )),
          ],
        ));
  }

  void setSelectedIndex(index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
