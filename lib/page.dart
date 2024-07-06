import 'package:flutter/material.dart';
import 'package:quiz_me/faq_screen.dart';
import 'package:quiz_me/feedback.dart';
import 'package:quiz_me/home-again.dart';
import 'myaccount.dart';
import 'friend.dart';
import 'logout.dart';
import 'user/user.dart'; // Import LogoutPage

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MyHome();
            }));
          },
        ),
      ),
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ProfilePage();
                        }));
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR5Wc5rU5uTHIotAQhMLS4Rw_TvrXkHsrx-tsS7sFiYUpGAzxyf'),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nama Pengguna',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ]),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  buildSettingsItem(
                      Icons.account_circle, 'My Account', context),
                  buildSettingsItem(Icons.people, 'Friend', context),
                  buildSettingsItem(
                      Icons.message_outlined, 'Feedback', context),
                  buildSettingsItem(
                      Icons.help_outline, 'FaQ', context), // Tombol Friend
                  buildSettingsItem(
                      Icons.exit_to_app, 'Log Out', context), // Tombol Log Out
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSettingsItem(IconData icon, String text, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        leading: Icon(icon),
        title: Text(text),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          if (text == 'My Account') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AccountDetailsPage()),
            );
          } else if (text == 'Friend') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FriendPage()),
            );
          } else if (text == 'Feedback') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FeedbackPage()),
            );
          } else if (text == 'FaQ') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ExpansionTileApp()),
            );
          } else if (text == 'Log Out') {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LogoutPage()), // Arahkan ke LogoutPage
            );
          } else {
            // handle other items if needed
          }
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SettingsPage(),
    debugShowCheckedModeBanner: false,
  ));
}
