import 'package:flutter/material.dart';

class VolunteerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Volunteer with Us'),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network('https://via.placeholder.com/400x200', height: 200, width: 400),
            SizedBox(height: 20),
            Text(
              'Volunteer with Us',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Join our team of dedicated volunteers and make a difference in the community.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'As a volunteer, you can:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '- Participate in events and activities\n- Help with administrative tasks\n- Provide support to our members',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle volunteer sign-up
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
              ),
              child: Text('Register to Volunteer'),
            ),
          ],
        ),
      ),
    );
  }
}
