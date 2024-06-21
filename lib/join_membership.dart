import 'package:flutter/material.dart';

class JoinMembershipPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Join Membership'),
        backgroundColor: Colors.purple,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9, // aspect ratio
                  child: Image.network(
                    'https://media.istockphoto.com/id/1432208095/photo/army-doctor-playing-with-refugee-children-at-a-community-center.jpg?s=612x612&w=0&k=20&c=T9PU1CGNuf74yzyD3EJZK_5s7fvAo9tSJFTY-aAM04o=',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Become a Member',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Join our membership program and enjoy exclusive benefits.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  'Membership Benefits:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  '- Access to exclusive events\n- Networking opportunities\n- Special discounts',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle membership sign-up
                  },
                  style: ElevatedButton.styleFrom(
                   primary: Colors.purple,
                  ),
                  child: Text('Join Now'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
