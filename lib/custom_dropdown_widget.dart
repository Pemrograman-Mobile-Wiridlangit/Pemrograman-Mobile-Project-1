import 'package:flutter/material.dart';

class CustomDropdownWidget extends StatefulWidget {
  final List<String> items;
  final Function(String?) onChanged;
  final String value;

  const CustomDropdownWidget({
    Key? key,
    required this.items,
    required this.onChanged,
    required this.value,
  }) : super(key: key);

  @override
  _CustomDropdownWidgetState createState() => _CustomDropdownWidgetState();
}

class _CustomDropdownWidgetState extends State<CustomDropdownWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.value,
      onChanged: widget.onChanged,
      items: widget.items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
