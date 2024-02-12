import 'package:event_now/widgets/customButton.dart';
import 'package:event_now/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          //Left Side Screen
          Container(
            color: const Color.fromRGBO(253, 253, 253, 1.0),
            width: MediaQuery.of(context).size.width * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/startup_illustration.png',
                  width: 500,
                ),
                Image.asset(
                  'assets/images/logo_with_tagline.png',
                  width: 500,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Flex(
                  direction: Axis.vertical,
                  children: [
                    Text(
                      "Welcome Back",
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const CustomTextField(
                      iconName: FontAwesomeIcons.user,
                      fieldHeight: 55,
                      fieldWidth: 500,
                      hintText: "Username",
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    const CustomTextField(
                      iconName: FontAwesomeIcons.lock,
                      hintText: "Password",
                      fieldWidth: 500,
                      fieldHeight: 55,
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    SizedBox(
                      width: 500,
                      height: 45,
                      child: Text(
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
                    const CustomButton(
                      buttonText: "Login",
                      fieldWidth: 500,
                      fieldHeight: 55,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: 500,
                      height: 45,
                      child: Text(
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
                      width: 200,
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
