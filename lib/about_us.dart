import 'package:flutter/material.dart';
import 'package:gbvapp/legal_information_page.dart';
import 'package:gbvapp/legal_process_page.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildImageHeader(),
            SizedBox(height: 20),
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
            Divider(),
            _buildSectionHeader('Contact Us'),
            _buildContactInfo('Email', 'support@sheadvocates.com'),
            _buildContactInfo('Phone', '+123 456 7890'),
            Divider(),
            SizedBox(height: 20),
            _buildSectionHeader('Legal Information'),
            _buildLegalInfoButton(context),
            SizedBox(height: 20),
            _buildSectionHeader('Interactive Steps'),
            _buildInteractiveStepsButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildImageHeader() {
    return Center(
      child: Image.asset(
        'assets/images/about_us_header.jpg', // header image 
        height: 200,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple),
      ),
    );
  }

  Widget _buildCollapsibleText(String text) {
    return ExpansionTile(
      title: Text(
        text,
        style: TextStyle(fontSize: 16, color: Colors.black87),
      ),
      childrenPadding: EdgeInsets.symmetric(horizontal: 16.0),
      children: <Widget>[
        Text(
          text,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildContactInfo(String title, String value) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      title: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        value,
        style: TextStyle(fontSize: 14, color: Colors.purple),
      ),
    );
  }

  Widget _buildLegalInfoButton(BuildContext context) {
    return Center(
      child: IconButton(
        icon: Image.asset('images/legalimage.png'),
        iconSize: 100,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LegalInformationPage()),
          );
        },
      ),
    );
  }

  Widget _buildInteractiveStepsButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LegalProcessPage()),
          );
        },
        child: Text('I\'m Hurt - Start Process'),
        style: ElevatedButton.styleFrom(
          primary: Colors.purple,
          onPrimary: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        ),
      ),
    );
  }
}
