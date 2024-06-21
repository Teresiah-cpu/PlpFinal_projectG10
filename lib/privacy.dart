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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChangePasswordScreen()),
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
                  MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()),
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
                  MaterialPageRoute(builder: (context) => TermsOfServiceScreen()),
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
      body: Center(
        child: Text('Terms of Service Screen'),
      ),
    );
  }
}
