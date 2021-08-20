import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/services.dart' as services;

class Workorder extends StatefulWidget {
  const Workorder({Key? key}) : super(key: key);

  @override
  _WorkorderState createState() => _WorkorderState();
}

class _WorkorderState extends State<Workorder>with TickerProviderStateMixin {
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
                      'Create Workorder',
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
  final _formKey = GlobalKey<FormState>();
  final wo_description = TextEditingController();
  final equipment_id = TextEditingController();
  final material_number = TextEditingController();
  final notification_type = TextEditingController();
  final order_type = TextEditingController();
  final person_number = TextEditingController();
  final priority = TextEditingController();

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
        0, 'Notification Created: $_body', 'Equipment ID: $_title', generalNotificationDetails);
  }

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
              _wo_description(),
              SizedBox(height: 20),
              _material_no(),
              SizedBox(height: 20),
              _not_type(),
              SizedBox(height: 20),
              _priority(),
              SizedBox(height: 20),
              _order_type(),
              SizedBox(height: 20),
              _person_no(),
              SizedBox(height: 20),
              _create_button(),
              SizedBox(height: 20),
            ],
          ),
        ),
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
        helperText: 'Ex. AA000007',
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

  Widget _wo_description() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is empty';
        }
        wo_description.text = value.toString();
      },
      style: TextStyle(
        color: Colors.black87,
      ),
      decoration: InputDecoration(
        helperText: 'Ex. Tseting',
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
        hintText: 'Description',
        hintStyle: TextStyle(
            color: Colors.black45, fontSize: 14.0, fontWeight: FontWeight.w600),
      ),
      cursorColor: Colors.black87,
    );
  }

  Widget _material_no() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is empty';
        }
        material_number.text = value.toString();
      },
      style: TextStyle(
        color: Colors.black87,
      ),
      decoration: InputDecoration(
        helperText: 'Ex. 18',
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
        hintText: 'Material Number',
        hintStyle: TextStyle(
            color: Colors.black45, fontSize: 14.0, fontWeight: FontWeight.w600),
      ),
      cursorColor: Colors.black87,
    );
  }

  Widget _not_type() {
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
        helperText: 'Ex. 2',
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

  Widget _order_type() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is empty';
        }
        order_type.text = value.toString();
      },
      style: TextStyle(
        color: Colors.black87,
      ),
      decoration: InputDecoration(
        helperText: 'Ex. PM01',
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
        hintText: 'Order Type',
        hintStyle: TextStyle(
            color: Colors.black45, fontSize: 14.0, fontWeight: FontWeight.w600),
      ),
      cursorColor: Colors.black87,
    );
  }

  Widget _person_no() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is empty';
        }
        person_number.text = value;
      },
      style: TextStyle(
        color: Colors.black87,
      ),
      decoration: InputDecoration(
        helperText: 'Ex. 5015',
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
        hintText: 'Created By',
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
            pushCreateNotification();
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

  Future pushCreateNotification() async {
    var res = await services.pushWorkNotificationCreate(
      wo_description.text,
      equipment_id.text,
      material_number.text,
      notification_type.text,
      priority.text,
      order_type.text,
      person_number.text,
    );
    if (res != null) {
      dialog(context, res[0], res[1]);
      if (res != null) {
      _showNotification(equipment_id.text, wo_description.text );
    }
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
                Text('Workorder Created',
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
