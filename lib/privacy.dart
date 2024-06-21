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
                value:
                    false, // Add a state variable for this in a StatefulWidget if needed
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChangePasswordScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Privacy Policy'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to privacy policy screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PrivacyPolicyScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Terms of Service'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to terms of service screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TermsOfServiceScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmNewPasswordController = TextEditingController();

  void _changePassword() {
    if (_formKey.currentState!.validate()) {
      // Perform password change logic
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password successfully changed!')),
      );
    }
  }

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _oldPasswordController,
                decoration: InputDecoration(labelText: 'Old Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your old password';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _newPasswordController,
                decoration: InputDecoration(labelText: 'New Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your new password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _confirmNewPasswordController,
                decoration: InputDecoration(labelText: 'Confirm New Password'),
                obscureText: true,
                validator: (value) {
                  if (value != _newPasswordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _changePassword,
                  child: Text('Change Password'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: Center(
        child: Text('Privacy Policy Screen'),
      ),
    );
  }
}

class TermsOfServiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms of Service'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Text(
              'Terms of Service',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              '1. Introduction\n\nWelcome to She Advocates, a mobile application designed to support and empower individuals affected by gender-based violence (GBV). By accessing or using our services, you agree to be bound by these Terms of Service. Please read them carefully.',
            ),
            SizedBox(height: 16),
            Text(
              '2. Definitions\n\n"App": She Advocates mobile application.\n"User": Any person who downloads, installs, or uses the App.\n"We", "Us", "Our": The developers and administrators of She Advocates.\n"Content": All information, text, graphics, and other materials provided through the App.',
            ),
            SizedBox(height: 16),
            Text(
              '3. Eligibility\n\nUsers must be at least 13 years old to use the App. By using the App, you represent and warrant that you meet this age requirement.',
            ),
            SizedBox(height: 16),
            Text(
              '4. User Registration\n\nTo access certain features of the App, you may be required to register and create an account. You agree to provide accurate and complete information and to update your information as necessary. You are responsible for maintaining the confidentiality of your account and password.',
            ),
            SizedBox(height: 16),
            Text(
              '5. Acceptable Use\n\nUsers agree to use the App for lawful purposes only. You agree not to:\n- Post or transmit any content that is abusive, defamatory, or obscene.\n- Engage in any activity that could harm the App or its users.\n- Use the App for any unauthorized commercial purposes.',
            ),
            SizedBox(height: 16),
            Text(
              '6. Privacy\n\nWe value your privacy. Please review our Privacy Policy to understand how we collect, use, and share information about you.',
            ),
            SizedBox(height: 16),
            Text(
              '7. Reporting and Legal Assistance\n\nThe App provides tools to help users report incidents of GBV, including:\n- Emergency Contacts: Register a guardian or legal guidance.\n- Report Incidents: Fill in details such as police station and OB number.\n- Medical Records: Register hospital visits, doctor details, and upload P3 forms.',
            ),
            SizedBox(height: 16),
            Text(
              '8. Content Ownership and Rights\n\nAll content provided on the App is owned by or licensed to us. You may not reproduce, distribute, or create derivative works from any content without our express written permission.',
            ),
            SizedBox(height: 16),
            Text(
              '9. Disclaimers\n\nThe App is provided on an "as-is" and "as-available" basis. We do not guarantee that the App will be error-free or uninterrupted. We disclaim all warranties, express or implied, including any warranties of accuracy, reliability, and fitness for a particular purpose.',
            ),
            SizedBox(height: 16),
            Text(
              '10. Limitation of Liability\n\nTo the maximum extent permitted by law, we shall not be liable for any indirect, incidental, special, or consequential damages arising out of or in connection with your use of the App.',
            ),
            SizedBox(height: 16),
            Text(
              '11. Termination\n\nWe reserve the right to terminate or suspend your access to the App at any time, with or without notice, for any reason, including violation of these Terms of Service.',
            ),
            SizedBox(height: 16),
            Text(
              '12. Changes to Terms\n\nWe may modify these Terms of Service at any time. Any changes will be posted on this page, and your continued use of the App constitutes acceptance of the revised terms.',
            ),
            SizedBox(height: 16),
            Text(
              '13. Governing Law\n\nThese Terms of Service are governed by and construed in accordance with the laws of Kenya, without regard to its conflict of laws principles.',
            ),
            SizedBox(height: 16),
            Text(
              '14. Contact Us\n\nIf you have any questions about these Terms of Service, please contact us at:\n- Email: support@sheadvocates.com\n- Phone: +254 714 238 498',
            ),
            SizedBox(height: 16),
            Text(
              'Last Updated: 31/6/2024',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
