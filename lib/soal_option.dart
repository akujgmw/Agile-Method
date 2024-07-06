import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:login/constants.dart';
// import 'package:login/constants.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({super.key, required this.option, required this.color});
  final String option;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        title: Text(option,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontSize: 13.0, color: Color.fromARGB(255, 0, 0, 0))),
      ),
    );
  }
}
