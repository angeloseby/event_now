import 'package:event_now/services/authServices.dart';
import 'package:event_now/widgets/createEvent.dart';
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
      body: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            CreateEventButton(),
          ],
        )
      ),
    );
  }
}
