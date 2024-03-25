import 'package:event_now/pages/eventDetailsPage.dart';
import 'package:event_now/services/eventModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventTile extends StatelessWidget {
  const EventTile({
    super.key,
    required this.event,
  });
  final Event event;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {},
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
        width: screenWidth * 0.60,
        height: screenHeight * 0.08,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              event.eventName,
              style: GoogleFonts.poppins(
                color: Colors.grey.shade900,
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
            ),
            Text(
              event.eventType,
              style: GoogleFonts.poppins(
                color: Colors.grey.shade900,
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
            ),
            Text(
              event.eventMode,
              style: GoogleFonts.poppins(
                color: Colors.grey.shade900,
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
            ),
            Text(
              event.startDate,
              style: GoogleFonts.poppins(
                color: Colors.grey.shade900,
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
              color: Colors.red,
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return EventDetailsPage(
                        event: event,
                      );
                    },
                  ),
                );
              },
              icon: const Icon(Icons.edit),
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
