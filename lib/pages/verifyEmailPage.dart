import 'package:auto_size_text/auto_size_text.dart';
import 'package:event_now/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color.fromRGBO(168, 0, 255, 1.0),
              Color.fromRGBO(102, 45, 145, 1.0),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/images/logo_white.png',
              width: screenWidth * 0.120,
            ),
            Container(
              width: screenWidth * 0.5,
              height: screenHeight * 0.6,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(0, 10),
                    blurRadius: 20,
                    spreadRadius: 1,
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset('assets/lotties/email-verify.json',
                      height: screenHeight * 0.2),
                  AutoSizeText(
                    "You have to complete the mail verification \nbefore proceeding to the service",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(51, 51, 51, 1.0),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  AutoSizeText(
                    "Please verify your email",
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(102, 45, 145, 1.0),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  AutoSizeText.rich(
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
                          text: "username@gmail.com",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(51, 51, 51, 1.0),
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomButton(
                    buttonText: "Send Verification Mail",
                    buttonWidth: screenWidth * 0.21,
                    buttonHeight: screenHeight * 0.05,
                    buttonBgColor: const Color.fromRGBO(102, 45, 145, 1.0),
                    buttonTextColor: Colors.white,
                  )
                ],
              ),
            ),
            AutoSizeText.rich(
              TextSpan(children: [
                TextSpan(
                  text: "For Any Enquiries Please Contact:\n",
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: "angeloseby94@gmail.com",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                )
              ]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
