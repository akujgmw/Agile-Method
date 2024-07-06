import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:login/myaccount.dart';
// import 'package:login/page.dart';
// import 'package:login/create_soal.dart';
// import 'home-again.dart';
import 'package:quiz_me/login.dart';
// import 'package:login/Login.dart';
import 'package:quiz_me/register.dart';
// import 'package:login/soal.dart';
// import 'page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navigator(
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (BuildContext context) => const MyAppPage(),
          );
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyAppPage extends StatelessWidget {
  const MyAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.white),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                child: SizedBox(
                  height: 100,
                  width: 332,
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: 'QuizMe',
                        style: GoogleFonts.poppins(
                          color: Color(0xFF7456F6),
                          fontSize: 60,
                          fontWeight: FontWeight.w900,
                          height: 0,
                        ),
                      ),
                    ]),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 300,
            ),
            Center(
              child: Container(
                child: SizedBox(
                  width: 332,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                              'Increase your Digital learning potential with ',
                          style: GoogleFonts.poppins(
                            color: Color(0xFF8A94A4),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'QuizMe',
                          style: GoogleFonts.poppins(
                            color: Color(0xFF7456F6),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyloginPage()),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFF7456F6),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xFF7456F6), width: 2),
                  borderRadius: BorderRadius.circular(100),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 88),
              ),
              child: Text(
                'Login',
                style: GoogleFonts.poppins(
                    fontSize: 13.0, color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyRegisterApp();
                }));
              },
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFFB7A7FB),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xFFB7A7FB), width: 2),
                  borderRadius: BorderRadius.circular(100),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 80.1),
              ),
              child: Text(
                'Register',
                style: GoogleFonts.poppins(
                    fontSize: 13.0, color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
