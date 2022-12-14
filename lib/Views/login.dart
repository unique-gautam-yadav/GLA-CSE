import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glau/UI%20components/appbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glau/animations/fade_in.dart';
import 'package:glau/data/auth.dart';

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

  Future signIn() async {
    if (formKey.currentState!.validate()) {
      Authenticate.login(
          _rollController.text, _passwordController.text, context);
    }
    _rollController.clear();
    _passwordController.clear();
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
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter your ID";
                                } else {
                                  return null;
                                }
                              },
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter your password!!";
                              } else {
                                return null;
                              }
                            },
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
