import 'package:flutter/material.dart';

class CustomUnoWidget extends StatefulWidget {
  final List<String> imagePaths;
  final int currentIndex;

  const CustomUnoWidget({Key? key, required this.imagePaths, required this.currentIndex}) : super(key: key);

  @override
  State<CustomUnoWidget> createState() => _CustomUnoWidgetState();
}

class _CustomUnoWidgetState extends State<CustomUnoWidget> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(widget.imagePaths[widget.currentIndex]);
  }
}
