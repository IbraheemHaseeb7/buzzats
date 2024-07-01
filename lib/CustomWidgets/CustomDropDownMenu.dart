import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final String value,labelText;
  final double width;
  final Function(String?) onChanged;

  const CustomDropdown(
      {super.key, required this.items,
      required this.value,
      required this.onChanged,
      required this.width,
      required this.labelText,
      });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
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
              labelColor = const Color(0xffa099fc);
              widget.onChanged(newValue);
            });
          },
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(50),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1),
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
