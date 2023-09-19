import 'package:flutter/material.dart';

class TwoComponentColumn extends StatelessWidget {
  final String title;
  final String value;

  const TwoComponentColumn(
      {super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 18, color: Colors.black45, fontWeight: FontWeight.w400),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
        ),
      ],
    );
  }
}
