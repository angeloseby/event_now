import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker(
      {super.key, required this.fieldController, required this.hintText});
  final TextEditingController fieldController;
  final String hintText;

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        _selectDate(context);
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime.now(),
        lastDate: DateTime(2030));
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        widget.fieldController.text = DateFormat.yMMMd().format(selectedDate);
      });
    }
  }
}
