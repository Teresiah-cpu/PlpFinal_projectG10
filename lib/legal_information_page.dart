import 'package:flutter/material.dart';

class LegalInformationPage extends StatelessWidget {
  const LegalInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Legal Information'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          _buildSectionHeader('Steps to Follow When Hurt'),
          _buildCollapsibleText(
            '1. Register your guardian or seek available legal guidance.\n'
            '2. Report to the nearest police station and obtain an OB number.\n'
            '3. Visit a hospital, consult a doctor, and obtain a P3 form.\n'
            '4. Register the hospital details, doctor details, and upload the P3 form picture.',
          ),
          const SizedBox(height: 20),
          _buildSectionHeader('Legal Rights and Support'),
          _buildCollapsibleText(
            '1. You have the right to report any form of violence.\n'
            '2. You have the right to receive medical care and a P3 form.\n'
            '3. Legal aid services are available to support you.\n'
            '4. Confidentiality and privacy should be maintained throughout the process.',
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildCollapsibleText(String text) {
    return ExpansionTile(
      childrenPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      title: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
