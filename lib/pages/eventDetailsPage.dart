import 'package:event_now/services/eventModel.dart';
import 'package:event_now/widgets/customButton.dart';
import 'package:event_now/widgets/customTextBox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventDetailsPage extends StatelessWidget {
  final Event event;
  const EventDetailsPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        backgroundColor: const Color.fromRGBO(75, 22, 128, 1.0),
        centerTitle: true,
        foregroundColor: Colors.white,
        title: Image.asset(
          'assets/images/logo_white.png',
          width: screenWidth * 0.120,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Event Details",
                style: GoogleFonts.poppins(
                  color: const Color.fromRGBO(75, 22, 128, 1.0),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ), //Event Name
              CustomTextBox(
                text: "Event Name : ${event.eventName}",
              ),
              const SizedBox(
                height: 20,
              ),
              //Event Description
              CustomTextBox(
                text: "Event Description : ${event.eventDesc}",
              ),
              const SizedBox(
                height: 20,
              ),
              //Event Type
              CustomTextBox(
                text: "Event Type : ${event.eventType}",
              ),
              const SizedBox(
                height: 20,
              ),
              //Event Mode
              CustomTextBox(
                text: "Event Mode : ${event.eventMode}",
              ),
              const SizedBox(
                height: 20,
              ),
              //Event Starting Date and Time
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomTextBox(
                    text: "Start Date : ${event.startDate}",
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CustomTextBox(
                    text: "Start Time : ${event.startTime}",
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              //Event Ending Date and Time
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomTextBox(
                    text: "End Date : ${event.endDate}",
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CustomTextBox(
                    text: "End Time : ${event.endTime}",
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomButton(
                    buttonText: "View Attendees",
                    buttonWidth: screenWidth * 0.15 - 10,
                    buttonHeight: screenHeight * 0.075,
                    buttonPress: () async {},
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CustomButton(
                    buttonText: "Edit Event",
                    buttonWidth: screenWidth * 0.15 - 10,
                    buttonHeight: screenHeight * 0.075,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
