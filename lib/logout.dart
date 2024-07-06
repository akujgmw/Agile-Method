import 'package:flutter/material.dart';
import 'package:quiz_me/main.dart';

class LogoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logout'),
        backgroundColor: Colors.blue, // Background color seperti main.dart
      ),
      backgroundColor: Colors.blue, // Background color seperti main.dart
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              size: 100.0,
              color: Colors.white,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Tombol back to login ditekan
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyApp();
                }));
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blue,
                backgroundColor: Colors.white,
              ),
              child: Text('Back to Login'),
            ),
          ],
        ),
      ),
    );
  }
}
