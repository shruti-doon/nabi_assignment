import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/doctor.png'),
            backgroundColor: Colors.grey.shade200,
          ),
          SizedBox(height: 10),
          Text(
            "Dr. Parika Radhakrishnan's",
            style: TextStyle(
              fontSize: 24, 
              fontWeight: FontWeight.bold,
              color: Color(0xFFBF7154),
            ),
          ),
          Text(
            "appointments :",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}