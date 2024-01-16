import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AllTrs extends StatefulWidget {
  @override
  AllTrsState createState() => AllTrsState();
}

class AllTrsState extends State<AllTrs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Transactions',
          style: GoogleFonts.ubuntu(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple[200],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Color.fromARGB(255, 223, 219, 219)),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('cipher')
              .doc('transactions')
              .collection('all')
              .orderBy('date', descending: true)
              .snapshots(),
          builder: ((context, AsyncSnapshot<QuerySnapshot> snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snap.hasError) {
              return Text("Error !");
            }
            if (snap.hasData) {
              return Container(
                // height: MediaQuery.of(context).size.height,
                height: 400,
                child: ListView(
                    children: snap.data!.docs.map((DocumentSnapshot doc) {
                  Map<String, dynamic> data =
                      doc.data() as Map<String, dynamic>;
                  DateTime dt = data['date'].toDate();
                  var hour = dt.hour.toString().length == 1
                      ? '0' + dt.hour.toString()
                      : dt.hour.toString();

                  var min = dt.minute.toString().length == 1
                      ? '0' + dt.minute.toString()
                      : dt.minute.toString();

                  var icon = 'spl.png';
                  switch (data['cat']) {
                    case 'Shopping':
                      icon = 'cat.png';
                      break;
                    case 'Subscription':
                      icon = 'sub.png';
                      break;
                    case 'Travel':
                      icon = 'tra.png';
                      break;
                    case 'Food':
                      icon = 'foo.png';
                      break;
                  }

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      height: 100,
                      width: 50,
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Colors.purple[200],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.asset(icon)),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      data['cat'],
                                      style: GoogleFonts.ubuntu(fontSize: 20),
                                    ),
                                    Text(
                                      (data['tag'] == 'inc')
                                          ? '\$ ${data['amt'].toString()}'
                                          : '-\$${data['amt'].toString()}',
                                      style: GoogleFonts.ubuntu(
                                          fontSize: 20,
                                          color: (data['tag'] == 'inc')
                                              ? Colors.green
                                              : Colors.red),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      data['desc'],
                                      style: GoogleFonts.ubuntu(fontSize: 14),
                                    ),
                                    Text(
                                      '$hour:$min',
                                      style: GoogleFonts.ubuntu(fontSize: 14),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ]),
                    ),
                  );

                  return Container();
                }).toList()),
              );
            }
            return Text("BONK");
          }),
          // child:
        ),
      ),
    );
  }
}
