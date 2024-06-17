import 'package:flutter/material.dart';

class DonatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donate'),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network('https://media.istockphoto.com/id/1201199927/photo/black-woman-volunteer-packing-donation-boxes-in-charity-food-bank.jpg?s=612x612&w=0&k=20&c=FvOFLG2vG5wZR4GFQAonG9wLqgKlWNW1UT7nIx_1zVM=', height: 200, width: 400),
            SizedBox(height: 20),
            Text(
              'Donate to Our Cause',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Your donations help us to empower women in the community.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'You can donate via the following methods:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '1. Mobile Money:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Send your donations to the following MPESA number: +254741626119',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              '2. Bank Transfer:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Account Name: She Advocates Foundation\n'
              'Bank: Equity Bank\n'
              'Account Number: 1234567890\n'
              'Branch: Nairobi Branch\n',
              
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
