import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maintainence_app/screens/dashboard.dart';
// import 'package:maintainence_app/screens/dashboard.dart';
import '../../../models/services.dart' as services;

class Notification_edit extends StatefulWidget {
  const Notification_edit({Key? key}) : super(key: key);

  @override
  _Notification_editState createState() => _Notification_editState();
}

class _Notification_editState extends State<Notification_edit> {
  var res;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child:Container(
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Edit Notification',
                        style: GoogleFonts.montserrat(
                          fontSize: 24,
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
  final equipment_id = TextEditingController();
  final notification_number = TextEditingController();
  final priority = TextEditingController();
  final req_end_date = TextEditingController();
  final req_start_date = TextEditingController();
  final short_text = TextEditingController();

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
              _notification_id(),
              SizedBox(height: 20),
              _priority(),
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

  Widget _notification_id() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is empty';
        }
        notification_number.text = value.toString();
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
        hintText: 'Notification ID',
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
    var res = await services.getNotifEditResponse(
      equipment_id.text,
      notification_number.text,
      priority.text,
      req_end_date.text,
      req_start_date.text,
      short_text.text,
    );

    if (res != null) {
      dialog(context, res[0], res[1]);
    }
  }

  dialog(BuildContext context, _message, _id) {
    return showDialog(
      context: context,
      builder: (_) {
          return AlertDialog(
            title: Row(
              children: [
                Text('Notification ',
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
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                Dashboard()), (Route<dynamic> route) => false),
                child: Text(
                  'Close',
                  style: TextStyle(
                    color: Colors.deepPurple[900],
                    fontSize: 14,
                  ),
                ),
              ),
            ],
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            );
      },
      barrierDismissible: false,
    );
  }
}
