import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:maintainence_app/Utils/data.dart';

String user = '';
String plan = '';
String grp = '';

// Notification Lists
final List<Notification_completed_data> completedData = [];
final List<Notification_data> outstandingData = [];
final List<Notification_all_data> allData = [];
final List<Notification_data> processData = [];

// Workorder Lists
final List<Workorder_data> wo_created = [];
final List<Workorder_data> wo_released = [];
final List<Workorder_data> wo_completed = [];

Future getLoginResponse(_email, _password) async {
  var response = await http.post(
    Uri.http('192.168.0.115:3000', 'mplogin'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': _email.text,
      'password': _password.text,
    }),
  );
  var jsonData = jsonDecode(response.body);
  var result = jsonData['SOAP:Envelope']['SOAP:Body']
      ['ns0:ZFM_MP_MLOGIN.Response']['RETURN_TYPE']['_text'];
  if (result == 'SUCCESS') {
    user = jsonData['SOAP:Envelope']['SOAP:Body']['ns0:ZFM_MP_MLOGIN.Response']
        ['E_EMP_ID']['_text'];
    plan = jsonData['SOAP:Envelope']['SOAP:Body']['ns0:ZFM_MP_MLOGIN.Response']
        ['PLANNER_GROUP']['_text'];
    grp = jsonData['SOAP:Envelope']['SOAP:Body']['ns0:ZFM_MP_MLOGIN.Response']
        ['PLANNING_PLANT']['_text'];
  }
  return result;
}

Future getNotificationList() async {
  var response = await http.post(
    Uri.http('192.168.0.115:3000', 'not_list'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'plant': plan,
      'grp': grp,
    }),
  );
  var jsonData = jsonDecode(response.body);
  var result = jsonData['SOAP:Envelope']['SOAP:Body']
      ['ns0:ZFM_MP_NOTIFICATION_LIST_AJ.Response']['RETURN']['TYPE']['_text'];
  if (result == 'S') {
    // COMPLETED
    var NOTIFICATION_NOCO = jsonData['SOAP:Envelope']['SOAP:Body']
        ['ns0:ZFM_MP_NOTIFICATION_LIST_AJ.Response']['E_NOT_NOCO']['item'];
    for (var n = 3; n < NOTIFICATION_NOCO.length; n++) {
      Notification_completed_data notification = Notification_completed_data(
        NOTIFICATION_NOCO[n]['NOTIFICAT']['_text'].toString(),
        NOTIFICATION_NOCO[n]['NOTIF_TYPE']['_text'].toString(),
        NOTIFICATION_NOCO[n]['EQUIPMENT']['_text'].toString(),
        NOTIFICATION_NOCO[n]['DESCRIPT']['_text'].toString(),
        NOTIFICATION_NOCO[n]['S_STATUS']['_text'].toString(),
        NOTIFICATION_NOCO[n]['EQUIDESCR']['_text'].toString(),
        NOTIFICATION_NOCO[n]['NOTIFDATE']['_text'].toString(),
        NOTIFICATION_NOCO[n]['NOTIFTIME']['_text'].toString(),
        NOTIFICATION_NOCO[n]['PRIOTYPE']['_text'].toString(),
        NOTIFICATION_NOCO[n]['PRIORITY']['_text'].toString(),
        NOTIFICATION_NOCO[n]['COMPLETION']['_text'].toString(),
        NOTIFICATION_NOCO[n]['STARTDATE']['_text'].toString(),
        NOTIFICATION_NOCO[n]['ENDDATE']['_text'].toString(),
      );
      completedData.add(notification);
    }
    // OUTSTANDING
    var NOTIFICATION_OSNO = jsonData['SOAP:Envelope']['SOAP:Body']
        ['ns0:ZFM_MP_NOTIFICATION_LIST_AJ.Response']['E_NOT_OSNO']['item'];
    for (var n = 3; n < NOTIFICATION_OSNO.length; n++) {
      Notification_data notification = Notification_data(
        NOTIFICATION_OSNO[n]['NOTIFICAT']['_text'].toString(),
        NOTIFICATION_OSNO[n]['NOTIF_TYPE']['_text'].toString(),
        NOTIFICATION_OSNO[n]['EQUIPMENT']['_text'].toString(),
        NOTIFICATION_OSNO[n]['DESCRIPT']['_text'].toString(),
        NOTIFICATION_OSNO[n]['FUNCLOC']['_text'].toString(),
        NOTIFICATION_OSNO[n]['EQUIDESCR']['_text'].toString(),
        NOTIFICATION_OSNO[n]['NOTIFDATE']['_text'].toString(),
        NOTIFICATION_OSNO[n]['NOTIFTIME']['_text'].toString(),
        NOTIFICATION_OSNO[n]['PRIOTYPE']['_text'].toString(),
        NOTIFICATION_OSNO[n]['PRIORITY']['_text'].toString(),
        NOTIFICATION_OSNO[n]['COMPLETION']['_text'].toString(),
        NOTIFICATION_OSNO[n]['STARTDATE']['_text'].toString(),
        NOTIFICATION_OSNO[n]['ENDDATE']['_text'].toString(),
      );
      outstandingData.add(notification);
    }

    // ALL NOTIFICATIONS
    var NOTIFICATION_ALL = jsonData['SOAP:Envelope']['SOAP:Body']
        ['ns0:ZFM_MP_NOTIFICATION_LIST_AJ.Response']['NOT_LIST']['item'];
    for (var n = 3; n < NOTIFICATION_ALL.length; n++) {
      Notification_all_data notification = Notification_all_data(
        NOTIFICATION_ALL[n]['NOTIFICAT']['_text'].toString(),
        NOTIFICATION_ALL[n]['NOTIF_TYPE']['_text'].toString(),
        NOTIFICATION_ALL[n]['EQUIPMENT']['_text'].toString(),
        NOTIFICATION_ALL[n]['DESCRIPT']['_text'].toString(),
        NOTIFICATION_ALL[n]['FUNCLOC']['_text'].toString(),
        NOTIFICATION_ALL[n]['EQUIDESCR']['_text'].toString(),
        NOTIFICATION_ALL[n]['NOTIFDATE']['_text'].toString(),
        NOTIFICATION_ALL[n]['NOTIFTIME']['_text'].toString(),
        NOTIFICATION_ALL[n]['PRIOTYPE']['_text'].toString(),
        NOTIFICATION_ALL[n]['PRIORITY']['_text'].toString(),
        NOTIFICATION_ALL[n]['COMPLETION']['_text'].toString(),
        NOTIFICATION_ALL[n]['STARTDATE']['_text'].toString(),
        NOTIFICATION_ALL[n]['ENDDATE']['_text'].toString(),
      );
      allData.add(notification);
    }

    // PROCESS NOTIFICATIONS
    var NOTIFICATION_NOPR = jsonData['SOAP:Envelope']['SOAP:Body']
        ['ns0:ZFM_MP_NOTIFICATION_LIST_AJ.Response']['E_NOT_NOPR']['item'];
    for (var n = 3; n < NOTIFICATION_NOPR.length; n++) {
      Notification_data notification = Notification_data(
        NOTIFICATION_NOPR[n]['NOTIFICAT']['_text'].toString(),
        NOTIFICATION_NOPR[n]['NOTIF_TYPE']['_text'].toString(),
        NOTIFICATION_NOPR[n]['EQUIPMENT']['_text'].toString(),
        NOTIFICATION_NOPR[n]['DESCRIPT']['_text'].toString(),
        NOTIFICATION_NOPR[n]['FUNCLOC']['_text'].toString(),
        NOTIFICATION_NOPR[n]['EQUIDESCR']['_text'].toString(),
        NOTIFICATION_NOPR[n]['NOTIFDATE']['_text'].toString(),
        NOTIFICATION_NOPR[n]['NOTIFTIME']['_text'].toString(),
        NOTIFICATION_NOPR[n]['PRIOTYPE']['_text'].toString(),
        NOTIFICATION_NOPR[n]['PRIORITY']['_text'].toString(),
        NOTIFICATION_NOPR[n]['COMPLETION']['_text'].toString(),
        NOTIFICATION_NOPR[n]['STARTDATE']['_text'].toString(),
        NOTIFICATION_NOPR[n]['ENDDATE']['_text'].toString(),
      );
      processData.add(notification);
    }
  }
  print('Service: $result');
  return result;
}

