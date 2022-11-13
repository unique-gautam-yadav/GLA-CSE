import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glau/Providers/provider.dart';
import 'package:glau/utils/my_themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:provider/provider.dart';

import '../UI components/appbar.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return ThemeSwitchingArea(
      child: Scaffold(
        key: scaffoldKey,
        drawer: const AppDrawer(),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
                onPressed: () => context.read<Counter>().increment(),
                child: const Icon(
                  CupertinoIcons.add,
                  color: Colors.white,
                )),
            const SizedBox(height: 10),
            FloatingActionButton(
                onPressed: () => context.read<Counter>().reset(),
                child: const Icon(Icons.exposure_zero, color: Colors.white)),
            const SizedBox(height: 10),
            FloatingActionButton(
                onPressed: () => context.read<Counter>().decrement(),
                child: const Icon(CupertinoIcons.minus, color: Colors.white)),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              TopBar(scaffoldKey: scaffoldKey),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: CarouselSlider(
                            items: const [
                              RoundedImage(
                                path: "assets/imgs/1.jpg",
                              ),
                              RoundedImage(
                                path: "assets/imgs/2.jpg",
                              ),
                              RoundedImage(
                                path: "assets/imgs/3.jpg",
                              ),
                              RoundedImage(
                                path: "assets/imgs/4.jpg",
                              ),
                            ],
                            options: CarouselOptions(
                                autoPlay: true,
                                aspectRatio: 5 / 2,
                                enlargeCenterPage: true,
                                disableCenter: true,
                                autoPlayInterval: const Duration(seconds: 5))),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 130,
                                  width: 130,
                                  child: LiquidCircularProgressIndicator(
                                    value: 0.78,
                                    valueColor: const AlwaysStoppedAnimation(
                                        Colors.blueAccent),
                                    backgroundColor: MyThemes.darkCreamColor,
                                    borderColor: Colors.deepPurple,
                                    borderWidth: 0,
                                    direction: Axis.vertical,
                                    center: const Text("78%",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 25)),
                                  ),
                                ),
                                const Text(
                                  "Attendence",
                                  style: TextStyle(fontSize: 16),
                                )
                              ],
                            ),
                            const Center(
                                child: Text(
                              "%",
                              style: TextStyle(fontSize: 44),
                            )),
                            Column(
                              children: [
                                SizedBox(
                                  height: 130,
                                  width: 130,
                                  child: LiquidCircularProgressIndicator(
                                    value: 0.82,
                                    valueColor: const AlwaysStoppedAnimation(
                                        Colors.blueAccent),
                                    backgroundColor: MyThemes.darkCreamColor,
                                    borderColor: Colors.blue,
                                    borderWidth: 0,
                                    direction: Axis.vertical,
                                    center: const Text("82%",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 25)),
                                  ),
                                ),
                                const Text("Percentage",
                                    style: TextStyle(fontSize: 16))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    Key? key,
    required this.path,
  }) : super(key: key);
  final String path;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: AssetImage(path),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
