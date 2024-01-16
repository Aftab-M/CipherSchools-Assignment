import 'package:cipher/SignUp.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatefulWidget {
  @override
  GetStartedState createState() => GetStartedState();
}

class GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: const Color.fromARGB(255, 124, 100, 252),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  width: 120,
                  height: 120,
                  child: Image.asset(
                    'logo.png',
                    fit: BoxFit.cover,
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return SignUp();
                      }));
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        'get.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
