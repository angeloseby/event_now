import 'package:event_now/helper/regexValidator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final IconData iconName;
  final String hintText;
  final double fieldWidth, fieldHeight;
  final bool obscureText;
  final GlobalKey<FormState> formKey;
  final bool isEmail;
  const CustomTextField({
    super.key,
    required this.iconName,
    required this.hintText,
    required this.fieldWidth,
    required this.fieldHeight,
    required this.obscureText,
    required this.formKey,
    this.isEmail = false,
    required this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      width: widget.fieldWidth,
      height: widget.fieldHeight,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(75, 22, 128, 1.0),
          borderRadius: BorderRadius.circular(11.0)),
      child: TextFormField(
        controller: widget.controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter ${widget.hintText}';
          } else {
            if (widget.isEmail) {
              if (regexValidateEmail(value)) {
                return null;
              } else {
                return "Failed Email Type";
              }
            }
          }
          return null;
        },
        obscureText: widget.obscureText && !passwordVisible,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w200,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          errorStyle: GoogleFonts.poppins(
            fontSize: 8.0,
            color: Colors.red,
            fontStyle: FontStyle.italic,
          ),
          suffixIcon: widget.obscureText
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      passwordVisible
                          ? passwordVisible = false
                          : passwordVisible = true;
                    });
                  },
                  child: passwordVisible
                      ? const FaIcon(
                          FontAwesomeIcons.eyeSlash,
                          size: 20.0,
                        )
                      : const FaIcon(
                          FontAwesomeIcons.eye,
                          size: 20.0,
                        ),
                )
              : null,
          suffixIconColor: Colors.white,
          suffixIconConstraints: const BoxConstraints(),
          icon: FaIcon(
            widget.iconName,
            color: Colors.white,
            size: 20.0,
          ),
          hintText: widget.hintText,
          hintStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w100,
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
