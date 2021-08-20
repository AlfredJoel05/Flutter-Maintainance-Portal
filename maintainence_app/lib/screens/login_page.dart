import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:maintainence_app/screens/dashboard.dart';

import '../models/services.dart' as services;

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 20, bottom: 40),
                child: Image.asset('assets/images/login3.png',
                    height: size.height * 0.3),
              ), //Image
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                width: double.infinity,
                height: size.height * 0.37,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        Color(0xff9158EE),
                        Color(0xff653FF4),
                      ]),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: FormValidation(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FormValidation extends StatefulWidget {
  FormValidation({
    Key? key,
  }) : super(key: key);

  @override
  _FormValidationState createState() => _FormValidationState();
}

class _FormValidationState extends State<FormValidation> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _spin = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 20.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Invalid UserID";
                    }
                    _email.text = value.toString();
                  },
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white10),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white60),
                    ),
                    hintText: 'Customer ID',
                    hintStyle: TextStyle(
                        color: Colors.white60,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600),
                  ),
                  cursorColor: Colors.white60,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Invalid Password";
                    }
                    // return null;
                    _password.text = value.toString();
                  },
                  // onSaved: (value) => _password = value.toString(),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white10),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white60),
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                        color: Colors.white60,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600),
                  ),
                  cursorColor: Colors.white60,
                ),
              ),
            ],
          ),
          Positioned(
            top: 200,
            left: 40,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _spin = !_spin;
                        });
                        if (_formKey.currentState!.validate()) {
                          // Show Login Alert
                          void foo() async {
                            setState(() {
                              _spin != _spin;
                            });
                            var result = await services.getLoginResponse(
                                _email, _password);
                            if (result == 'SUCCESS') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Dashboard()),
                              );
                            } else if (result == 'FAILURE') {
                              setState(() {
                                _spin = !_spin;
                              });
                              dialog(context);
                            }
                          }

                          foo();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xffbf8f8f8),
                          onPrimary: Colors.deepPurple[100],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0))),
                      child: _spin
                          ? Text(
                              'Login',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.deepPurple[900],
                              ),
                            )
                          : SizedBox(
                              // width: 30,
                              // height: 14,
                              child: SpinKitThreeBounce(
                                color: Colors.deepPurple[700],
                                size: 25,
                              ),
                            ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPassword()),
                      );
                    },
                    child: Text(
                      'Forgot your password?',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  dialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Login Failed',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.deepPurple[900],
            ),
            textAlign: TextAlign.center),
        content: Text(
          'Invalid username or password',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.deepPurple[900],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, '../../dashboard.dart'),
            child: Text(
              'Close',
              style: TextStyle(
                color: Colors.deepPurple[900],
                fontSize: 14,
              ),
            ),
          ),
        ],
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      barrierDismissible: false,
    );
  }
}

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(30),
          color: Colors.white,
          child: Text(
            'Please contact Admin for more information on "Changing Password."',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple[900],
            ),
          )),
    );
  }
}
