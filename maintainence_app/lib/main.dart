import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maintainence_app/screens/home_screen.dart';

void main() => runApp(
  MyApp(
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent, // navigation bar color
      statusBarColor: Color(0xff2A2441),
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light, // status bar color
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Maintainence App',
      theme : ThemeData(
        backgroundColor: Color(0xff2A2441),
        primaryColor: Colors.white,
      ),
      home: HomeScreen(),
    );
  }
} 

