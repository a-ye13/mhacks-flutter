//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mhacksflutterapp/utility.dart' as utility;
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email, password;
//  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration: kEnterTextFieldDecoration.copyWith(
                  hintText: 'Enter your email',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: kEnterTextFieldDecoration.copyWith(
                  hintText: 'Enter your password',
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              utility.enterButton(
                Colors.lightBlueAccent,
                () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
//                    final user = await _auth.signInWithEmailAndPassword(
//                        email: email, password: password);
//                    if (user != null) {
//                      Navigator.pushNamedAndRemoveUntil(
//                          context, '/chat', (Route<dynamic> route) => false);
//                    }
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/primary', (Route<dynamic> route) => false);
                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    setState(() {
                      showSpinner = false;
                    });
                    print(e);
                    Alert(
                            context: context,
                            title: "Invalid Username/Password",
                            desc: "Please try again.")
                        .show();
                  }
                },
                'Log In',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
