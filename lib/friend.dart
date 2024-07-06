import 'package:flutter/material.dart';
import 'package:quiz_me/page.dart';

class FriendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friend'),
        backgroundColor: Colors.blue, // Background color seperti main.dart
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Settings();
            }));
          },
        ),
      ),
      backgroundColor: Colors.blue, // Background color seperti main.dart
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            Text(
              'Friend Request',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            _buildFriendRequestCard(),
            SizedBox(height: 20.0),
            Text(
              'Friends',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            _buildFriendItem('Friend 1'),
            _buildFriendItem('Friend 2'),
            // Tambahkan item friend lainnya sesuai kebutuhan
          ],
        ),
      ),
    );
  }

  Widget _buildFriendRequestCard() {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Icon(Icons.account_circle),
            SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Friend Request',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 5.0),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Tombol accept ditekan
                      },
                      child: Text('Accept'),
                    ),
                    SizedBox(width: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        // Tombol ignore ditekan
                      },
                      child: Text('Ignore'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFriendItem(String friendName) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Icon(Icons.account_circle),
            SizedBox(width: 10.0),
            Text(
              friendName,
              style: TextStyle(fontSize: 16.0),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Tombol invite ditekan
              },
              child: Text('Invite'),
            ),
          ],
        ),
      ),
    );
  }
}
