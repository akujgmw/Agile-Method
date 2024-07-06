import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'home-again.dart';
// import 'package:login/home.dart';

class MyCreateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCreate(),
    );
  }
}

class MyCreate extends StatelessWidget {
  const MyCreate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 56),
        child: AppBar(
          backgroundColor: Color.fromARGB(224, 44, 218, 231),
          shadowColor: Colors.transparent,
          toolbarHeight: 100,
          leadingWidth: 100, // set the width of the leading area
          leading: GestureDetector(
            child: const SizedBox(
              width: 40, // set the width of the leading widget
              height: 60, // set the height of the leading widget
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MyHome();
              }));
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return MyApp();
              // }));
            },
          ),
        ),
      ),
      body: QuestionForm(),
      backgroundColor: Color.fromARGB(224, 44, 218, 231),
    );
  }
}

class QuestionForm extends StatefulWidget {
  const QuestionForm({Key? key}) : super(key: key);

  @override
  _QuestionFormState createState() => _QuestionFormState();
}

class _QuestionFormState extends State<QuestionForm> {
  String? _selectedOption;
  final _formKey = GlobalKey<FormState>();
  final _questionCtrl = TextEditingController();
  final _optionCtrls = options.map((o) => TextEditingController()).toList();
  late Map<String, TextEditingController> _optionsValues;

  void _showSnackbar({required bool success, required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              success ? Icons.check_circle : Icons.error,
              color: success ? Colors.green : Colors.red,
            ),
            SizedBox(width: 8),
            Text(text),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _questionCtrl.dispose();
    _optionCtrls.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _optionsValues = Map.fromEntries(
      options.asMap().entries.map(
            (entry) => MapEntry(
              entry.value,
              _optionCtrls[entry.key],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _questionCtrl,
                decoration: InputDecoration(
                  labelText: 'Question *',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  filled: true,
                  fillColor: Color(0xFFF7F8F9),
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the question';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Text('Options :'),
              Wrap(
                children: options.map((option) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Radio(
                        value: option,
                        groupValue: _selectedOption,
                        onChanged: (value) {
                          setState(() {
                            _selectedOption = value;
                            _optionsValues.forEach((key, value) {
                              if (key == _selectedOption) {
                                value.text = 'true';
                              } else {
                                value.text = '';
                              }
                            });
                          });
                        },
                      ),
                      Text(option),
                    ],
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              ..._optionCtrls.asMap().entries.map((entry) {
                final index = entry.key;
                final optionCtrl = entry.value;
                return TextFormField(
                  controller: optionCtrl,
                  decoration: InputDecoration(
                    labelText: 'Option ${options[index]}',
                    filled: true,
                    // isDense: true,
                    fillColor: Color(0xFFF7F8F9),
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  ),
                );
              }),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final questionData = {
                      'title': _questionCtrl.text,
                      'options': Map.fromEntries(_optionsValues.entries.map(
                          (entry) => MapEntry(
                              entry.key, entry.value.text.isNotEmpty))),
                    };
                    _sendDataToFirebase(questionData);
                  } else {
                    _showSnackbar(
                        success: false,
                        text: 'Please fill all the required fields.');
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF7456F6),
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xFF7456F6), width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  // padding:
                  //     const EdgeInsets.symmetric(vertical: 25, horizontal: 195),
                ),
                child: Text('Submit',
                    style: GoogleFonts.poppins(
                        fontSize: 13.0,
                        color: Color.fromARGB(255, 255, 255, 255))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _sendDataToFirebase(Map<String, dynamic> data) async {
    final url = Uri.parse(
        'https://tugas-ce54e-default-rtdb.firebaseio.com/questions.json');
    try {
      final response = await http.post(
        url,
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        _showSnackbar(success: true, text: 'Question submitted successfully.');
      } else {
        _showSnackbar(
            success: false,
            text:
                'Failed to submit question. Status code: ${response.statusCode}');
      }
    } catch (error) {
      _showSnackbar(success: false, text: 'Failed to submit question: $error');
    }
  }
}

const options = ['A', 'B', 'C', 'D'];
