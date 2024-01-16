import 'package:cipher/AllTransactions.dart';
import 'package:cipher/Balance.dart';
import 'package:cipher/GetStarted.dart';
import 'package:cipher/Home.dart';
import 'package:cipher/IncomeExpense.dart';
import 'package:cipher/Profile.dart';
import 'package:cipher/SignUp.dart';
import 'package:cipher/Splash.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainHome extends StatefulWidget {
  @override
  MainHomeState createState() => MainHomeState();
}

List bodies = [Home(), AllTrs(), Balance(), Profile()];

class MainHomeState extends State<MainHome> {
  int currIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodies[currIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 2,
        color: Colors.purple[200],
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  onPressed: () {
                    setState(() {
                      currIndex = 0;
                    });
                  },
                  icon: Icon(
                    Icons.home,
                    size: 30,
                    color: (currIndex == 0) ? Colors.white : Colors.black,
                  )),
              IconButton(
                  onPressed: () {
                    setState(() {
                      currIndex = 1;
                    });
                  },
                  icon: Icon(
                    Icons.auto_graph_rounded,
                    size: 30,
                    color: (currIndex == 1) ? Colors.white : Colors.black,
                  )),
              IconButton(
                  onPressed: () {
                    setState(() {
                      currIndex = 2;
                    });
                  },
                  icon: Icon(
                    Icons.bar_chart_rounded,
                    size: 30,
                    color: (currIndex == 2) ? Colors.white : Colors.black,
                  )),
              IconButton(
                  onPressed: () {
                    setState(() {
                      currIndex = 3;
                    });
                  },
                  icon: Icon(
                    Icons.person,
                    size: 30,
                    color: (currIndex == 3) ? Colors.white : Colors.black,
                  ))
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
          child: FloatingActionButton(
              shape: CircleBorder(),
              backgroundColor: Colors.purple[300],
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white),
                            height: 300,
                            width: MediaQuery.of(context).size.width - 70,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.green),
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(builder: (context) {
                                        return IE(tag: 'income');
                                      }));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Text(
                                        'Income',
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                    )),
                                TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.red),
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(builder: (context) {
                                        return IE(tag: 'expense');
                                      }));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Text(
                                        'Expense',
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              child: Icon(Icons.add, color: Colors.white)),
        ),
      ),
    );
  }
}
