// main.dart
import 'package:flutter/material.dart';
import 'package:gbvapp/landingpage.dart';
import 'about_us.dart'; // Import the AboutUsPage
import 'myhomepage.dart'; // Import the MyHomePage
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeHaven',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingPage(),
    );
  }
}
