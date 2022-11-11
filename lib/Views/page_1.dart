import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glau/Providers/provider.dart';
import 'package:glau/utils/my_themes.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
                onPressed: () => context.read<Counter>().increment(),
                child: const Icon(CupertinoIcons.add)),
            const SizedBox(height: 10),
            FloatingActionButton(
                onPressed: () => context.read<Counter>().reset(),
                child: const Icon(Icons.exposure_zero)),
            const SizedBox(height: 10),
            FloatingActionButton(
                onPressed: () => context.read<Counter>().decrement(),
                child: const Icon(CupertinoIcons.minus)),
          ],
        ),
        appBar: AppBar(actions: [
          ThemeSwitcher.withTheme(
            clipper: const ThemeSwitcherCircleClipper(),
            builder: (_, switcher, theme) => IconButton(
              icon: theme.brightness == Brightness.light
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
        ], title: const Text("Counter Application")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Your counter values : ${context.watch<Counter>().count}",
                  style: const TextStyle(fontSize: 14)),
              Text(
                "${context.watch<Counter>().count}",
                style: const TextStyle(fontSize: 42),
              )
            ],
          ),
        ),
      ),
    );
  }
}
