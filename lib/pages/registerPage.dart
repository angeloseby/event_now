import 'package:auto_size_text/auto_size_text.dart';
import 'package:event_now/pages/loginPage.dart';
import 'package:event_now/services/authServices.dart';
import 'package:event_now/widgets/customSnackBar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../widgets/customButton.dart';
import '../widgets/customTextField.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final formKey = GlobalKey<FormState>();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Row(
        children: [
          //Left Side Screen
          Container(
            color: const Color.fromRGBO(253, 253, 253, 1.0),
            width: screenWidth * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/startup_illustration.png',
                  width: screenWidth * 0.3,
                ),
                Image.asset(
                  'assets/images/logo_with_tagline.png',
                  width: screenWidth * 0.3,
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
              key: formKey,
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
                      const SizedBox(
                        height: 25.0,
                      ),
                      CustomTextField(
                        controller: emailController,
                        isEmail: true,
                        formKey: formKey,
                        iconName: FontAwesomeIcons.envelope,
                        hintText: "Email",
                        fieldWidth: screenWidth * 0.35,
                        fieldHeight: screenHeight * 0.080,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      CustomTextField(
                        controller: passwordController,
                        formKey: formKey,
                        iconName: FontAwesomeIcons.lock,
                        hintText: "Password",
                        fieldWidth: screenWidth * 0.35,
                        fieldHeight: screenHeight * 0.080,
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      SizedBox(
                        width: screenWidth * 0.35,
                        height: screenHeight * 0.080,
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
                        buttonPress: () async {
                          if (formKey.currentState!.validate()) {
                            final authStatusResult =
                                await authService.registerUser(
                                    password: passwordController.text,
                                    email: emailController.text);
                            if (authStatusResult != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  customSnackBar(
                                      "User created successfully",
                                      screenWidth * 0.5,
                                      Colors.green.shade900));
                              Navigator.pop(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  customSnackBar("Can't add the user",
                                      screenWidth * 0.5, Colors.red.shade900));
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                customSnackBar("Error in the details entered",
                                    screenWidth * 0.5, Colors.red.shade900));
                          }
                        },
                        buttonText: "Register",
                        buttonWidth: screenWidth * 0.35,
                        buttonHeight: screenHeight * 0.080,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        width: 500,
                        height: 45,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const LoginPage();
                            }));
                          },
                          child: AutoSizeText(
                            "Already Have an Account ? Login.",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.white,
                            ),
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
                        width: screenWidth * 0.120,
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
