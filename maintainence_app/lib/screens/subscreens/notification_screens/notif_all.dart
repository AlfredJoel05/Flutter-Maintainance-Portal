import 'package:flutter/material.dart';
import 'package:maintainence_app/Utils/data.dart';
import '../../../models/services.dart' as services;
import 'all.dart';

class Notif_All extends StatefulWidget {
  const Notif_All({ Key? key }) : super(key: key);

  @override
  _Notif_AllState createState() => _Notif_AllState();
}

class _Notif_AllState extends State<Notif_All> {
  List<Notification_all_data> data = [];
  Future getData() async {
    data = await services.All_Notif();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowGlow();
        return true;
      },
      child: Notifications(),
    );
  }

  FutureBuilder<dynamic> Notifications() {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return Scrollbar(
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, i) {
                    return Container(
                      alignment: Alignment.center,
                      height: 100,
                      child: Card(
                        color: Color(0xff653ff4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 2.0,
                        shadowColor: Colors.black,
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(bottom: 20),
                          child: ListTile(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Notification_all_details(),
                                    settings: RouteSettings(
                                      arguments: data[i],
                                    ),  
                                  ),
                              );
                            },
                            onLongPress: (){},
                            isThreeLine: false,
                            visualDensity:
                                VisualDensity(horizontal: 0, vertical: 3.0),
                            leading: Container(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: Icon(
                                Icons.notifications,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            trailing: Container(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                            ),
                            title: Text(
                              "${((snapshot.data as dynamic)[i].notif_number)?.toString() ?? "its null"}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17.0),
                            ),
                            subtitle: Text(
                              "${(snapshot.data as dynamic)[i].notif_description}",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                              // maxLines: 2,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            );
          } else {
            return Text(
              'Unable to load data'
            );
          }
        });
  }

  @override
  void dispose() {
    getData();
    super.dispose();
  }

}