import 'package:flutter/material.dart';

class NameText extends StatelessWidget {
  const NameText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Karim Laidani',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
