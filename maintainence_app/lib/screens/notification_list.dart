import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:maintainence_app/screens/subscreens/notification_screens/notif_all.dart';
import 'package:maintainence_app/screens/subscreens/notification_screens/notif_completed.dart';
import '../models/services.dart' as services;
import 'subscreens/notification_screens/notif_out.dart';
import 'subscreens/notification_screens/notif_process.dart';

class View extends StatefulWidget {
  const View({Key? key}) : super(key: key);

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  int selectedIndex = 0;
  var res;
  bool spin = true;
  final notif_screens = [
    Notif_Completed(),
    Notif_All(),
    Notif_Outstanding(),
    Notification_process(),
  ];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    res = await services.getNotificationList();
    if (res == 'S') {
      setState(() {
        spin = !spin;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              scrollDirection: Axis.horizontal,
              children: [
                Material(
                  elevation: 0.0,
                  shadowColor: Colors.black,
                  color: selectedIndex == 0 ? Colors.purple[900] : Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.purple.shade900, width: 1.5),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    borderRadius: BorderRadius.circular(30),
                    splashColor: Colors.white70,
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      height: 35,
                      child: Text(
                        'Completed',
                        style: TextStyle(
                            color: selectedIndex == 0
                                ? Colors.white
                                : Colors.purple[900],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 14),
                Material(
                  elevation: 0.0,
                  shadowColor: Colors.black,
                  color: selectedIndex == 1 ? Colors.purple[900] : Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.purple.shade900, width: 1.5),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    borderRadius: BorderRadius.circular(30),
                    splashColor: Colors.white70,
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 23),
                      height: 35,
                      child: Text(
                        'All',
                        style: TextStyle(
                            color: selectedIndex == 1
                                ? Colors.white
                                : Colors.purple[900],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 14),
                Material(
                  elevation: 0.0,
                  shadowColor: Colors.black,
                  color: selectedIndex == 2 ? Colors.purple[900] : Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.purple.shade900, width: 1.5),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                        // print(selectedIndex);
                      });
                    },
                    borderRadius: BorderRadius.circular(30),
                    splashColor: Colors.white70,
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      height: 35,
                      child: Text(
                        'Outstanding',
                        style: TextStyle(
                            color: selectedIndex == 2
                                ? Colors.white
                                : Colors.purple[900],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 14),
                Material(
                  elevation: 0.0,
                  shadowColor: Colors.black,
                  color: selectedIndex == 3 ? Colors.purple[900] : Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.purple.shade900, width: 1.5),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 3;
                        // print(selectedIndex);
                      });
                    },
                    borderRadius: BorderRadius.circular(30),
                    splashColor: Colors.white70,
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      height: 35,
                      child: Text(
                        'Processing',
                        style: TextStyle(
                            color: selectedIndex == 3
                                ? Colors.white
                                : Colors.purple[900],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
        
              ],
            ),
          ),
        ),
        body: spin
            ? Center(
                child: SpinKitCubeGrid(
                  color: Colors.deepPurple[400],
                  size: 75,
                ),
              )
            : IndexedStack(
                index: selectedIndex,
                children: notif_screens,
              ),
      ),
    );
  }
}
