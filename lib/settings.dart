import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              _showProfileSettings(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () {
              _showNotificationSettings(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
            onTap: () {
              _showLanguageSettings(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.security),
            title: Text('Privacy and Security'),
            onTap: () {
              _showPrivacySettings(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.color_lens),
            title: Text('Appearance'),
            onTap: () {
              _showAppearanceSettings(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help and Support'),
            onTap: () {
              _showHelpSettings(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.feedback),
            title: Text('Feedback'),
            onTap: () {
              _showFeedbackSettings(context);
            },
          ),
        ],
      ),
    );
  }

  void _showProfileSettings(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return _ProfileSettings();
      },
    );
  }

  void _showNotificationSettings(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return _NotificationSettings();
      },
    );
  }

  void _showLanguageSettings(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return _LanguageSettings();
      },
    );
  }

  void _showPrivacySettings(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return _PrivacySettings();
      },
    );
  }

  void _showAppearanceSettings(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return _AppearanceSettings();
      },
    );
  }

  void _showHelpSettings(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return _HelpSettings();
      },
    );
  }

  void _showFeedbackSettings(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return _FeedbackSettings();
      },
    );
  }
}

class _ProfileSettings extends StatefulWidget {
  @override
  __ProfileSettingsState createState() => __ProfileSettingsState();
}

class __ProfileSettingsState extends State<_ProfileSettings> {
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: 'Name',
            ),
          ),
          SizedBox(height: 16),
          _image != null
              ? Image.file(_image!, height: 100)
              : Container(),
          ElevatedButton(
            onPressed: _pickImage,
            child: Text('Change Avatar'),
          ),
        ],
      ),
    );
  }
}

class _NotificationSettings extends StatefulWidget {
  @override
  __NotificationSettingsState createState() => __NotificationSettingsState();
}

class __NotificationSettingsState extends State<_NotificationSettings> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SwitchListTile(
            title: Text('Enable Notifications'),
            value: _notificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
          ),
          ListTile(
            title: Text('Notification Preferences'),
            onTap: () {
              // Navigate to notification preferences
            },
          ),
        ],
      ),
    );
  }
}

class _LanguageSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Select Language'),
          // Add your language selection widgets here
          ListTile(
            title: Text('English'),
            onTap: () {
              // Set language to English
            },
          ),
          ListTile(
            title: Text('Spanish'),
            onTap: () {
              // Set language to Spanish
            },
          ),
        ],
      ),
    );
  }
}

class _PrivacySettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Privacy and Security Settings'),
          // Add your privacy and security widgets here
        ],
      ),
    );
  }
}

class _AppearanceSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Appearance Settings'),
          // Add your appearance widgets here
          ListTile(
            title: Text('Dark Mode'),
            trailing: Switch(
              value: false,
              onChanged: (bool value) {
                // Handle dark mode toggle
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _HelpSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Help and Support'),
          // Add your help and support widgets here
        ],
      ),
    );
  }
}

class _FeedbackSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Feedback'),
          // Add your feedback widgets here
        ],
      ),
    );
  }
}
