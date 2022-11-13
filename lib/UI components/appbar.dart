import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glau/Providers/provider.dart';
import 'package:provider/provider.dart';

import '../utils/my_themes.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).canvasColor,
      elevation: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            child: IconButton(
                onPressed: () => scaffoldKey.currentState!.openDrawer(),
                icon: const Icon(Icons.menu_rounded)),
          ),
          const SizedBox(
            child: Center(
              child: Text(
                "GLA University",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.25),
              ),
            ),
          ),
          SizedBox(
            width: 50,
            child: ThemeSwitcher.withTheme(
              clipper: const ThemeSwitcherCircleClipper(),
              builder: (_, switcher, theme) => IconButton(
                icon: theme.brightness != Brightness.light
                    ? const Icon(CupertinoIcons.sun_max_fill)
                    : const Icon(CupertinoIcons.moon_fill),
                onPressed: () {
                  switcher.changeTheme(
                      theme: theme.brightness == Brightness.light
                          ? MyThemes.darkTheme(context)
                          : MyThemes.lightTheme(context));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: SafeArea(
        child: Text("Gautam Yadav"),
      ),
    );
  }
}
