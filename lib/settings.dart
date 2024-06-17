import 'package:flutter/material.dart';

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

class _ProfileSettings extends StatelessWidget {
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
          ElevatedButton(
            onPressed: () {
              // Implement avatar change functionality
            },
            child: Text('Change Avatar'),
          ),
        ],
      ),
    );
  }
}

class _NotificationSettings extends StatelessWidget {
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
            value: true, // Replace with a variable
            onChanged: (bool value) {
              // Handle the change
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
