import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

List<String> months = [
  'January',
  'February',
  'Marach',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

int currMonth = DateTime.now().month;
int _selectedVal = currMonth;

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    print('${months[currMonth]}');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 194, 189, 189),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: CircleAvatar(
                radius: 5,
                child: Icon(Icons.person),
                backgroundColor: Colors.purple[200]),
          ),
        ),
        title: DropdownButton(
          // value: Text(''),
          // hint: Text('${months[currMonth]}'),
          value: _selectedVal,
          style: GoogleFonts.ubuntu(),
          items: List.generate(
              12,
              (index) => DropdownMenuItem(
                  value: (index + 1),
                  child: Text(
                    '${months[index]}',
                    style: GoogleFonts.ubuntu(),
                  ))),
          onChanged: (val) {
            setState(() {
              _selectedVal = int.parse(val.toString());
            });
          },
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  'Account Balance',
                  style: GoogleFonts.ubuntu(),
                ),
                const SizedBox(height: 7),
                Text(
                  '\$38000',
                  style: GoogleFonts.ubuntu(fontSize: 40),
                ),
                const SizedBox(height: 30),
                // INCOME AND EXPENSE
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 180,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.swipe_down_alt_rounded,
                              size: 50,
                              color: Colors.white,
                            ),
                            RichText(
                                text: TextSpan(
                                    text: 'Income\n',
                                    style: GoogleFonts.ubuntu(
                                        color: Colors.white, fontSize: 20),
                                    children: [
                                  TextSpan(
                                      text: '\$50000',
                                      style: GoogleFonts.ubuntu(
                                          color: Colors.white, fontSize: 30))
                                ]))
                          ],
                        ),
                      ),
                      Container(
                        width: 180,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.swipe_up_alt_rounded,
                              size: 50,
                              color: Colors.white,
                            ),
                            RichText(
                                text: TextSpan(
                                    text: 'Expense\n',
                                    style: GoogleFonts.ubuntu(
                                        color: Colors.white, fontSize: 20),
                                    children: [
                                  TextSpan(
                                      text: '\$12000',
                                      style: GoogleFonts.ubuntu(
                                          color: Colors.white, fontSize: 30))
                                ]))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  child: Wrap(
                    spacing: 5,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Today',
                            style: GoogleFonts.ubuntu(
                                color: Color.fromARGB(255, 184, 165, 0))),
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.purple,
                            elevation: 10,
                            backgroundColor: Colors.white),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Week',
                            style: GoogleFonts.ubuntu(
                                color: Color.fromARGB(255, 184, 165, 0))),
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.purple,
                            elevation: 10,
                            backgroundColor: Colors.white),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Month',
                            style: GoogleFonts.ubuntu(
                                color: Color.fromARGB(255, 184, 165, 0))),
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.purple,
                            elevation: 10,
                            backgroundColor: Colors.white),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Year',
                            style: GoogleFonts.ubuntu(
                                color: Color.fromARGB(255, 184, 165, 0))),
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.purple,
                            elevation: 10,
                            backgroundColor: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // RECENT TRANSACTIONS & SEE ALL
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recent Transactions',
                        style: GoogleFonts.ubuntu(fontWeight: FontWeight.w600),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'See All',
                          style: GoogleFonts.ubuntu(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(172, 155, 39, 176)),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 400,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromARGB(166, 158, 158, 158)),
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('cipher')
                          .doc('transactions')
                          .collection('all')
                          .orderBy('date', descending: true)
                          .limit(5)
                          .snapshots(),
                      builder: ((context, AsyncSnapshot<QuerySnapshot> snap) {
                        if (snap.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (snap.hasError) {
                          return const Text("Error !");
                        }
                        if (snap.hasData) {
                          return Container(
                            // height: MediaQuery.of(context).size.height,
                            height: 400,
                            child: ListView(
                                children:
                                    snap.data!.docs.map((DocumentSnapshot doc) {
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
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Image.asset(icon)),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  data['cat'],
                                                  style: GoogleFonts.ubuntu(
                                                      fontSize: 20),
                                                ),
                                                Text(
                                                  (data['tag'] == 'inc')
                                                      ? '\$ ${data['amt'].toString()}'
                                                      : '-\$${data['amt'].toString()}',
                                                  style: GoogleFonts.ubuntu(
                                                      fontSize: 20,
                                                      color:
                                                          (data['tag'] == 'inc')
                                                              ? Colors.green
                                                              : Colors.red),
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  data['desc'],
                                                  style: GoogleFonts.ubuntu(
                                                      fontSize: 14),
                                                ),
                                                Text(
                                                  '$hour:$min',
                                                  style: GoogleFonts.ubuntu(
                                                      fontSize: 14),
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
                            }).toList()),
                          );
                        }
                        return Text("BONK");
                      }),
                      // child:
                    ),
                    // ListView.builder(
                    //     itemCount: months.length,
                    //     itemBuilder: (context, index) {
                    //       return Padding(
                    //         padding: const EdgeInsets.all(8.0),
                    //         child: Container(
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(10),
                    //               color: Colors.white),
                    //           height: 100,
                    //           width: 50,
                    //           child: Row(children: [
                    //             Padding(
                    //               padding: const EdgeInsets.only(left: 8),
                    //               child: Container(
                    //                   height: 70,
                    //                   width: 70,
                    //                   decoration: BoxDecoration(
                    //                       color: Colors.purple[200],
                    //                       borderRadius:
                    //                           BorderRadius.circular(10)),
                    //                   child: Icon(Icons.shopping_bag)),
                    //             ),
                    //             Expanded(
                    //               child: Padding(
                    //                 padding: const EdgeInsets.all(15),
                    //                 child: Column(
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.spaceBetween,
                    //                   children: [
                    //                     Row(
                    //                       mainAxisAlignment:
                    //                           MainAxisAlignment.spaceBetween,
                    //                       children: [
                    //                         Text(
                    //                           'Shopping',
                    //                           style: GoogleFonts.ubuntu(
                    //                               fontSize: 20),
                    //                         ),
                    //                         Text(
                    //                           '\$ 140',
                    //                           style: GoogleFonts.ubuntu(
                    //                               fontSize: 20),
                    //                         )
                    //                       ],
                    //                     ),
                    //                     Row(
                    //                       mainAxisAlignment:
                    //                           MainAxisAlignment.spaceBetween,
                    //                       children: [
                    //                         Text(
                    //                           'Buy groceries',
                    //                           style: GoogleFonts.ubuntu(
                    //                               fontSize: 14),
                    //                         ),
                    //                         Text(
                    //                           '10:10 AM',
                    //                           style: GoogleFonts.ubuntu(
                    //                               fontSize: 14),
                    //                         )
                    //                       ],
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             )
                    //           ]),
                    //         ),
                    //       );
                    //     }),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
