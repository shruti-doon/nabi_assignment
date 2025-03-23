import 'package:flutter/material.dart';

class SessionPillWidget extends StatelessWidget {
  final int number;

  const SessionPillWidget({Key? key, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 4),
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: Color(0xFFFBC8A9),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          number.toString(),
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}