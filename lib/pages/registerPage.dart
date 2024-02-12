import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/customButton.dart';
import '../widgets/customTextField.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Row(
        children: [
          //Left Side Screen
          Container(
            color: const Color.fromRGBO(253, 253, 253, 1.0),
            width: screenWidth* 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/startup_illustration.png',
                  width: screenWidth*0.3,
                ),
                Image.asset(
                  'assets/images/logo_with_tagline.png',
                  width: screenWidth*0.3,
                ),
              ],
            ),
          ),
          //Right Side Screen
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(168, 0, 255, 1.0),
                  Color.fromRGBO(102, 45, 145, 1.0),
                ],
              ),
            ),
            width: MediaQuery.of(context).size.width * 0.4,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Flex(
                    direction: Axis.vertical,
                    children: [
                      AutoSizeText(
                        "Welcome",
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      CustomTextField(
                        formKey: _formKey,
                        iconName: FontAwesomeIcons.user,
                        fieldHeight: screenHeight*0.080,
                        fieldWidth: screenWidth*0.35,
                        hintText: "Username",
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      CustomTextField(
                        isEmail: true,
                        formKey: _formKey,
                        iconName: FontAwesomeIcons.envelope,
                        hintText: "Email",
                        fieldWidth: screenWidth*0.35,
                        fieldHeight: screenHeight*0.080,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      CustomTextField(
                        formKey: _formKey,
                        iconName: FontAwesomeIcons.lock,
                        hintText: "Password",
                        fieldWidth: screenWidth*0.35,
                        fieldHeight: screenHeight*0.080,
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      SizedBox(
                        width: screenWidth*0.35,
                        height: screenHeight*0.080,
                        child: AutoSizeText(
                          "Forgot Password ?",
                          textAlign: TextAlign.end,
                          style: GoogleFonts.poppins(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      CustomButton(
                        formKey: _formKey,
                        buttonText: "Login",
                        fieldWidth: screenWidth*0.35,
                        fieldHeight: screenHeight*0.080,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        width: 500,
                        height: 45,
                        child: AutoSizeText(
                          "Don't Have an Account, Register",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Flex(
                    direction: Axis.vertical,
                    children: [
                      Image.asset(
                        'assets/images/logo_white.png',
                        width: screenWidth*0.120,
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
