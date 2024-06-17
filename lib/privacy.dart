import 'package:flutter/material.dart';

class PrivacySettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy and Security Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Two-Factor Authentication'),
              trailing: Switch(
                value: false, // Add a state variable for this in a StatefulWidget if needed
                onChanged: (bool value) {
                  // Handle toggle
                },
              ),
            ),
            ListTile(
              title: Text('Change Password'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to change password screen
              },
            ),
            ListTile(
              title: Text('Privacy Policy'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to privacy policy screen
              },
            ),
            ListTile(
              title: Text('Terms of Service'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to terms of service screen
              },
            ),
          ],
        ),
      ),
    );
  }
}
