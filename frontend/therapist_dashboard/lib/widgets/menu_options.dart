import 'package:flutter/material.dart';

void showMenuOptions(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Options Menu",
    barrierColor: Colors.black.withOpacity(0.3),
    transitionDuration: Duration(milliseconds: 300),
    pageBuilder: (_, __, ___) => Container(),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final slideAnimation = Tween<Offset>(
        begin: Offset(0, -1),
        end: Offset(0, 0),
      ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ));
      
      return SlideTransition(
        position: slideAnimation,
        child: SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: Material(
              color: Colors.transparent,
              child: Container(
                
                decoration: BoxDecoration(
                  color: Color(0xFFFEDACF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 16),
                    // Doctor header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Dr.Parika\nRadhakrishnan",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFBF7154),
                          ),
                        ),
                        SizedBox(width: 8),
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/doctor.png'),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Options",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFBF7154),
                      ),
                    ),
                    SizedBox(height: 16),
                    
                    // Menu options
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          _buildMenuOption(context, "Edit sessions", () {
                            // Add navigation or action here
                          }),
                          _buildMenuOption(context, "Client History", () {
                            // Add navigation or action here
                          }),
                          _buildMenuOption(context, "Upcoming client bookings", () {
                            // Add navigation or action here
                          }),
                          _buildMenuOption(context, "Feedback/Reviews", () {
                            // Add navigation or action here
                          }),
                          _buildMenuOption(context, "Book appointment for someone", () {
                            // Add navigation or action here
                          }),
                          _buildMenuOption(context, "Report an issue", () {
                            // Add navigation or action here
                          }),
                        ],
                      ),
                    ),
                    
                    SizedBox(height: 16),
                    // Down arrow indicator
                    Icon(
                      Icons.keyboard_arrow_up,
                      color: Color(0xFFBF7154),
                      size: 32,
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

Widget _buildMenuOption(BuildContext context, String title, VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(bottom: 12),
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ),
    ),
  );
}