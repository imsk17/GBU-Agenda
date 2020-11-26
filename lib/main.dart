import 'package:flutter/material.dart';

void main() {
  runApp(GBUAgenda());
}

class GBUAgenda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Text(
              'GBU Agenda',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
