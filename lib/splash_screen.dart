import 'dart:async';
import 'package:snkrs_demo/pages/login_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final void Function() toggleView;

  SplashScreen({required this.toggleView});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double logoSize = 0.1;
  bool showApp = false;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  void startAnimation() {
    Timer(Duration(seconds: 2), () {
      setState(() {
        logoSize = 1.0;
      });
    });

    Timer(Duration(seconds: 4), () {
      setState(() {
        showApp = true;
      });
    });

    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) =>
            LoginPage(toggleView: widget.toggleView),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 0, 0),
      body: Center(
        child: AnimatedOpacity(
          opacity: showApp ? 0.0 : 1.0,
          duration: Duration(seconds: 1),
          child: AnimatedContainer(
            duration: Duration(seconds: 2),
            width: MediaQuery.of(context).size.width * logoSize,
            height: MediaQuery.of(context).size.width * logoSize,
            child: Image.asset('assets/images/Nike-Logo.png'),
          ),
        ),
      ),
    );
  }
}
