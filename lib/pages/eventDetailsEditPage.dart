import 'package:event_now/widgets/customDetailsTextField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventDetailsEditPage extends StatelessWidget {
  const EventDetailsEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController eventNameController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey();
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
      body: Form(
        key: formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Event Name
                CustomDetailsTextField(
                  eventNameController: eventNameController,
                  hintText: "Event Name",
                ),
                //Event Description
                CustomDetailsTextField(
                  eventNameController: eventNameController,
                  hintText: "Event Description",
                )
                //Event Type
                //Event Mode
                //Event Starting Date and Time
                //Event Ending Date and Time
                //Event Status
                //Event Visibility
              ],
            ),
          ),
        ),
      ),
    );
  }
}
