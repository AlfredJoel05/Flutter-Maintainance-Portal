import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maintainence_app/screens/login_page.dart';
import 'package:maintainence_app/screens/workorder_list.dart';

import 'profile.dart';
import 'notification_create.dart';
import 'notification_list.dart';
import 'workorder_create.dart';
import '../models/services.dart' as services;

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 2;
  String user = '';
  String plant = '';
  String grp = '';
  final screens = [Create(), View(), Profile(), Workorder(), Workorder_List()];

  @override
  void initState() {
    setState(() {
      user = int.parse(services.user).toString();
      plant = int.parse(services.plan).toString();
      grp = services.grp;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent, // navigation bar color
      statusBarColor: Color(0xff2A2441),
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light, // status bar color
    ));
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        bottomOpacity: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff2A2441),
        brightness: Brightness.light,
        toolbarHeight: 100.0,
        flexibleSpace: Container(
          margin: EdgeInsets.only(top: 40),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.account_circle,
                size: 60,
                color: Colors.white,
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user,
                    style: GoogleFonts.titilliumWeb(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Group: $plant | Plant: $grp',
                    style: GoogleFonts.titilliumWeb(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 20, top: 10),
            child: IconButton(
              icon: Icon(
                Icons.logout_outlined,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (Route<dynamic> route) => false);
              },
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
              top: -1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 2,
                color: Color(0xff2A2441),
              )),
          Container(
            margin: EdgeInsets.only(bottom: 0),
            padding: EdgeInsets.only(bottom: 0),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Color(0xff2A2441),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0)),
            ),
            child: IndexedStack(
              index: selectedIndex,
              children: screens,
            ),
          ),
          Positioned(
              bottom: -1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 2,
                color: Colors.white,
              )),
        ],
      ),
      bottomNavigationBar: Stack(
        children: [
          CurvedNavigationBar(
            color: Color(0xff2A2441),
            height: 55.0,
            backgroundColor: Colors.white,
            animationDuration: Duration(milliseconds: 200),
            animationCurve: Curves.fastOutSlowIn,
            index: 2,
            items: <Widget>[
              Icon(Icons.edit_notifications_outlined,
                  size: 20,
                  color: selectedIndex == 0 ? Colors.white : Colors.white38),
              Icon(Icons.checklist_outlined,
                  size: 20,
                  color: selectedIndex == 1 ? Colors.white : Colors.white38),
              Icon(Icons.dashboard_customize_outlined,
                  color: selectedIndex == 2 ? Colors.white : Colors.white38),
              Icon(Icons.workspaces_outlined,
                  size: 20,
                  color: selectedIndex == 3 ? Colors.white : Colors.white38),
              Icon(Icons.sync_alt_outlined,
                  size: 20,
                  color: selectedIndex == 4 ? Colors.white : Colors.white38),
            ],
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        ],
      ),
    );
  }
}
