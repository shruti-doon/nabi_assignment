import 'package:flutter/material.dart';

class DateBadgeWidget extends StatelessWidget {
  final String date;
  final bool isPrevious;

  const DateBadgeWidget({Key? key, required this.date, this.isPrevious = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isPrevious ? Colors.grey.shade300 : Color(0xFFFBC8A9),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          date,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}