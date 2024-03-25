import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDetailsTextField extends StatelessWidget {
  const CustomDetailsTextField({
    super.key,
    required this.fieldController,
    required this.hintText,
  });

  final TextEditingController fieldController;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
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
      child: TextFormField(
        controller: fieldController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            color: Colors.grey.shade900,
            fontWeight: FontWeight.w200,
            fontSize: 18,
          ),
        ),
        style: GoogleFonts.poppins(
          color: Colors.grey.shade900,
          fontWeight: FontWeight.normal,
          fontSize: 18,
        ),
      ),
    );
  }
}
