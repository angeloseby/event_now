import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final double fieldWidth, fieldHeight;
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.fieldWidth,
    required this.fieldHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      width: fieldWidth,
      height: fieldHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11.0),
      ),
      child: Center(
        child: Text(
          buttonText,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: const Color.fromRGBO(75, 22, 128, 1.0),
          ),
        ),
      ),
    );
  }
}
