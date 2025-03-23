import 'package:flutter/material.dart';
import '../models/appointment_model.dart';
import 'session_pill.dart';
import '../screens/appointment_detail_screen.dart'; // Ensure this import is correct

class AppointmentCardWidget extends StatelessWidget {
  final Appointment appointment;

  const AppointmentCardWidget({Key? key, required this.appointment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Generate a list of session numbers (this should ideally come from your data model)
    // For demonstration purposes, we're creating dummy session numbers
    List<int> sessionNumbers = List.generate(
      appointment.status == "completed" ? 4 : (appointment.status == "today" ? 4 : 2),
      (index) => index + 1
    );

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AppointmentDetailScreen(appointment: appointment),
              ),
            );
          },
          child: Row(
            children: [
              // Profile Picture
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage('https://via.placeholder.com/50'),
                backgroundColor: Colors.grey.shade200,
              ),
              SizedBox(width: 12),
              
              // Patient Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appointment.patientName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "${appointment.age}yrs, ${appointment.gender}",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    Text(
                      appointment.email,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
              
              // Time and Session Pills
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Color(0xFFD4A373).withOpacity(0.2), // Brown background
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      appointment.time ?? "4:00 pm - 5:00 pm",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFD4A373), // Brown text
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: sessionNumbers.map((number) => 
                      Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: SessionPillWidget(number: number),
                      )
                    ).toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}