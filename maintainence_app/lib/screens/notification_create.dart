import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/services.dart' as services;

class Create extends StatefulWidget {
  const Create({Key? key}) : super(key: key);

  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> with TickerProviderStateMixin {
  var res;
  bool spin = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: spin
            ? Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SpinKitCubeGrid(
                      color: Colors.deepPurple[400],
                      size: 75,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Loading...',
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.purple[900]),
                    ),
                  ],
                ))
            : Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create Notification',
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(14, 14, 14, .9),
                      ),
                    ),
                    SizedBox(height: 20),
                    NotificationListener<OverscrollIndicatorNotification>(
                        onNotification:
                            (OverscrollIndicatorNotification overscroll) {
                          overscroll.disallowGlow();
                          return true;
                        },
                        child: CreateNotificationForm()),
                  ],
                ),
              ),
      ),
    );
  }
}

class CreateNotificationForm extends StatefulWidget {
  const CreateNotificationForm({Key? key}) : super(key: key);

  @override
  _CreateNotificationFormState createState() => _CreateNotificationFormState();
}

class _CreateNotificationFormState extends State<CreateNotificationForm> {

  late FlutterLocalNotificationsPlugin localNoitificaion =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    var androidInitialize = new AndroidInitializationSettings("app_icon");
    var iosInitialize = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        android: androidInitialize, iOS: iosInitialize);
    localNoitificaion = new FlutterLocalNotificationsPlugin();
    localNoitificaion.initialize(initializationSettings);
    super.initState();
  }

  Future _showNotification(_title, _body) async {
    var androidDetails = new AndroidNotificationDetails(
        'channelId', 'channelName', 'channelDescription',
        importance: Importance.max);
    var iosDetails = new IOSNotificationDetails();
    var generalNotificationDetails =
        new NotificationDetails(android: androidDetails, iOS: iosDetails);
    await localNoitificaion.show(
        0, 'Notification Created: $_title', 'Equipment ID: $_body', generalNotificationDetails);
  }

  final _formKey = GlobalKey<FormState>();
  final equipment_id = TextEditingController();
  final notification_type = TextEditingController();
  final plan_group = TextEditingController();
  final plan_plant = TextEditingController();
  final priority = TextEditingController();
  final reported_by = TextEditingController();
  final req_end_date = TextEditingController();
  final req_start_date = TextEditingController();
  final short_text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              _equipment_id(),
              SizedBox(height: 20),
              _notif_type(),
              SizedBox(height: 20),
              _plan_grp(),
              SizedBox(height: 20),
              _plan_plant(),
              SizedBox(height: 20),
              _priority(),
              SizedBox(height: 20),
              _reported_by(),
              SizedBox(height: 20),
              _start_date(),
              SizedBox(height: 20),
              _end_date(),
              SizedBox(height: 20),
              _short_text(),
              SizedBox(height: 20),
              _create_button(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Future notificationSelected(String payload) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Notification : $payload"),
      ),
    );
  }

  Widget _equipment_id() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is empty';
        }
        equipment_id.text = value.toString();
      },
      style: TextStyle(
        color: Colors.black87,
      ),
      decoration: InputDecoration(
        helperText: 'Ex. 0001',
        helperStyle: TextStyle(color: Colors.black54, fontSize: 12),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 2.3,
              color: Color.fromRGBO(101, 63, 244, .5),
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 2.3,
              color: Color.fromRGBO(101, 63, 244, .5),
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 2.3,
              color: Colors.red,
            )),
        hintText: 'Equipment ID',
        hintStyle: TextStyle(
            color: Colors.black45, fontSize: 14.0, fontWeight: FontWeight.w600),
      ),
      cursorColor: Colors.black87,
    );
  }

  Widget _notif_type() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is empty';
        }
        notification_type.text = value.toString();
      },
      style: TextStyle(
        color: Colors.black87,
      ),
      decoration: InputDecoration(
        helperText: 'Ex. M1',
        helperStyle: TextStyle(color: Colors.black54, fontSize: 12),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 2.3,
              color: Color.fromRGBO(101, 63, 244, .5),
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 2.3,
              color: Color.fromRGBO(101, 63, 244, .5),
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 2.3,
              color: Colors.red,
            )),
        hintText: 'Notification Type',
        hintStyle: TextStyle(
            color: Colors.black45, fontSize: 14.0, fontWeight: FontWeight.w600),
      ),
      cursorColor: Colors.black87,
    );
  }

  Widget _plan_grp() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is empty';
        }
        plan_group.text = value.toString();
      },
      style: TextStyle(
        color: Colors.black87,
      ),
      decoration: InputDecoration(
        helperText: 'Ex. 010',
        helperStyle: TextStyle(color: Colors.black54, fontSize: 12),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 2.3,
              color: Color.fromRGBO(101, 63, 244, .5),
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 2.3,
              color: Color.fromRGBO(101, 63, 244, .5),
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 2.3,
              color: Colors.red,
            )),
        hintText: 'Group',
        hintStyle: TextStyle(
            color: Colors.black45, fontSize: 14.0, fontWeight: FontWeight.w600),
      ),
      cursorColor: Colors.black87,
    );
  }

  Widget _plan_plant() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is empty';
        }
        plan_plant.text = value.toString();
      },
      style: TextStyle(
        color: Colors.black87,
      ),
      decoration: InputDecoration(
        helperText: 'Ex. SA01',
        helperStyle: TextStyle(color: Colors.black54, fontSize: 12),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 2.3,
              color: Color.fromRGBO(101, 63, 244, .5),
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 2.3,
              color: Color.fromRGBO(101, 63, 244, .5),
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 2.3,
              color: Colors.red,
            )),
        hintText: 'Plant',
        hintStyle: TextStyle(
            color: Colors.black45, fontSize: 14.0, fontWeight: FontWeight.w600),
      ),
      cursorColor: Colors.black87,
    );
  }

  Widget _priority() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is empty';
        }
        priority.text = value.toString();
      },
      style: TextStyle(
        color: Colors.black87,
      ),
      decoration: InputDecoration(
        helperText: 'Ex. 1',
        helperStyle: TextStyle(color: Colors.black54, fontSize: 12),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 2.3,
              color: Color.fromRGBO(101, 63, 244, .5),
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 2.3,
              color: Color.fromRGBO(101, 63, 244, .5),
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 2.3,
              color: Colors.red,
            )),
        hintText: 'Priority',
        hintStyle: TextStyle(
            color: Colors.black45, fontSize: 14.0, fontWeight: FontWeight.w600),
      ),
      cursorColor: Colors.black87,
    );
  }

  Widget _reported_by() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is empty';
        }
        reported_by.text = value.toString();
      },
      style: TextStyle(
        color: Colors.black87,
      ),
      decoration: InputDecoration(
        helperText: 'Ex. TBD',
        helperStyle: TextStyle(color: Colors.black54, fontSize: 12),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 2.3,
              color: Color.fromRGBO(101, 63, 244, .5),
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 2.3,
              color: Color.fromRGBO(101, 63, 244, .5),
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 2.3,
              color: Colors.red,
            )),
        hintText: 'Reported By',
        hintStyle: TextStyle(
            color: Colors.black45, fontSize: 14.0, fontWeight: FontWeight.w600),
      ),
      cursorColor: Colors.black87,
    );
  }

  Widget _start_date() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is empty';
        }
        String k = value.split('/').reversed.join('');
        req_start_date.text = k.toString();
      },
      style: TextStyle(
        color: Colors.black87,
      ),
      decoration: InputDecoration(
        helperText: 'DD/MM/YYYY',
        helperStyle: TextStyle(color: Colors.black54, fontSize: 12),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 2.3,
              color: Color.fromRGBO(101, 63, 244, .5),
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 2.3,
              color: Color.fromRGBO(101, 63, 244, .5),
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 2.3,
              color: Colors.red,
            )),
        hintText: 'Start Date',
        hintStyle: TextStyle(
            color: Colors.black45, fontSize: 14.0, fontWeight: FontWeight.w600),
      ),
      cursorColor: Colors.black87,
    );
  }

  Widget _end_date() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is empty';
        }
        String k = value.split('/').reversed.join('');
        req_end_date.text = k.toString();
      },
      style: TextStyle(
        color: Colors.black87,
      ),
      decoration: InputDecoration(
        helperText: 'DD/MM/YYYY',
        helperStyle: TextStyle(color: Colors.black54, fontSize: 12),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 2.3,
              color: Color.fromRGBO(101, 63, 244, .5),
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 2.3,
              color: Color.fromRGBO(101, 63, 244, .5),
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 2.3,
              color: Colors.red,
            )),
        hintText: 'End Date',
        hintStyle: TextStyle(
            color: Colors.black45, fontSize: 14.0, fontWeight: FontWeight.w600),
      ),
      cursorColor: Colors.black87,
    );
  }

  Widget _short_text() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is empty';
        }
        short_text.text = value.toString();
      },
      style: TextStyle(
        color: Colors.black87,
      ),
      decoration: InputDecoration(
        helperText: 'Ex. Broken Pipe',
        helperStyle: TextStyle(color: Colors.black54, fontSize: 12),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 2.3,
              color: Color.fromRGBO(101, 63, 244, .5),
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 2.3,
              color: Color.fromRGBO(101, 63, 244, .5),
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 2.3,
              color: Colors.red,
            )),
        hintText: 'Short Description',
        hintStyle: TextStyle(
            color: Colors.black45, fontSize: 14.0, fontWeight: FontWeight.w600),
      ),
      cursorColor: Colors.black87,
    );
  }

  Widget _create_button() {
    return Container(
      height: 43,
      width: MediaQuery.of(context).size.width * 0.43,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            pushNotification();
          }
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.deepPurple[900],
            onPrimary: Colors.white54,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0))),
        child: Text(
          'Create',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Future pushNotification() async {
    // ignore: unused_local_variable
    var res = await services.pushNotificationCreate(
      equipment_id.text,
      notification_type.text,
      plan_group.text,
      plan_plant.text,
      priority.text,
      reported_by.text,
      req_end_date.text,
      req_start_date.text,
      short_text.text,
    );
    if (res != null) {
      _showNotification(short_text.text, equipment_id.text );
    }
  }

  dialog(BuildContext context, _message, _id) {
    bool done = false;
    if (_message != '') {
      setState(() {
        done = true;
      });
    }
    return showDialog(
      context: context,
      builder: (_) {
        if (done == false) {
          return AlertDialog(
            title: Row(
              children: [
                Text('Notification Created',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepPurple[900],
                    ),
                    textAlign: TextAlign.center),
                SizedBox(width: 10),
                Icon(
                  Icons.cloud_done_outlined,
                  color: Colors.purple[900],
                  size: 25,
                ),
              ],
            ),
            content: Text(
              'Notification ID: $_message \n Content ID: $_id',
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.deepPurple[900],
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
          );
        } else {
          return AlertDialog(
            title: Text('Processing',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepPurple[900],
                ),
                textAlign: TextAlign.center),
            content: SizedBox(
              width: 30,
              height: 25,
              child: SpinKitThreeBounce(
                color: Colors.deepPurple[700],
                size: 25,
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, true), // passing true
                child: Text(
                  'Close',
                  style: TextStyle(
                    color: Colors.deepPurple[900],
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          );
        }
      },
      barrierDismissible: false,
    );
  }
}
