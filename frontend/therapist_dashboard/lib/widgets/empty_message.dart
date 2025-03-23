import 'package:flutter/material.dart';

class EmptyMessageWidget extends StatelessWidget {
  final String message;

  const EmptyMessageWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(message),
    );
  }
}