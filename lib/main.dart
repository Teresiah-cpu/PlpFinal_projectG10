import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'donate.dart';
import 'events.dart';
import 'get_involved.dart';
import 'join_membership.dart';
import 'landingpage.dart';
import 'myhomepage.dart';
import 'volunteer.dart';
=======
import 'about_us.dart'; // Import the AboutUsPage
import 'landingpage.dart';
import 'myhomepage.dart'; // Import the MyHomePage
import 'educational_content.dart';
import 'settings.dart'; // Import the SettingsScreen
>>>>>>> Ruth

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
<<<<<<< HEAD
        '/home': (context) => MyHomePage(),
        '/get_involved': (context) => GetInvolvedPage(),
        '/volunteer': (context) => VolunteerPage(),
        '/donate': (context) => DonatePage(),
        '/events': (context) => EventsPage(),
        '/join_membership': (context) => JoinMembershipPage(),
=======
        '/about_us': (context) => AboutUsPage(),
        '/my_homepage': (context) => MyHomePage(),
        '/educational_content': (context) => EducationalContent(),
        '/settings': (context) => SettingsScreen(), // Add this line
>>>>>>> Ruth
      },
    );
  }
}
