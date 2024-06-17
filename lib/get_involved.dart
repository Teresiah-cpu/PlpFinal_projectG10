import 'package:flutter/material.dart';

class GetInvolvedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Involved'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Get Involved',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'There are many ways to get involved with She Advocates:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.volunteer_activism, color: Colors.purple),
              title: Text('Volunteer with Us'),
              subtitle: Text('Join our team of dedicated volunteers.'),
              onTap: () {
                // Navigate to volunteer page or show more details
              },
            ),
            ListTile(
              leading: Icon(Icons.money, color: Colors.purple),
              title: Text('Donate'),
              subtitle: Text('Support our mission with a donation.'),
              onTap: () {
                // Navigate to donation page or show more details
              },
            ),
            ListTile(
              leading: Icon(Icons.people, color: Colors.purple),
              title: Text('Attend Events'),
              subtitle: Text('Participate in our upcoming events.'),
              onTap: () {
                // Navigate to events page or show more details
              },
            ),
            ListTile(
              leading: Icon(Icons.group_add, color: Colors.purple),
              title: Text('Become a Member'),
              subtitle: Text('Join our membership program.'),
              onTap: () {
                // Navigate to membership page or show more details
              },
            ),
          ],
        ),
      ),
    );
  }
}
