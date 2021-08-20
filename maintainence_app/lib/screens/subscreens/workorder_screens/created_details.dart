import 'package:flutter/material.dart';
import 'package:maintainence_app/Utils/data.dart';

class Workorder_completed_details extends StatelessWidget {
  const Workorder_completed_details({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final notif = ModalRoute.of(context)?.settings.arguments as Workorder_data;
      var notif_id = int.parse(notif.workorder_id.toString()).toString();
    var created = notif.actual_start_date.toString();
    var complete =notif.actual_finish_date.toString();
    created = created.split('-').reversed.join('/');
    complete = complete.split('-').reversed.join('/');

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff2A2441),
        body: Container(
          child: ListView(
            padding: EdgeInsets.all(20),
            children: ListTile.divideTiles(
              context: context,
              tiles: [
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  tileColor: Colors.white,
                  title: Text(
                    'Workorder ID',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                  subtitle: Text(
                    notif_id as dynamic,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.deepPurple[900],
                    ),
                  ),
                  leading: SizedBox(
                    width: 40,
                    child: Row(
                      children: [
                        Icon(Icons.notifications, color: Colors.deepPurple),
                        SizedBox(
                          width: 12,
                          height: MediaQuery.of(context).size.height,
                        ),
                        Container(
                          height: 35,
                          // margin: EdgeInsets.only(top: 12),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 3.0, color: Colors.amber))),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 14),
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  tileColor: Colors.white,
                  title: Text(
                    'Work Center',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                  subtitle: Text(
                    notif.work_center! as dynamic,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.deepPurple[900],
                    ),
                  ),
                  leading: SizedBox(
                    width: 40,
                    child: Row(
                      children: [
                        Icon(Icons.notifications, color: Colors.deepPurple),
                        SizedBox(
                          width: 12,
                          height: MediaQuery.of(context).size.height,
                        ),
                        Container(
                          height: 35,
                          // margin: EdgeInsets.only(top: 12),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 3.0, color: Colors.amber))),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 14),
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  tileColor: Colors.white,
                  title: Text(
                    'Workorder Description',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                  subtitle: Text(
                    notif.wo_description! as dynamic,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.deepPurple[900],
                    ),
                  ),
                  leading: SizedBox(
                    width: 40,
                    child: Row(
                      children: [
                        Icon(Icons.notifications, color: Colors.deepPurple),
                        SizedBox(
                          width: 12,
                          height: MediaQuery.of(context).size.height,
                        ),
                        Container(
                          height: 35,
                          // margin: EdgeInsets.only(top: 12),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 3.0, color: Colors.amber))),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 14),
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  tileColor: Colors.white,
                  title: Text(
                    'Start Date',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                  subtitle: Text(
                    created as dynamic,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.deepPurple[900],
                    ),
                  ),
                  leading: SizedBox(
                    width: 40,
                    child: Row(
                      children: [
                        Icon(Icons.notifications, color: Colors.deepPurple),
                        SizedBox(
                          width: 12,
                          height: MediaQuery.of(context).size.height,
                        ),
                        Container(
                          height: 35,
                          // margin: EdgeInsets.only(top: 12),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 3.0, color: Colors.amber))),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 14),
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  tileColor: Colors.white,
                  title: Text(
                    'End Date',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                  subtitle: Text(
                    complete as dynamic,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.deepPurple[900],
                    ),
                  ),
                  leading: SizedBox(
                    width: 40,
                    child: Row(
                      children: [
                        Icon(Icons.notifications, color: Colors.deepPurple),
                        SizedBox(
                          width: 12,
                          height: MediaQuery.of(context).size.height,
                        ),
                        Container(
                          height: 35,
                          // margin: EdgeInsets.only(top: 12),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 3.0, color: Colors.amber))),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 14),
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  tileColor: Colors.white,
                  title: Text(
                    'Currency',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                  subtitle: Text(
                    notif.currency! as dynamic,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.deepPurple[900],
                    ),
                  ),
                  leading: SizedBox(
                    width: 40,
                    child: Row(
                      children: [
                        Icon(Icons.notifications, color: Colors.deepPurple),
                        SizedBox(
                          width: 12,
                          height: MediaQuery.of(context).size.height,
                        ),
                        Container(
                          height: 35,
                          // margin: EdgeInsets.only(top: 12),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 3.0, color: Colors.amber))),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 14),
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  tileColor: Colors.white,
                  title: Text(
                    'Functional Location',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                  subtitle: Text(
                    notif.functional_location! as dynamic,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.deepPurple[900],
                    ),
                  ),
                  leading: SizedBox(
                    width: 40,
                    child: Row(
                      children: [
                        Icon(Icons.notifications, color: Colors.deepPurple),
                        SizedBox(
                          width: 12,
                          height: MediaQuery.of(context).size.height,
                        ),
                        Container(
                          height: 35,
                          // margin: EdgeInsets.only(top: 12),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 3.0, color: Colors.amber))),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 14),
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  tileColor: Colors.white,
                  title: Text(
                    'Created By',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                  subtitle: Text(
                    notif.person_number as dynamic,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.deepPurple[900],
                    ),
                  ),
                  leading: SizedBox(
                    width: 40,
                    child: Row(
                      children: [
                        Icon(Icons.notifications, color: Colors.deepPurple),
                        SizedBox(
                          width: 12,
                          height: MediaQuery.of(context).size.height,
                        ),
                        Container(
                          height: 35,
                          // margin: EdgeInsets.only(top: 12),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 3.0, color: Colors.amber))),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 14),
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  tileColor: Colors.white,
                  title: Text(
                    'Equipment ID',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                  subtitle: Text(
                    notif.equipment_number as dynamic,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.deepPurple[900],
                    ),
                  ),
                  leading: SizedBox(
                    width: 40,
                    child: Row(
                      children: [
                        Icon(Icons.notifications, color: Colors.deepPurple),
                        SizedBox(
                          width: 12,
                          height: MediaQuery.of(context).size.height,
                        ),
                        Container(
                          height: 35,
                          // margin: EdgeInsets.only(top: 12),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 3.0, color: Colors.amber))),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 14),
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  tileColor: Colors.white,
                  title: Text(
                    'Equipment Description',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                  subtitle: Text(
                    notif.equipment_description as dynamic,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.deepPurple[900],
                    ),
                  ),
                  leading: SizedBox(
                    width: 40,
                    child: Row(
                      children: [
                        Icon(Icons.notifications, color: Colors.deepPurple),
                        SizedBox(
                          width: 12,
                          height: MediaQuery.of(context).size.height,
                        ),
                        Container(
                          height: 35,
                          // margin: EdgeInsets.only(top: 12),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 3.0, color: Colors.amber))),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 14),
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  tileColor: Colors.white,
                  title: Text(
                    'Priority',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                  subtitle: Text(
                    notif.priority_type as dynamic,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.deepPurple[900],
                    ),
                  ),
                  leading: SizedBox(
                    width: 40,
                    child: Row(
                      children: [
                        Icon(Icons.notifications, color: Colors.deepPurple),
                        SizedBox(
                          width: 12,
                          height: MediaQuery.of(context).size.height,
                        ),
                        Container(
                          height: 35,
                          // margin: EdgeInsets.only(top: 12),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 3.0, color: Colors.amber))),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 14),
                ],
            ).toList(),
          ),
        ),
      ),
    );
  }
}
