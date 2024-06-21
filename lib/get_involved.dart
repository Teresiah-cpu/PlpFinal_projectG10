import 'package:flutter/material.dart';
import 'volunteer.dart'; // Import Volunteer Page
import 'donate.dart'; // Import Donate Page
import 'join_membership.dart'; // Import Join Membership Page
import 'events.dart'; // Import Events Page

class GetInvolvedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Involved'),
        backgroundColor: Colors.white,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VolunteerPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.money, color: Colors.purple),
              title: Text('Donate'),
              subtitle: Text('Support our mission with a donation.'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DonatePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.event_seat_rounded, color: Colors.purple),
              title: Text('Attend Events'),
              subtitle: Text('Participate in our upcoming events.'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EventsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.group_add, color: Colors.purple),
              title: Text('Become a Member'),
              subtitle: Text('Join our membership program.'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JoinMembershipPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
