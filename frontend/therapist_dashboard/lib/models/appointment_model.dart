class Appointment {
  final String id;
  final String patientName;
  final String email;
  final String age;
  final String gender;
  final String notes;
  final String status;
  final String time; 
  final String date;

  Appointment({
    required this.id,
    required this.patientName,
    required this.email,
    required this.age,
    required this.gender,
    required this.notes,
    required this.status,
    required this.time,
    required this.date,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['_id'],
      patientName: json['patientName'],
      email: json['email'],
      age: json['age'],
      gender: json['gender'],
      notes: json['notes'],
      status: json['status'],
      time: json['time'],
      date: json['date'],
      );
  }
}