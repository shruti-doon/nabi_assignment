// lib/widgets/appointment_list.dart
import 'package:flutter/material.dart';
import '../models/appointment_model.dart';

class AppointmentList extends StatelessWidget {
  final List<Appointment> appointments;
  final Function(Appointment) onTap;

  AppointmentList({required this.appointments, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        final appointment = appointments[index];
        return ListTile(
          title: Text(appointment.patientName),
          subtitle: Text(appointment.time),
          onTap: () => onTap(appointment),
        );
      },
    );
  }
}