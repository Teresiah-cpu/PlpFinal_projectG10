import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:add_2_calendar/add_2_calendar.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  List<Map<String, dynamic>> events = [
    {
      'title': 'Event 1',
      'description': 'Women empowerment day event',
      'date': '2024-06-30',
      'location': 'Lower Kabete, Spring Valley Road',
      'image': 'assets/images/women1.jpg',
      'category': 'Empowerment',
    },
    {
      'title': 'Event 2',
      'description': 'Meet and greet event.',
      'date': '2024-06-22',
      'location': 'KICC',
      'image': 'assets/images/women1.jpg',
      'category': 'Networking',
    },
    {
      'title': 'Event 3',
      'description': 'Mental health awareness meet up.',
      'date': '2024-06-25',
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
        title: Text('Events'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 4.0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: _filterEvents,
              decoration: InputDecoration(
                labelText: 'Search Events',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: filteredEvents.length,
              itemBuilder: (context, index) {
                final event = filteredEvents[index];
                return EventCard(
                  title: event['title']!,
                  description: event['description']!,
                  date: event['date']!,
                  location: event['location']!,
                  image: event['image']!,
                  category: event['category']!,
                );
              },
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

  Future<void> showRSVPDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('RSVP Confirmation'),
          content: Text('Do you want to RSVP to this event?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('RSVP'),
              onPressed: () {
                // Handle RSVP action here
                // For now, just close the dialog
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
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
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(image, fit: BoxFit.cover),
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    date,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  Text(
                    location,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showRSVPDialog(context);
                    },
                    child: Text('RSVP'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      onPrimary: Colors.white,
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

  Event buildEvent() {
    return Event(
      title: title,
      description: description,
      location: location,
      startDate: DateTime.parse(date),
      endDate: DateTime.parse(date).add(Duration(hours: 2)),
    );
  }

  Future<void> addToCalendar(BuildContext context) async {
    try {
      bool success = await Add2Calendar.addEvent2Cal(buildEvent());
      if (success) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Event added to calendar'),
              content: Text('You have added this event to your calendar.'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Failed to add event to calendar'),
              content: Text('There was an error adding this event to your calendar.'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print('Error adding event to calendar: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Error adding event to calendar.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 4.0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(image, fit: BoxFit.cover),
            ),
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
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
            ElevatedButton.icon(
              onPressed: () {
                addToCalendar(context);
              },
              icon: Icon(Icons.calendar_today),
              label: Text('Add to Calendar'),
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                onPrimary: Colors.white,
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
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    'User $index',
                    style: GoogleFonts.lato(),
                  ),
                  subtitle: Text(
                    'This is a comment/review.',
                    style: GoogleFonts.lato(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: EventsPage(),
  ));
}
