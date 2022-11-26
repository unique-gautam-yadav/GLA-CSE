import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glau/UI%20components/appbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glau/Views/Home.dart';
import 'package:glau/animations/fade_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  final _rollController = TextEditingController();
  final _passwordController = TextEditingController();
  Duration animationDuration = const Duration(milliseconds: 250);

  /// Email & Password Empty
  var fSnackBar = const SnackBar(
    content: Text('The Email & Password fields Must Fill!'),
  );

  /// Email Fill & Password Empty
  var sSnackBar = const SnackBar(
    content: Text('Password field Must Fill!'),
  );

  /// Email Empty & Password Fill
  var tSnackBar = const SnackBar(
    content: Text('Email field Must Fill!'),
  );
  Future signIn() async {
    try {
      /// In the below, with if statement we have some simple validate
      if (_rollController.text.isNotEmpty &
          _passwordController.text.isNotEmpty) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _rollController.text.trim(),
          password: _passwordController.text.trim(),
        );
        // ignore: use_build_context_synchronously
      } else if (_rollController.text.isNotEmpty &
          _passwordController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(sSnackBar);
      } else if (_rollController.text.isEmpty &
          _passwordController.text.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(tSnackBar);
      } else if (_rollController.text.isEmpty &
          _passwordController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(fSnackBar);
      }
    } catch (e) {
      /// Showing Error with AlertDialog if the user enter the wrong Email and Password
      showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error Happened'),
            content: const SingleChildScrollView(
              child: Text(
                  "The Email and Password that you Entered is Not valid ,Try Enter a valid Email and Password."),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Got it'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _rollController.clear();
                  _passwordController.clear();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
        child: Scaffold(
      key: scaffoldKey,
      drawer: const AppDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [TopBar(scaffoldKey: scaffoldKey, hasDrawer: false)];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 100, width: 200),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .8,
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        FadeInAnimation(
                            delay: 1,
                            child: SvgPicture.asset("assets/imgs/Login2.svg",
                                width: 200)),
                        const SizedBox(height: 20),
                        FadeInAnimation(
                          delay: 1.5,
                          child: TextFormField(
                              controller: _rollController,
                              decoration: const InputDecoration(
                                label: Text("Enter Your ID"),
                                contentPadding: EdgeInsets.only(left: 20),
                                icon: Icon(Icons.person),
                                suffixIcon: Icon(Icons.abc_outlined),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                              )),
                        ),
                        const SizedBox(height: 25),
                        FadeInAnimation(
                          delay: 2.0,
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(left: 20),
                              icon: Icon(CupertinoIcons.lock_fill),
                              suffixIcon: Icon(CupertinoIcons.check_mark),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              label: Text("Enter Password"),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        FadeInAnimation(
                          delay: 2.5,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                padding:
                                    MaterialStateProperty.all(EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * .2,
                                  right: MediaQuery.of(context).size.width * .2,
                                  top: 10,
                                  bottom: 10,
                                )),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.deepPurple)),
                            onPressed: () {
                              FocusManager.instance.primaryFocus!.unfocus();
                              signIn();
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Theme.of(context).canvasColor),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _rollController.dispose();
    super.dispose();
  }
}
