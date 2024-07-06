import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_me/page.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _feedback = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Settings();
            }));
          },
        ),
        title: Transform.translate(
          offset: Offset(10.0, 20.0), // Mengatur posisi title dengan offset
          child: Text(
            'Feedback',
            style: GoogleFonts.poppins(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        toolbarHeight: 100.0, // Mengatur tinggi AppBar jika diperlukan
      ),
      backgroundColor: Color(0xFF7456F6),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text('Silahkan isi form dibawah ini..',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 17,
                    )),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'Masukkan nama anda',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Masukkan e-mail anda',
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText:
                      'Silahkan tulis apa yang sedang terlintas dipikiran anda',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Feedback',
                ),
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your feedback';
                  }
                  return null;
                },
                onSaved: (value) {
                  _feedback = value!;
                },
              ),
              SizedBox(height: 200),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(
                      200, 50), // Mengatur ukuran tombol (lebar dan tinggi)
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Proses feedback
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Processing Data')),
                    );
                    // Contoh: Tampilkan hasil feedback
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Thank you!'),
                        content: Text(
                            'Name: $_name\nEmail: $_email\nFeedback: $_feedback'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
