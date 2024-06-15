import 'package:flutter/material.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  List<Map<String, dynamic>> events = [
    {
      'title': 'Event 1',
      'description': 'Women empowerment day event',
      'date': '30th June, 2024',
      'location': 'Lower Kabete, Spring Valley Road',
      'image': 'assets/images/women1.jpg',
      'category': 'Empowerment',
    },
    {
      'title': 'Event 2',
      'description': 'Meet and greet event.',
      'date': 'June 22, 2024',
      'location': 'KICC',
      'image': 'assets/images/women1.jpg',
      'category': 'Networking',
    },
    {
      'title': 'Event 3',
      'description': 'Mental health awareness meet up.',
      'date': 'June 25, 2024',
      'location': 'Nairobi Kenya',
      'image': 'assets/images/women1.jpg',
      'category': 'Health',
    },
  ];

  List<Map<String, dynamic>> filteredEvents = [];

  @override
  void initState() {
    super.initState();
    filteredEvents = events;
  }

  void _filterEvents(String query) {
    List<Map<String, dynamic>> filteredList = events
        .where((event) =>
            event['title']!.toLowerCase().contains(query.toLowerCase()) ||
            event['description']!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      filteredEvents = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events Page'),
        backgroundColor: Colors.purple, // theme color purple
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: _filterEvents,
              decoration: InputDecoration(
                labelText: 'Search Events',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Upcoming Events',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple, // Set text color to purple
                    ),
                  ),
                  SizedBox(height: 20),
                  ...filteredEvents.map((event) => EventCard(
                        title: event['title']!,
                        description: event['description']!,
                        date: event['date']!,
                        location: event['location']!,
                        image: event['image']!,
                        category: event['category']!,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String location;
  final String image;
  final String category;

  EventCard({
    required this.title,
    required this.description,
    required this.date,
    required this.location,
    required this.image,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EventDetailsPage(
                title: title,
                description: description,
                date: date,
                location: location,
                image: image,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(image, fit: BoxFit.cover),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple, // Set text color to purple
                ),
              ),
              SizedBox(height: 10),
              Text(
                category,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.purple.shade200,
                ),
              ),
              SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                date,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                location,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle RSVP action
                    },
                    child: Text('RSVP'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple, // Set button color to purple
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.share, color: Colors.purple),
                    onPressed: () {
                      // Handle share action
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EventDetailsPage extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String location;
  final String image;

  EventDetailsPage({
    required this.title,
    required this.description,
    required this.date,
    required this.location,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.purple, // Set theme color to purple
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image, fit: BoxFit.cover),
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.purple, // Set text color to purple
              ),
            ),
            SizedBox(height: 10),
            Text(
              date,
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            Text(
              location,
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Text(
              description,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle add to calendar action
              },
              child: Text('Add to Calendar'),
              style: ElevatedButton.styleFrom(
                primary: Colors.purple, // Set button color to purple
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Comments & Reviews',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5, // we use a fixed number of comments
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('User $index'),
                  subtitle: Text('This is a comment/review.'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
