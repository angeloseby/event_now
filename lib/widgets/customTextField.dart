import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
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
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      width: widget.fieldWidth,
      height: widget.fieldHeight,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(75, 22, 128, 1.0),
          borderRadius: BorderRadius.circular(11.0)),
      child: TextField(
        obscureText: widget.obscureText && !passwordVisible,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w200,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          suffixIcon: widget.obscureText ? GestureDetector(
            onTap: () {
              setState(() {
                passwordVisible
                    ? passwordVisible = false
                    : passwordVisible = true;
              });
            },
            child: passwordVisible
                ? const FaIcon(
                    FontAwesomeIcons.eyeSlash,
                    size: 20.0,
                  )
                : const FaIcon(
                    FontAwesomeIcons.eye,
                    size: 20.0,
                  ),
          ):null,
          suffixIconColor: Colors.white,
          suffixIconConstraints: const BoxConstraints(),
          icon: FaIcon(
            widget.iconName,
            color: Colors.white,
            size: 20.0,
          ),
          hintText: widget.hintText,
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
