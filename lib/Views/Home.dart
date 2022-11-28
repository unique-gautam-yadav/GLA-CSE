import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glau/Views/page_1.dart';

import '../UI components/appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _curruntIndex = 0;
  List<Widget> pages = [
    const Page1(),
    const Center(
      child: Text("Page 2"),
    )
  ];

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return ThemeSwitchingArea(
        child: Scaffold(
      key: scaffoldKey,
      drawer: const AppDrawer(),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [TopBar(scaffoldKey: scaffoldKey, hasDrawer: true)];
          },
          body: pages[_curruntIndex]),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50))),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.safety_check), label: "SomeThing Else")
          ],
          currentIndex: _curruntIndex,
          elevation: 50,
          onTap: (value) {
            setState(() {
              _curruntIndex = value;
            });
          },
        ),
      ),
    ));
  }
}
