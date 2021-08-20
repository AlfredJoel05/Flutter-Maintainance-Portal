class Notification_data {
  final String? notif_number,
      notif_type,
      equipment,
      notif_description,
      status,
      equip_description,
      notification_date,
      notif_time,
      priority_type,
      priority,
      completion_date,
      start_date,
      end_date;
  Notification_data(
      this.notif_number,
      this.notif_type,
      this.equipment,
      this.notif_description,
      this.status,
      this.equip_description,
      this.notification_date,
      this.notif_time,
      this.priority_type,
      this.priority,
      this.completion_date,
      this.start_date,
      this.end_date);
}

class Notification_completed_data {
  final String? 
      notif_number,
      notif_type,
      equipment,
      notif_description,
      status,
      equip_description,
      notification_date,
      notif_time,
      priority_type,
      priority,
      completion_date,
      start_date,
      end_date;
  Notification_completed_data(
      this.notif_number,
      this.notif_type,
      this.equipment,
      this.notif_description,
      this.status,
      this.equip_description,
      this.notification_date,
      this.notif_time,
      this.priority_type,
      this.priority,
      this.completion_date,
      this.start_date,
      this.end_date);
}

class Notification_all_data {
  final String? notif_number,
      notif_type,
      equipment,
      notif_description,
      status,
      equip_description,
      notification_date,
      notif_time,
      priority_type,
      priority,
      completion_date,
      start_date,
      end_date;
  Notification_all_data(
      this.notif_number,
      this.notif_type,
      this.equipment,
      this.notif_description,
      this.status,
      this.equip_description,
      this.notification_date,
      this.notif_time,
      this.priority_type,
      this.priority,
      this.completion_date,
      this.start_date,
      this.end_date);
}

class Workorder_data {
  final String? workorder_id, //notif_id
      work_center,
      wo_description,
      status,
      actual_start_date, //created
      actual_finish_date, //completed
      currency,
      functional_location,
      equipment_number,
      person_number,
      equipment_description,
      reference_date,
      priority_type;
  Workorder_data(
      this.workorder_id,
      this.work_center,
      this.wo_description,
      this.status,
      this.actual_start_date,
      this.actual_finish_date,
      this.currency,
      this.functional_location,
      this.equipment_number,
      this.person_number,
      this.equipment_description,
      this.reference_date,
      this.priority_type);
}