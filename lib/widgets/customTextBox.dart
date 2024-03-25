import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextBox extends StatelessWidget {
  final String text;
  const CustomTextBox({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      width: screenWidth * 0.3,
      height: screenHeight * 0.075,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(75, 22, 128, 1.0),
          borderRadius: BorderRadius.circular(11.0)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.centerLeft,
        width: screenWidth * 0.3,
        height: screenHeight * 0.075,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color.fromRGBO(75, 22, 128, 1.0),
            width: 2.0,
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            color: Colors.grey.shade900,
            fontWeight: FontWeight.normal,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
