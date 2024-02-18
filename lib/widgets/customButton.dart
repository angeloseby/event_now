import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final double buttonWidth, buttonHeight;
  final void Function()? buttonPress;
  final Color buttonBgColor;
  final Color buttonTextColor;
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.buttonWidth,
    required this.buttonHeight,
    this.buttonPress,
    this.buttonBgColor = const Color.fromRGBO(75, 22, 128, 1.0),
    this.buttonTextColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonPress,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        width: buttonWidth,
        height: buttonHeight,
        decoration: BoxDecoration(
          color: buttonBgColor,
          borderRadius: BorderRadius.circular(11.0),
        ),
        child: Center(
          child: AutoSizeText(
            buttonText,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: buttonTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
