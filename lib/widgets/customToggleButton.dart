import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomToggleButton extends StatefulWidget {
  const CustomToggleButton({super.key, required this.fieldController});
  final TextEditingController fieldController;

  @override
  State<CustomToggleButton> createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  final List<bool> selectedOrder = List.generate(3, (index) => false);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return ToggleButtons(
      fillColor: const Color.fromRGBO(75, 22, 128, 1.0),
      selectedColor: Colors.white,
      selectedBorderColor: const Color.fromRGBO(75, 22, 128, 1.0),
      textStyle: GoogleFonts.poppins(
        color: Colors.grey.shade900,
        fontWeight: FontWeight.normal,
        fontSize: 18,
      ),
      borderColor: const Color.fromRGBO(75, 22, 128, 1.0),
      borderWidth: 2.0,
      borderRadius: BorderRadius.circular(12),
      isSelected: selectedOrder,
      children: [
        Container(
          alignment: Alignment.center,
          height: screenHeight * 0.075,
          width: screenWidth * 0.1 - 2,
          child: const Text("Online"),
        ),
        Container(
          alignment: Alignment.center,
          height: screenHeight * 0.075,
          width: screenWidth * 0.1 - 2,
          child: const Text("Offline"),
        ),
        Container(
          alignment: Alignment.center,
          height: screenHeight * 0.075,
          width: screenWidth * 0.1 - 2,
          child: const Text("Hybrid"),
        ),
      ],
      onPressed: (index) {
        setState(() {
          selectedOrder.fillRange(0, 3, false);
          selectedOrder[index] = !selectedOrder[index];
          switch (index) {
            case 1:
              widget.fieldController.text = "Online";
              break;
            case 2:
              widget.fieldController.text = "Offline";
              break;
            case 3:
              widget.fieldController.text = "Hybrid";
              break;
            default:
              widget.fieldController.text = "Online";
          }
        });
      },
    );
  }
}