Future pushNotificationCreate(equipment, notif_type, plan_grp, plan_plant,
    priority, reported, end_date, start_date, des) async {
  var response = await http.post(
    Uri.http('192.168.0.115:3000', 'not_create'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'equipment_id': equipment,
      'notification_type': notif_type,
      'plan_group': '010',
      'plan_plant': 'SA01',
      'priority': priority,
      'reported_by': reported,
      'req_end_date': end_date,
      'req_start_date': start_date,
      'short_text': des,
    }),
  );
  var jsonData = jsonDecode(response.body);
  var result = jsonData['SOAP:Envelope']['SOAP:Body']
      ['ns0:ZFM_MP_NOTIFICATION_CREATE_AJ.Response']['E_NOT_NO']['_text'];
  var description = jsonData['SOAP:Envelope']['SOAP:Body']
          ['ns0:ZFM_MP_NOTIFICATION_CREATE_AJ.Response']['E_NOT_HEADER_SAVE']
      ['SHORT_TEXT']['_text'];
  return [result, description];
}

Future pushWorkNotificationCreate(wo_description, equipment_id, material_number,
    notification_type, priority, order_type, person_number) async {
  var response = await http.post(
    Uri.http('192.168.0.115:3000', 'workorder_create'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'wo_description': wo_description,
      'equipment_id': equipment_id,
      'material_number': material_number,
      'notification_type': notification_type,
      'order_type': order_type,
      'person_number': person_number,
      'priority': priority,
    }),
  );
  var jsonData = jsonDecode(response.body);
  var result = jsonData['MESSAGE']['_text'];
  print(result);
  return [equipment_id, wo_description];
}

