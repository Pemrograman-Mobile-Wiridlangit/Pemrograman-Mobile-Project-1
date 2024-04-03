import 'package:flutter/material.dart';

class CircularProgressWidget extends StatelessWidget {
  final double value;
  final Color color;

  const CircularProgressWidget({
    Key? key,
    required this.value,
    this.color = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: value,
      color: color,
      backgroundColor: Colors.grey.withOpacity(0.2),
    );
  }
}
