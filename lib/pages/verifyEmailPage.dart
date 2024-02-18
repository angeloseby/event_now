import 'package:auto_size_text/auto_size_text.dart';
import 'package:event_now/services/authServices.dart';
import 'package:event_now/utils/emailWrapper.dart';
import 'package:event_now/widgets/customButton.dart';
import 'package:event_now/widgets/customSnackBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool _verificationMailSend = false;
  @override
  Widget build(BuildContext context) {
    final _authService = Provider.of<AuthService>(context);
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
                  const EmailWrapper(),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomButton(
                    buttonPress: () async {
                      if (_verificationMailSend) {
                        print("Clicked");
                        if (_authService.checkEmailVerified()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              customSnackBar("Email Verified Successfully",
                                  screenWidth * 0.5, Colors.green.shade900));
                          ScaffoldMessenger.of(context).showSnackBar(
                              customSnackBar("Login To Continue",
                                  screenWidth * 0.5, Colors.blue));
                          _authService.signOutUser();
                        }
                      } else {
                        _verificationMailSend =
                            await _authService.sendVerificationMail();
                        setState(() {});
                      }
                    },
                    buttonText: _verificationMailSend
                        ? "Already Verified, Click Here"
                        : "Send Verification Mail",
                    buttonWidth: screenWidth * 0.21,
                    buttonHeight: screenHeight * 0.05,
                    buttonBgColor: _verificationMailSend
                        ? Colors.green.shade900
                        : const Color.fromRGBO(102, 45, 145, 1.0),
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
