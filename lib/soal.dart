import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_me/constants.dart';
import 'package:quiz_me/hasil.dart';
import 'package:quiz_me/models/db_konek.dart';
import 'package:quiz_me/models/question_model.dart';
import 'package:quiz_me/next_but.dart';
import 'package:quiz_me/soal_option.dart';
import 'package:quiz_me/soal_widget.dart';
// import 'models/db_konek.dart';

class MySoalPage extends StatelessWidget {
  const MySoalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color.fromARGB(223, 133, 114, 231),
        shadowColor: Colors.transparent,
      ),
      home: MySoal(),
    );
  }
}

class MySoal extends StatefulWidget {
  const MySoal({super.key});

  @override
  State<MySoal> createState() => _MySoalState();
}

class _MySoalState extends State<MySoal> {
  var db = DBkonek();
  // List<Question> _questions = [
  //   Question(
  //     id: '10',
  //     title: 'What is 2 + 2 ?',
  //     options: {'5': false, '30': false, '4': true, '10': false},
  //   ),
  //   Question(
  //     id: '11',
  //     title: 'What is 10 + 20 ?',
  //     options: {'50': false, '30': true, '40': false, '10': false},
  //   )
  // ];

  late Future _questions;

  Future<List<Question>> getData() async {
    return db.fetchQuestions();
  }

  @override
  void initState() {
    _questions = getData();
    super.initState();
  }

  int index = 0;

  int score = 0;

  bool isPressed = false;

  bool isAlreadySelected = false;

  void nextQuestion(int questionLength) {
    if (index == questionLength - 1) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) => ResultBox(
                result: score,
                questionLength: questionLength,
                onPressed: startOver,
              ));
      return;
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please Select any option'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20.0),
        ));
      }
    }
  }

  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
    Navigator.pop(context);
  }

  void CheckAnswerAndUpdate(bool value) {
    if (isAlreadySelected) {
      return;
    } else {
      if (value == true) {
        score++;
      }
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _questions as Future<List<Question>>,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            var extractedData = snapshot.data as List<Question>;
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight + 56),
                child: AppBar(
                    backgroundColor: const Color.fromARGB(225, 123, 198, 204),
                    shadowColor: const Color.fromARGB(150, 0, 0, 0),
                    toolbarHeight: 50,
                    leadingWidth: 50, // set the width of the leading area
                    actions: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(right: 16.0, top: 16.0),
                          child: Text(
                            'Score: $score',
                            style: GoogleFonts.poppins(fontSize: 18),
                          ),
                        ),
                      )
                    ]),
              ),
              body: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    QuestionWidget(
                      question: extractedData[index].title,
                      indexAction: index,
                      totalQuestions: extractedData.length,
                    ),
                    const Divider(
                      color: neutral,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    for (int i = 0;
                        i < extractedData[index].options.length;
                        i++)
                      GestureDetector(
                        onTap: () => CheckAnswerAndUpdate(
                          extractedData[index].options.values.toList()[i],
                        ),
                        child: OptionCard(
                          option: extractedData[index].options.keys.toList()[i],
                          color: isPressed
                              ? extractedData[index]
                                          .options
                                          .values
                                          .toList()[i] ==
                                      true
                                  ? correct
                                  : incorrect
                              : neutral,
                        ),
                      ),
                  ],
                ),
              ),
              floatingActionButton: GestureDetector(
                onTap: () => nextQuestion(extractedData.length),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: NextButton(),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return const Center(
          child: Text('No Data'),
        );
      },
    );
  }
}
