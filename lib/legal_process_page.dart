import 'package:flutter/material.dart';

class LegalProcessPage extends StatefulWidget {
  @override
  _LegalProcessPageState createState() => _LegalProcessPageState();
}

class _LegalProcessPageState extends State<LegalProcessPage> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Legal Process Steps'),
      ),
      body: Stepper(
        type: StepperType.vertical,
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep < _getSteps().length - 1) {
            
            setState(() {
              _currentStep += 1;
            });
          } else {
            // Handle final submission here
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep -= 1;
            });
          }
        },
        steps: _getSteps(),
      ),
    );
  }

  List<Step> _getSteps() {
    return [
      Step(
        title: Text('Register Guardian'),
        content: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Guardian Name'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Guardian Phone Number'),
            ),
          ],
        ),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: Text('Seek Legal Guidance'),
        content: Column(
          children: [
            Text('Available Legal Guidance:'),
            ListTile(
              title: Text('Legal Aid Center 1'),
              subtitle: Text('Contact: +123 456 7890'),
            ),
            ListTile(
              title: Text('Legal Aid Center 2'),
              subtitle: Text('Contact: +123 456 7891'),
            ),
          ],
        ),
        isActive: _currentStep >= 1,
      ),
      Step(
        title: Text('Report to Police'),
        content: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Police Station'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'OB Number'),
            ),
          ],
        ),
        isActive: _currentStep >= 2,
      ),
      Step(
        title: Text('Register Medical Information'),
        content: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Hospital Name'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Doctor Name'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement image picker to upload P3 form picture
              },
              child: Text('Upload P3 Form Picture'),
            ),
          ],
        ),
        isActive: _currentStep >= 3,
      ),
      Step(
        title: Text('Review and Submit'),
        content: Column(
          children: [
            Text('Review all the information you have provided and submit.'),
            ElevatedButton(
              onPressed: () {
                // Implement submission logic here
              },
              child: Text('Submit'),
            ),
          ],
        ),
        isActive: _currentStep >= 4,
      ),
    ];
  }
}
