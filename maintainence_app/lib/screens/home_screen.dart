import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'login_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 7), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            // Loader Animation
            Container(
              // alignment: Alignment.center,
              child: RiveAnimation.asset(
                'assets/animations/loader.riv',
                onInit: (_) => setState(() {}),
              ),
              width: 350,
              height: 350,
              // padding: ,
            ),

            // logo Container
            Container(
              padding: const EdgeInsets.only(top: 140.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png'),
                  SizedBox(height: 70.0),
                  Text(
                    'Maintainence',
                    style: GoogleFonts.ubuntu(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  SizedBox(height: 3.0),
                  Text(
                    'Portal',
                    style: GoogleFonts.ubuntu(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Email Page'),
        ),
        body: Center(
          child: Text('Email Validation'),
        ));
  }
}
