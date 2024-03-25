import 'package:auto_size_text/auto_size_text.dart';
import 'package:event_now/services/appUserModel.dart';
import 'package:event_now/services/authServices.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EmailWrapper extends StatelessWidget {
  const EmailWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final _authService = Provider.of<AuthService>(context);
    return StreamBuilder(
      stream: _authService.user,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final AppUser? _appUser = snapshot.data;
          // ignore: unnecessary_null_comparison
          return _appUser!.email == null
              ? const CircularProgressIndicator()
              : AutoSizeText.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Entered E-Mail\n",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(51, 51, 51, 1.0),
                        ),
                      ),
                      TextSpan(
                        text: _appUser.email,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(51, 51, 51, 1.0),
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
