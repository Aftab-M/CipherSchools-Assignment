import 'dart:async';

import 'package:cipher/Balance.dart';
import 'package:cipher/GetStarted.dart';
import 'package:cipher/Home.dart';
import 'package:cipher/IncomeExpense.dart';
import 'package:cipher/MainHome.dart';
import 'package:cipher/Profile.dart';
import 'package:cipher/SignUp.dart';
import 'package:cipher/Splash.dart';
import 'package:cipher/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Timer(Duration(seconds: 3), () {
    //   Navigator.of(context)
    //       .pushReplacement(MaterialPageRoute(builder: (context) {
    //     return GetStarted();
    //   }));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: IE(tag: 'expense'),
        body: MainHome());
  }
}
