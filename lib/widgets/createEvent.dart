import 'package:auto_size_text/auto_size_text.dart';
import 'package:event_now/services/dbServices.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateEventButton extends StatelessWidget {
  const CreateEventButton({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        Overlay.of(context).build(context);
        OverlayEntry(builder: (BuildContext context) {
          return Container(
            color: Colors.green,
            width: 800,
          );
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromRGBO(102, 45, 145, 1.0),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              offset: const Offset(0, 2),
              blurRadius: 2,
              spreadRadius: 0.1,
            )
          ],
        ),
        width: screenWidth * 0.15,
        height: screenWidth * 0.10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.calendarPlus,
              color: const Color.fromRGBO(51, 51, 51, 1.0),
              size: screenWidth * 0.025,
            ),
            SizedBox(
              height: screenWidth * 0.014,
            ),
            AutoSizeText(
              "Create Event",
              style: GoogleFonts.poppins(
                fontSize: screenWidth * 0.015,
                fontWeight: FontWeight.normal,
                color: const Color.fromRGBO(51, 51, 51, 1.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
