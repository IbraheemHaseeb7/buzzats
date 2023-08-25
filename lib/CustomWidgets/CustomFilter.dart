import 'package:flutter/material.dart';

class CustomFilter extends StatefulWidget {
  final List<String> items;
  final String value,labelText;
  final double width;
  final Function(String?) onChanged;

  CustomFilter(
      {required this.items,
      required this.value,
      required this.onChanged,
      required this.width,
      required this.labelText,
      });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomFilter> {
  Color labelColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: widget.width,
        padding: const EdgeInsets.only(top: 20),
        child: DropdownButtonFormField<String>(
          items: widget.items
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: (newValue) {
            // Update label color on focus
            setState(() {
              labelColor = Color.fromARGB(255, 255, 255, 255);
              widget.onChanged(newValue);
            });
          },
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: const Color.fromARGB(255, 255, 255, 255), width: 1),
              borderRadius: BorderRadius.circular(50),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(50),
            ),
            labelText: widget.labelText,
            labelStyle: TextStyle(color: labelColor),
          ),
          style: const TextStyle(color: Colors.white),
          dropdownColor:
              Colors.black, // Customize the dropdown menu background color
        ),
      ),
    );
  }
}
