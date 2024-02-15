import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final double fieldWidth, fieldHeight;
  final GlobalKey<FormState> formKey;
  final void Function()? buttonPress;
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.fieldWidth,
    required this.fieldHeight,
    required this.formKey, this.buttonPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonPress,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        width: fieldWidth,
        height: fieldHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11.0),
        ),
        child: Center(
          child: AutoSizeText(
            buttonText,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(75, 22, 128, 1.0),
            ),
          ),
        ),
      ),
    );
  }
}
