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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FAQsScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Contact Support'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to contact support screen or open email
                _contactSupport(context);
              },
            ),
            ListTile(
              title: Text('Documentation'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to documentation screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DocumentationScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Community Forums'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to forums screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CommunityForumsScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _contactSupport(BuildContext context) {
    // Replace with your actual contact support logic, e.g., opening an email app or showing a contact form
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Contact Support'),
          content: Text('For support inquiries, please email support@example.com.'),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

// Dummy screens for demonstration purposes
class FAQsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs'),
      ),
      body: Center(
        child: Text('FAQs Screen'),
      ),
    );
  }
}

class DocumentationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Documentation'),
      ),
      body: Center(
        child: Text('Documentation Screen'),
      ),
    );
  }
}

class CommunityForumsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Forums'),
      ),
      body: Center(
        child: Text('Community Forums Screen'),
      ),
    );
  }
}
