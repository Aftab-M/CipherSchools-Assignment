import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.blue[600],
      child: Image.asset(
        'assets/splash.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
