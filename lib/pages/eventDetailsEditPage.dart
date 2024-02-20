import 'package:event_now/widgets/customDropDown.dart';
import 'package:event_now/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomTextField(
                iconName: FontAwesomeIcons.ticket,
                hintText: "Event Name ",
                fieldWidth: screenWidth * 0.35,
                fieldHeight: screenHeight * 0.080,
                obscureText: false,
                formKey: formKey,
                controller: eventNameController,
              ),
              CustomDropDown(
                dropDownWidth: screenWidth * 0.35,
                dropDownHeight: screenHeight * 0.080,
                dropDownBgColor: const Color.fromRGBO(75, 22, 128, 1.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}