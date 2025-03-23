import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/appointment_model.dart';
import 'appointment_detail_screen.dart';
import '../widgets/menu_options.dart';
import '../widgets/header.dart';
import '../widgets/section_title.dart';
import '../widgets/date_badge.dart';
import '../widgets/empty_message.dart';
import '../widgets/appointment_card.dart';

class HomeScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF7F1),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFDCC7),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20), // Curved edges at the bottom
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            iconSize: 30, // Increase the icon size here
            onPressed: () => showMenuOptions(context),
          ),
        ],
        title: Container(),
      ),
      body: Stack(
        children: [
          // Bottom background image with gradient overlay
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.3, // Adjust height as needed
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image.png'),
                  fit: BoxFit.cover,
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Color(0xFFD4A373).withOpacity(0.8), // Adjust color to match your design
                  ],
                ),
              ),
            ),
          ),
          // Content
          FutureBuilder<List<Appointment>>(
            future: apiService.getAppointments(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text("No appointments found."));
              } else {
                final appointments = snapshot.data!;
                final todayAppointments = appointments.where((a) => a.status == "today").toList();
                final upcomingAppointments = appointments.where((a) => a.status == "upcoming").toList();
                final previousAppointments = appointments.where((a) => a.status == "completed").toList();

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      HeaderWidget(),
                      
                      // Today Section
                      Center(child: SectionTitleWidget(title: "Today")),
                      if (todayAppointments.isEmpty)
                        EmptyMessageWidget(message: "No appointments for today.")
                      else
                        Column(
                          children: [
                            DateBadgeWidget(date: "15 March 2024"),
                            ...todayAppointments.map((appointment) => 
                              AppointmentCardWidget(appointment: appointment)).toList(),
                          ],
                        ),
                      
                      // Upcoming Sessions
                      Center(child: SectionTitleWidget(title: "Upcoming sessions")),
                      if (upcomingAppointments.isEmpty)
                        EmptyMessageWidget(message: "No upcoming appointments.")
                      else
                        Column(
                          children: [
                            DateBadgeWidget(date: "20 March 2024"),
                            ...upcomingAppointments.map((appointment) => 
                              AppointmentCardWidget(appointment: appointment)).toList(),
                          ],
                        ),
                      
                      // Previous Sessions
                      Center(child: SectionTitleWidget(title: "Previous Sessions")),
                      if (previousAppointments.isEmpty)
                        EmptyMessageWidget(message: "No previous appointments.")
                      else
                        Column(
                          children: [
                            DateBadgeWidget(date: "10 March 2024", isPrevious: true),
                            ...previousAppointments.map((appointment) => 
                              AppointmentCardWidget(appointment: appointment)).toList(),
                          ],
                        ),
                      // Add some padding at the bottom to ensure content is visible
                      SizedBox(height: 80),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}