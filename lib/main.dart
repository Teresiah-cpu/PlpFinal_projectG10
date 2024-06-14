// main.dart
import 'package:flutter/material.dart';
//import 'about_us.dart'; // Import the AboutUsPage
import 'landingpage.dart';
import 'myhomepage.dart'; // Import the MyHomePage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'She Advocates',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingPage(),
    );
  }
}
