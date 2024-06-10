import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AboutUsPage extends StatelessWidget {
  BuildContext? get context => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildSectionHeader('Mission'),
            _buildCollapsibleText(
              'To empower and support individuals affected by gender-based violence through technology, providing immediate assistance, resources, and a supportive community.',
            ),
            SizedBox(height: 20),
            _buildSectionHeader('Vision'),
            _buildCollapsibleText(
              'A world where everyone, regardless of gender, can live free from violence and discrimination.',
            ),
            SizedBox(height: 20),
            _buildSectionHeader('Contact Us'),
            _buildContactInfo('Email', 'support@sheadvocates.com'),
            _buildContactInfo('Phone', '+123 456 7890'),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildCollapsibleText(String text) {
    return ExpansionTile(
      childrenPadding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      title: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildContactInfo(String title, String value) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
      subtitle: Text(
        value,
        style: TextStyle(fontSize: 14),
      ),
      onTap: () {
        _copyToClipboard(value, context!);
      },
    );
  }

  void _copyToClipboard(String value, BuildContext context) {
    Clipboard.setData(ClipboardData(text: value));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$value copied to clipboard'),
      ),
    );
  }
}