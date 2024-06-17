import 'package:flutter/material.dart';
import 'donate.dart';
import 'events.dart';
import 'get_involved.dart';
import 'join_membership.dart';
import 'landingpage.dart';
import 'myhomepage.dart';
import 'volunteer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'She Advocates',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: LandingPage(),
      routes: {
        '/home': (context) => MyHomePage(),
        '/get_involved': (context) => GetInvolvedPage(),
        '/volunteer': (context) => VolunteerPage(),
        '/donate': (context) => DonatePage(),
        '/events': (context) => EventsPage(),
        '/join_membership': (context) => JoinMembershipPage(),
      },
    );
  }
}
