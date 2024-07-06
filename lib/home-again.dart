import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_me/create_soal.dart';
import 'package:quiz_me/page.dart';
import 'package:quiz_me/part/classroom.dart';
import 'package:quiz_me/soal.dart';

class MyHome extends StatefulWidget {
  // final int score;

  const MyHome({
    super.key,
    // required this.score,
  });

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color.fromARGB(224, 44, 218, 231),
        shadowColor: Colors.transparent,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 16.0, top: 16, bottom: 10),
              child: Material(
                color: Colors.blue,
                elevation: 8,
                shape: CircleBorder(),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.black26,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Settings();
                    }));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.blue),
                      shape: BoxShape.circle,
                    ),
                    child: Ink.image(
                        image: const NetworkImage(
                          'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR5Wc5rU5uTHIotAQhMLS4Rw_TvrXkHsrx-tsS7sFiYUpGAzxyf',
                        ),
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          ),
          actions: [
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)))),
            )
          ],
          backgroundColor: Color.fromARGB(223, 255, 255, 255),
          shadowColor: Colors.transparent,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Container(
                      child: SizedBox(
                        height: 50,
                        width: 420,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Welcome To Quizme',
                                style: GoogleFonts.poppins(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    height: 0),
                              )
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(
                        5), // Set the desired border radius here
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyCreateApp()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 104, 131, 255),
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20), // Set the border radius here
                      ),
                    ),
                    child: const Text(
                      'Create ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(
                        5), // Set the desired border radius here
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MySoalPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 104, 131, 255),
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20), // Set the border radius here
                      ),
                    ),
                    child: const Text(
                      'Play ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 104, 131, 255),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.meeting_room_outlined),
              label: 'Classroom',
            ),
          ],
          currentIndex: 0,
          onTap: (index) {
            if (index == 0) {
            } else if (index == 1) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MyClassPage();
              }));
            }
          },
        ),
      ),
    );
  }
}