Future getWorkorderList() async {
  var response =
      await http.get(Uri.http('192.168.0.115:3000', 'workorder_list'));
  var jsonData = jsonDecode(response.body);
  var WORKORDER_CREATED = jsonData['WORKORDER_LIST_CRTD']['item'];
  var WORKORDER_RELEASED = jsonData['WORKORDER_LIST_REL']['item'];
  var WORKORDER_COMPLETED = jsonData['WORKORDER_LIST_TECO']['item'];
  var result = 'S';
  for (var n in WORKORDER_CREATED) {
    Workorder_data crtd = Workorder_data(
      n['ORDERID']['_text'].toString(),
      n['WORK_CNTR']['_text'].toString(),
      n['DESCRIPTION']['_text'].toString(),
      n['S_STATUS']['_text'].toString(),
      n['ACTUAL_START_DATE']['_text'].toString(),
      n['ACTUAL_FIN_DATE']['_text'].toString(),
      n['CURRENCY']['_text'].toString(),
      n['FUNCLOC']['_text'].toString(),
      n['EQUIPMENT']['_text'].toString(),
      n['PERSON_NO']['_text'].toString(),
      n['EQUIDESCR']['_text'].toString(),
      n['REF_DATE']['_text'].toString(),
      n['PRIOTYPE']['_text'].toString(),
    );
    wo_created.add(crtd);
  }
  for (var n in WORKORDER_RELEASED) {
    Workorder_data relesed = Workorder_data(
      n['ORDERID']['_text'].toString(),
      n['WORK_CNTR']['_text'].toString(),
      n['DESCRIPTION']['_text'].toString(),
      n['S_STATUS']['_text'].toString(),
      n['ACTUAL_START_DATE']['_text'].toString(),
      n['ACTUAL_FIN_DATE']['_text'].toString(),
      n['CURRENCY']['_text'].toString(),
      n['FUNCLOC']['_text'].toString(),
      n['EQUIPMENT']['_text'].toString(),
      n['PERSON_NO']['_text'].toString(),
      n['EQUIDESCR']['_text'].toString(),
      n['REF_DATE']['_text'].toString(),
      n['PRIOTYPE']['_text'].toString(),
    );
    wo_released.add(relesed);
  }
  for (var n in WORKORDER_COMPLETED) {
    Workorder_data comp = Workorder_data(
      n['ORDERID']['_text'].toString(),
      n['WORK_CNTR']['_text'].toString(),
      n['DESCRIPTION']['_text'].toString(),
      n['S_STATUS']['_text'].toString(),
      n['ACTUAL_START_DATE']['_text'].toString(),
      n['ACTUAL_FIN_DATE']['_text'].toString(),
      n['CURRENCY']['_text'].toString(),
      n['FUNCLOC']['_text'].toString(),
      n['EQUIPMENT']['_text'].toString(),
      n['PERSON_NO']['_text'].toString(),
      n['EQUIDESCR']['_text'].toString(),
      n['REF_DATE']['_text'].toString(),
      n['PRIOTYPE']['_text'].toString(),
    );
    wo_completed.add(comp);
  }
  return result;
}

Future getNotifEditResponse(equipment_id, notification_number, priority,
    req_end_date, req_start_date, short_text) async {
  var response = await http.post(
    Uri.http('192.168.0.115:3000', 'notification_edit'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'equipment_id': equipment_id,
      'notification_number': notification_number,
      'priority': priority,
      'req_end_date': req_end_date,
      'req_start_date': req_start_date,
      'short_text': short_text,
    }),
  );
  var jsonData = jsonDecode(response.body);
  var result = jsonData['SHORT_TEXT']['_text'];
  if (result != 'ERROR') {
    return 'Success';
  }
}

Future getWorkorderEditResponse(
    equipment_id, wo_description, person_number, priority, wo_id) async {
  var response = await http.post(
    Uri.http('192.168.0.115:3000', 'workorder_edit'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'equipment_id': equipment_id,
      'wo_description': wo_description,
      'person_number': person_number,
      'priority': priority,
      'wo_id': wo_id,
    }),
  );
  var jsonData = jsonDecode(response.body);
  var result = jsonData['MESSAGE']['_text'];
  if (result != 'ERROR') {
    return 'Success';
  }
}

// Helper Functions
Future getLoginDetails() async {
  var res = [user, plan, grp];
  return res;
}

Future Completed_Notif() async {
  return completedData;
}

Future Outstanding_Notif() async {
  return outstandingData;
}

Future All_Notif() async {
  return allData;
}

Future Process_Notif() async {
  return processData;
}

Future Created_Notif() async {
  return completedData;
}

Future Released_Notif() async {
  return completedData;
}

Future WO_created_data() async {
  return wo_created;
}

Future WO_released_data() async {
  return wo_released;
}

Future WO_completed_data() async {
  return wo_completed;
}
