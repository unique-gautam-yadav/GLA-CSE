import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glau/utils/my_themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

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
        // appBar: AppBar(
        //   elevation: 0,
        //   title: const Text(
        //     "GLA University",
        //   ),
        //   actions: [
        //     ThemeSwitcher.withTheme(
        //       clipper: const ThemeSwitcherCircleClipper(),
        //       builder: (_, switcher, theme) => IconButton(
        //         icon: theme.brightness != Brightness.light
        //             ? const Icon(CupertinoIcons.sun_max_fill)
        //             : const Icon(CupertinoIcons.moon_fill),
        //         onPressed: () {
        //           switcher.changeTheme(
        //               theme: theme.brightness == Brightness.light
        //                   ? MyThemes.darkTheme(context)
        //                   : MyThemes.lightTheme(context));
        //         },
        //       ),
        //     ),
        //   ],
        // ),
        key: scaffoldKey,
        drawer: const AppDrawer(),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                actions: [
                  ThemeSwitcher.withTheme(
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
                ],
                leading: IconButton(
                  icon: const Icon(Icons.menu_rounded),
                  onPressed: () {
                    scaffoldKey.currentState!.openDrawer();
                  },
                ),
                title: const Text("GLA University"),
                // automaticallyImplyLeading: false,
                expandedHeight: 0,
                floating: true,
                snap: true,
              )
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, top: 0, bottom: 12),
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 24,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                  "https://glauniversity.in:8103/203500024.jpg"),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Hello, Gautam Yadav 🔥",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: GoogleFonts.roboto().fontFamily,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "Diploma - CS (V Sem)",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w100),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
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
                                  autoPlayInterval:
                                      const Duration(seconds: 5))),
                        ),
                      ),
                      const SizedBox(height: 4),
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
                                      valueColor: AlwaysStoppedAnimation(
                                          Colors.green.shade500),
                                      backgroundColor: MyThemes.darkCreamColor,
                                      borderColor: Colors.deepPurple,
                                      borderWidth: 0,
                                      direction: Axis.vertical,
                                      center: const Text("78%",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25)),
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
                                      valueColor: AlwaysStoppedAnimation(
                                          Colors.green.shade500),
                                      backgroundColor: MyThemes.darkCreamColor,
                                      borderColor: Colors.green,
                                      borderWidth: 0,
                                      direction: Axis.vertical,
                                      center: const Text("82%",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25)),
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
                      const SizedBox(height: 4),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Column(
                            children: [
                              const Text("Today's TimeTable",
                                  style: TextStyle(fontSize: 15)),
                              const Divider(thickness: 2),
                              for (int i = 0; i < 5; i++)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Lecture - ${i + 1}"),
                                          const Text("(10:00 AM - 11:00 AM)")
                                        ],
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text("SubCode/Type/Block/Room/Mode"),
                                          Text("Full Subject Name"),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 17),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text("Facylty : Faculty Name"),
                                          Text("Status : Status of the Lecture")
                                        ],
                                      ),
                                    ),
                                    const Divider()
                                  ],
                                ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
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
