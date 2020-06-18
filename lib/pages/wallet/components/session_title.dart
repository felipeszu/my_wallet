import 'package:flutter/material.dart';

class SessionTitle extends StatelessWidget {
  final String title;
  SessionTitle({this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700
        ),
      ),
    );
  }
}