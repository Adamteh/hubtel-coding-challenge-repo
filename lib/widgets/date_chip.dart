import 'package:flutter/material.dart';

class DateChip extends StatelessWidget {
  final String date;
  const DateChip({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 87,
      height: 26,
      decoration: BoxDecoration(
        color: const Color(0xFFE6EAED),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Center(
        child: Text(
          date,
          style: const TextStyle(
            fontSize: 10,
            color: Color(0xFF9CABB8),
          ),
        ),
      ),
    );
  }
}
