import 'package:flutter/material.dart';

class FeedbackSettings extends StatefulWidget {
  @override
  _FeedbackSettingsState createState() => _FeedbackSettingsState();
}

class _FeedbackSettingsState extends State<FeedbackSettings> {
  final _formKey = GlobalKey<FormState>();
  String? _feedback;
  double _rating = 3.0;

  void _submitFeedback() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Here you can handle the feedback submission (e.g., send it to a server)
      print('Feedback: $_feedback');
      print('Rating: $_rating');
      // Show a confirmation message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Thank you for your feedback!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Your Feedback'),
                maxLines: 4,
                onSaved: (value) {
                  _feedback = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your feedback';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Text('Rate our app:'),
              Slider(
                value: _rating,
                onChanged: (newRating) {
                  setState(() {
                    _rating = newRating;
                  });
                },
                min: 1,
                max: 5,
                divisions: 4,
                label: '$_rating',
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitFeedback,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
