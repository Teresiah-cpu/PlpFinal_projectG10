import 'package:flutter/material.dart';

class NotificationSettings extends StatefulWidget {
  @override
  _NotificationSettingsState createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  bool _notificationsEnabled = true;
  bool _newMessage = true;
  bool _appUpdates = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
            SwitchListTile(
              title: Text('New Message Notifications'),
              value: _newMessage,
              onChanged: (bool value) {
                setState(() {
                  _newMessage = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('App Update Notifications'),
              value: _appUpdates,
              onChanged: (bool value) {
                setState(() {
                  _appUpdates = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
