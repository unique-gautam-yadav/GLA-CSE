import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/my_themes.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).canvasColor,
      elevation: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width - 60,
            child: const Center(
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
            width: 30,
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
