import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:glau/Providers/provider.dart';
import 'package:glau/Views/page_1.dart';
import 'package:glau/utils/my_themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: MyThemes.lightTheme(context),
      builder: (_, theme) => MaterialApp(
        initialRoute: "/home",
        debugShowCheckedModeBanner: false,
        routes: {"/home": (context) => const CounterPage()},
      ),
    );
  }
}
