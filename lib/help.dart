import 'package:flutter/material.dart';

class HelpSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help and Support'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('FAQs'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to FAQs screen
              },
            ),
            ListTile(
              title: Text('Contact Support'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to contact support screen or open email
              },
            ),
            ListTile(
              title: Text('Documentation'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to documentation screen
              },
            ),
            ListTile(
              title: Text('Community Forums'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to forums screen
              },
            ),
          ],
        ),
      ),
    );
  }
}
