import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/appointment_model.dart';

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:5001'; // Use 10.0.2.2 for Android emulator

  Future<List<Appointment>> getAppointments() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/appointments'));
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((data) => Appointment.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load appointments: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching appointments: $e');
      return []; // Return empty list instead of throwing
    }
  }
}