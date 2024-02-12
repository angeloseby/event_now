import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final IconData iconName;
  final String hintText;
  final double fieldWidth, fieldHeight;
  final bool obscureText;
  const CustomTextField({
    super.key,
    required this.iconName,
    required this.hintText,
    required this.fieldWidth,
    required this.fieldHeight,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      width: fieldWidth,
      height: fieldHeight,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(75, 22, 128, 1.0),
          borderRadius: BorderRadius.circular(11.0)),
      child: TextField(
        obscureText: obscureText,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w200,
          fontSize: 20.0,
        ),
        decoration: InputDecoration(
          icon: FaIcon(
            iconName,
            color: Colors.white,
            size: 20.0,
          ),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w100,
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
