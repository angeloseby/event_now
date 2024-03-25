import 'package:event_now/pages/eventDetailsEditPage.dart';
import 'package:event_now/pages/eventDetailsPage.dart';
import 'package:event_now/services/authServices.dart';
import 'package:event_now/services/dbServices.dart';
import 'package:event_now/widgets/createEventButton.dart';
import 'package:event_now/widgets/eventTile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final authService = Provider.of<AuthService>(context);
    final dbService = DbService();
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        backgroundColor: const Color.fromRGBO(75, 22, 128, 1.0),
        leadingWidth: screenWidth * 0.120,
        leading: Image.asset(
          'assets/images/logo_white.png',
          width: screenWidth * 0.120,
        ),
        actions: [
          Text(
            authService.userProfile!.email,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              child: IconButton(
                  onPressed: () async {
                    await authService.signOutUser();
                  },
                  icon: const FaIcon(FontAwesomeIcons.userAstronaut)),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: dbService.getEvents(authService.userProfile!.uid),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final eventSnapshotData = snapshot.data;
            final events = [];
            eventSnapshotData.forEach((data) {
              events.add(dbService.eventFromFirestoreEvent(data));
            });
            //print(events[0].eventName);
            if (events.isNotEmpty) {
              return Stack(
                children: [
                  Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(events.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: EventTile(
                              event: events[index],
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 100,
                      right: 100,
                      child: FloatingActionButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const EventDetailsEditPage();
                          }));
                        },
                        child: const FaIcon(
                          FontAwesomeIcons.calendarPlus,
                          color: Color.fromRGBO(51, 51, 51, 1.0),
                        ),
                      )),
                ],
              );
            } else {
              return const Center(
                child: CreateEventButton(),
              );
            }
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text(
                "Some Error Occured",
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
