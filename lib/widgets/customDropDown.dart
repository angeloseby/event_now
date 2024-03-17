import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final eventTypes = ["Hackathon", "Workshop", "Seminar", "Fireside Chat"];

class CustomDropDown extends StatelessWidget {
  final double dropDownWidth, dropDownHeight;
  final Color dropDownBgColor;
  const CustomDropDown({
    super.key,
    required this.dropDownWidth,
    required this.dropDownHeight,
    required this.dropDownBgColor,
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
      child: Center(
        child: DropdownButtonFormField(
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          iconEnabledColor: Colors.white,
          iconDisabledColor: Colors.white,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w200,
            fontSize: 18,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
          hint: Text(
            "Select Event Type",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w100,
              fontStyle: FontStyle.italic,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
