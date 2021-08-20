import 'package:flutter/material.dart';
import 'package:maintainence_app/Utils/data.dart';

class Notification_all_details extends StatelessWidget {
  const Notification_all_details({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notif = ModalRoute.of(context)?.settings.arguments
        as Notification_all_data;

    var notif_id = int.parse(notif.notif_number.toString()).toString();
    var eqp_id = int.parse(notif.equipment.toString()).toString();
    var created = notif.notification_date.toString();
    var complete =notif.completion_date.toString();
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
                    'Notification ID',
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
                    'Notification Type',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                  subtitle: Text(
                    notif.notif_type! as dynamic,
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
                    'Notification Description',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                  subtitle: Text(
                    notif.notif_description! as dynamic,
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
                    eqp_id as dynamic,
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
                    'Equpiment Description',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                  subtitle: Text(
                    notif.equip_description! as dynamic,
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
                    'Created Date',
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
                    'Completion Date',
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
                    'Created Time',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                  subtitle: Text(
                    notif.notif_time! as dynamic,
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
                    'Priority Type',
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