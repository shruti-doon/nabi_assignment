import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/appointment_model.dart';

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:5001'; // Use 10.0.2.2 for Android emulator

  Future<List<Appointment>> getAppointments() async {
    final response = await http.get(Uri.parse('$baseUrl/appointments'));
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((data) => Appointment.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to load appointments');
    }
  }
}