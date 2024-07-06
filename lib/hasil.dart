import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_me/constants.dart';
// import 'package:quiz_me/home.dart';

import 'home-again.dart';
// import 'package:quiz_me/soal.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({
    super.key,
    required this.result,
    required this.questionLength,
    required this.onPressed,
  });

  final int result;
  final int questionLength;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: background,
      content: Padding(
        padding: const EdgeInsets.all(70.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Score',
              style: GoogleFonts.poppins(color: neutral, fontSize: 20.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            CircleAvatar(
              child: Text(
                '$result/$questionLength',
                style: GoogleFonts.poppins(fontSize: 30.0),
              ),
              radius: 70.0,
              backgroundColor: result == questionLength / 2
                  ? Colors.yellow
                  : result < questionLength / 2
                      ? incorrect
                      : correct,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              result == questionLength / 2
                  ? 'Almost There'
                  : result < questionLength / 2
                      ? 'Try Again ?'
                      : 'Great!',
              style: GoogleFonts.poppins(color: neutral),
            ),
            SizedBox(
              height: 25.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHome()),
                );
              },
              child: Text('Quit',
                  style: GoogleFonts.poppins(
                      color: Colors.blue, fontSize: 20.0, letterSpacing: 1.0)),
            )
          ],
        ),
      ),
    );
  }
}
