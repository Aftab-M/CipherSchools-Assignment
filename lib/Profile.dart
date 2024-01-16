import 'package:cipher/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color.fromARGB(255, 231, 230, 230),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        border: Border.all(color: Colors.purple, width: 3)),
                    child: Padding(
                      padding: const EdgeInsets.all(1.5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: Image.asset(
                          'assets/spl.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Username',
                        style: GoogleFonts.ubuntu(color: Colors.grey),
                      ),
                      Text(
                        'DAVE SEAN',
                        style: GoogleFonts.ubuntu(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(width: 45),
                  Icon(Icons.edit),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Row(children: [
                        Container(
                            height: 50,
                            width: 50,
                            child: Image.asset('assets/wallet.png')),
                        Text(
                          'Account',
                          style: GoogleFonts.ubuntu(),
                        ),
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Row(children: [
                        Container(
                            height: 50,
                            width: 50,
                            child: Image.asset('assets/settings.png')),
                        Text(
                          'Settings',
                          style: GoogleFonts.ubuntu(),
                        ),
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Row(children: [
                        Container(
                            height: 50,
                            width: 50,
                            child: Image.asset('assets/upload.png')),
                        Text(
                          'Export Data',
                          style: GoogleFonts.ubuntu(),
                        ),
                      ]),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        return SignUp();
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Row(children: [
                          Container(
                              height: 50,
                              width: 50,
                              child: Image.asset('assets/logout.png')),
                          Text(
                            'Logout',
                            style: GoogleFonts.ubuntu(),
                          ),
                        ]),
                      ),
                    ),
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
