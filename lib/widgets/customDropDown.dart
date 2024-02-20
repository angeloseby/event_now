import 'package:flutter/material.dart';

final eventTypes = ["Hackathon", "Workshop", "Seminar", "Fireside Chat"];

class CustomDropDown extends StatelessWidget {
  final double dropDownWidth, dropDownHeight;
  final Color dropDownBgColor;
  const CustomDropDown({
    super.key,
    required this.dropDownWidth,
    required this.dropDownHeight, required this.dropDownBgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dropDownWidth,
      height: dropDownHeight,
      decoration: BoxDecoration(
        color: dropDownBgColor,
        borderRadius: BorderRadius.circular(11.0),
      ),
      child: DropdownButton(
        items: eventTypes
            .map((String event) => DropdownMenuItem(
                  value: event,
                  child: Text(event),
                ))
            .toList(),
        onChanged: (event) {
          print(event);
        },
        dropdownColor: const Color.fromRGBO(102, 45, 145, 1.0),
        hint: const Text("Select Event Type"),

      ),
    );
  }
}