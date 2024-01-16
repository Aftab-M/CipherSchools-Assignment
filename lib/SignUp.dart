import 'package:cipher/MainHome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignUp extends StatefulWidget {
  @override
  SignUpState createState() => SignUpState();
}

TextEditingController _name = TextEditingController();
TextEditingController _email = TextEditingController();
TextEditingController _pass = TextEditingController();

class SignUpState extends State<SignUp> {
  var _checked = false;

  signUp() {
    FirebaseFirestore.instance
        .collection('cipher')
        .doc('users')
        .collection('allUsers')
        .doc()
        .set({
      'uname': _name.text,
      'pass': _pass.text,
      'email': _email.text,
    }).then((value) => Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) {
              return MainHome();
            })));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: GoogleFonts.ubuntu(),
        ),
        elevation: 10,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 60),
            TextFormField(
              controller: _name,
              decoration: InputDecoration(
                  hintText: 'Name',
                  hintStyle: GoogleFonts.ubuntu(),
                  contentPadding: const EdgeInsets.all(15),
                  enabledBorder: OutlineInputBorder()),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: _email,
              decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: GoogleFonts.ubuntu(),
                  contentPadding: const EdgeInsets.all(15),
                  enabledBorder: OutlineInputBorder()),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: _pass,
              decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Icon(Icons.remove_red_eye),
                  ),
                  hintStyle: GoogleFonts.ubuntu(),
                  contentPadding: const EdgeInsets.all(15),
                  enabledBorder: OutlineInputBorder(),
                  focusColor: Colors.black),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Checkbox(
                    value: _checked,
                    onChanged: (e) {
                      setState(() {
                        _checked = !_checked;
                      });
                    }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 70,
                    child: RichText(
                        text: TextSpan(
                            text: "By Signing up, you agree to the ",
                            style: GoogleFonts.ubuntu(),
                            children: <TextSpan>[
                          TextSpan(
                              text: 'Terms of Service and Privacy Policy',
                              style: GoogleFonts.ubuntu(color: Colors.purple))
                        ])),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 100,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_name.text != '' &&
                            _email.text != '' &&
                            _pass.text != '') {
                          signUp();
                        } // if
                      },
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.ubuntu(
                            color: Colors.white, fontSize: 22),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Or with',
                  style: GoogleFonts.ubuntu(color: Colors.grey),
                ),
                const SizedBox(height: 20),
                SignInButton(
                  Buttons.Google,
                  onPressed: () {},
                  padding: const EdgeInsets.all(10),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
