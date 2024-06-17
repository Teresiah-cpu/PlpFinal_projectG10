import 'package:flutter/material.dart';
import 'landingpage.dart'; // Import the LandingPage
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
        primarySwatch: Colors.purple,
      ),
      home: LandingPage(), // Initial page
    );
  }
}
