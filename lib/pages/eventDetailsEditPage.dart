import 'package:event_now/services/authServices.dart';
import 'package:event_now/services/dbServices.dart';
import 'package:event_now/widgets/customButton.dart';
import 'package:event_now/widgets/customDatePicker.dart';
import 'package:event_now/widgets/customDetailsTextField.dart';
import 'package:event_now/widgets/customSnackBar.dart';
import 'package:event_now/widgets/customTimePicker.dart';
import 'package:event_now/widgets/customToggleButton.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventDetailsEditPage extends StatelessWidget {
  const EventDetailsEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dbService = DbService();
    final authService = Provider.of<AuthService>(context);
    final TextEditingController eventNameController = TextEditingController();
    final TextEditingController eventDescriptionController =
        TextEditingController();
    final TextEditingController eventTypeController = TextEditingController();
    final TextEditingController eventModeController = TextEditingController(
      text: "Online",
    );
    final TextEditingController startDateController =
        TextEditingController(text: DateFormat.yMMMd().format(DateTime.now()));
    final TextEditingController endDateController =
        TextEditingController(text: DateFormat.yMMMd().format(DateTime.now()));

    final TextEditingController startTimeController = TextEditingController(
      text: TimeOfDay.now().format(context),
    );
    final TextEditingController endTimeController = TextEditingController(
      text: TimeOfDay.now().format(context),
    );
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //Event Name
                CustomDetailsTextField(
                  fieldController: eventNameController,
                  hintText: "Event Name",
                ),
                const SizedBox(
                  height: 20,
                ),
                //Event Description
                CustomDetailsTextField(
                  fieldController: eventDescriptionController,
                  hintText: "Event Description",
                ),
                const SizedBox(
                  height: 20,
                ),
                //Event Type
                CustomDetailsTextField(
                  fieldController: eventTypeController,
                  hintText: "Event Type",
                ),
                const SizedBox(
                  height: 20,
                ),
                //Event Mode
                CustomToggleButton(
                  fieldController: eventModeController,
                ),
                const SizedBox(
                  height: 20,
                ),
                //Event Starting Date and Time
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomDatePicker(
                      hintText: "Start Date : ",
                      fieldController: startDateController,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomTimePicker(
                      hintText: "Start Time : ",
                      fieldController: startTimeController,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),

                //Event Ending Date and Time
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomDatePicker(
                      hintText: "End Date : ",
                      fieldController: endDateController,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomTimePicker(
                      hintText: "End Time : ",
                      fieldController: endTimeController,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      buttonText: "Publish",
                      buttonWidth: screenWidth * 0.15 - 10,
                      buttonHeight: screenHeight * 0.075,
                      buttonPress: () async {
                        final eventCreationResult =
                            await dbService.publishEvent(
                          uid: authService.userProfile!.uid,
                          eventName: eventNameController.text,
                          eventDesc: eventDescriptionController.text,
                          eventType: eventTypeController.text,
                          eventMode: eventModeController.text,
                          startDate: startDateController.text,
                          endDate: endDateController.text,
                          startTime: startTimeController.text,
                          endTime: endTimeController.text,
                        );
                        if (eventCreationResult) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            customSnackBar("Event Created Successfully",
                                screenWidth * 0.5, Colors.green.shade900),
                          );
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            customSnackBar("Can't add the event",
                                screenWidth * 0.5, Colors.red.shade900),
                          );
                        }
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomButton(
                      buttonText: "Draft",
                      buttonWidth: screenWidth * 0.15 - 10,
                      buttonHeight: screenHeight * 0.075,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
