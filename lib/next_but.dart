import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_me/constants.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: neutral,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        'Next Question',
        style: GoogleFonts.poppins(
            fontSize: 13.0, color: Color.fromARGB(255, 0, 0, 0)),
        textAlign: TextAlign.center,
      ),
    );
  }
}
