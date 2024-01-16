import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IE extends StatefulWidget {
  final String tag;
  IE({required this.tag});
  @override
  IEState createState() => IEState();
}

TextEditingController _desc = TextEditingController();
TextEditingController _amt = TextEditingController();
List<String> cats = ['Shopping', 'Subscription', 'Travel', 'Food'];
List<String> walls = ['Wallet 1', 'Wallet 2'];
int _selectedCat = 0, _selectedWall = 0;

class IEState extends State<IE> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          (widget.tag == 'income') ? 'Income' : 'Expense',
          style: GoogleFonts.ubuntu(),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        color: (widget.tag == 'income') ? Colors.purple[300] : Colors.blue,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text('How much ?', style: GoogleFonts.ubuntu()),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                cursorHeight: 65,
                controller: _amt,
                style: GoogleFonts.ubuntu(fontSize: 45),
                cursorColor: Colors.white,
                focusNode: FocusNode(),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    focusColor: Colors.transparent,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(20),
                    hintText: '\$0',
                    hintStyle:
                        GoogleFonts.ubuntu(fontSize: 45, letterSpacing: 2)),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                color: Color.fromARGB(255, 216, 213, 213),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                            padding: const EdgeInsets.all(10),
                            borderRadius: BorderRadius.circular(10),
                            style: GoogleFonts.ubuntu(),
                            focusColor: Colors.black,
                            isExpanded: true,
                            value: _selectedCat,
                            items: List.generate(
                                cats.length,
                                (index) => DropdownMenuItem(
                                    value: (index),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(cats[index]),
                                    ))),
                            onChanged: (e) {
                              setState(() {
                                _selectedCat = int.parse(e.toString());
                              });
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          cursorColor: Colors.black,
                          controller: _desc,
                          decoration: InputDecoration(
                              hintText: 'Description',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              hintStyle: GoogleFonts.ubuntu(),
                              contentPadding: const EdgeInsets.all(10)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                            padding: const EdgeInsets.all(10),
                            borderRadius: BorderRadius.circular(10),
                            style: GoogleFonts.ubuntu(),
                            focusColor: Colors.black,
                            isExpanded: true,
                            value: _selectedWall,
                            items: List.generate(
                                walls.length,
                                (index) => DropdownMenuItem(
                                    value: (index),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(walls[index]),
                                    ))),
                            onChanged: (e) {
                              setState(() {
                                _selectedWall = int.parse(e.toString());
                              });
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
          color: Color.fromARGB(255, 216, 213, 213),
          width: MediaQuery.of(context).size.width,
          height: 70,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: (widget.tag == 'income')
                        ? Colors.purple[300]
                        : Colors.blue),
                onPressed: () async {
                  await FirebaseFirestore.instance
                      .collection('cipher')
                      .doc('transactions')
                      .collection('all')
                      .doc()
                      .set({
                    'amt': int.parse(_amt.text),
                    'cat': cats[_selectedCat],
                    'date': DateTime.now(),
                    'desc': _desc.text,
                    'tag': (widget.tag == 'income') ? 'inc' : 'exp'
                  });
                },
                child: Text(
                  'Continue',
                  style: GoogleFonts.ubuntu(fontSize: 20, color: Colors.black),
                )),
          )),
    );
  }
}
