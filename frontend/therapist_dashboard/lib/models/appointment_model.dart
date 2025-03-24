class Appointment {
  final String id;          // Required fields
  final String patientName;  // Required fields
  final String? email;       // Optional fields
  final String age;
  final String gender;
  final String? notes;
  final String status;
  final String time;
  final String date;

  Appointment({
    required this.id,
    required this.patientName,
    this.email,
    required this.age,
    required this.gender,
    this.notes,
    required this.status,
    required this.time,
    required this.date,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['_id']?.toString() ?? '',
      patientName: json['patientName']?.toString() ?? 'Unknown Patient',
      email: json['email']?.toString(),
      age: json['age']?.toString() ?? 'N/A',
      gender: json['gender']?.toString() ?? 'Not specified',
      notes: json['notes']?.toString(),
      status: json['status']?.toString() ?? 'pending',
      time: json['time']?.toString() ?? 'No time set',
      date: json['date']?.toString() ?? 'No date set',
    );
  }
}