import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

SnackBar customSnackBar(String snackBarText, double snackBarWidth, Color snackBarColor) {
  return SnackBar(
    content: AutoSizeText(
      snackBarText,
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(),
    ),
    width: snackBarWidth,
    behavior: SnackBarBehavior.floating,
    backgroundColor: snackBarColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  );
}
