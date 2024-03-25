import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CustomTimePicker extends StatefulWidget {
  final String hintText;
  final TextEditingController fieldController;
  const CustomTimePicker(
      {super.key, required this.hintText, required this.fieldController});

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  TimeOfDay selectedTime = const TimeOfDay(hour: 00, minute: 00);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        _selectTime(context);
      },
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          width: screenWidth * 0.15 - 10,
          height: screenHeight * 0.075,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color.fromRGBO(75, 22, 128, 1.0),
              width: 2.0,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.hintText,
                style: GoogleFonts.poppins(
                  color: Colors.grey.shade900,
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
              ),
              Text(
                widget.fieldController.text,
                style: GoogleFonts.poppins(
                  color: Colors.grey.shade900,
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
              ),
            ],
          )),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
        widget.fieldController.text = selectedTime.format(context);
        //"${selectedTime.hour} : ${selectedTime.minute} ${selectedTime.hour >= 12 ? "PM" : "AM"}";
      });
    }
  }
}
