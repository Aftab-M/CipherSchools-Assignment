import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Balance extends StatefulWidget {
  @override
  BalanceState createState() => BalanceState();
}

class BalanceState extends State<Balance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        title: Text('Your Balance', style: GoogleFonts.ubuntu()),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration:
            BoxDecoration(color: const Color.fromARGB(255, 202, 196, 196)),
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'Your Balance is : \n\n',
                style: GoogleFonts.ubuntu(color: Colors.black, fontSize: 22),
                children: [
                  TextSpan(
                      text: '38000',
                      style:
                          GoogleFonts.ubuntu(color: Colors.black, fontSize: 35))
                ]),
          ),
        ),
      ),
    );
  }
}
