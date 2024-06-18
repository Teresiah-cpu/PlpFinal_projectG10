import 'package:flutter/material.dart';
import 'about_us.dart'; // Import the AboutUsPage
import 'events.dart'; // Import the EventsPage
import 'get_involved.dart'; // Import the GetInvolvedPage

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    AboutUsPage(), // The About Us Page
    EventsPage(), // The Events Page
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('She Advocates Home'),
        backgroundColor: Colors.purple,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About Us',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Events',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Welcome to She Advocates!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                // Adjusts Image Widgets with AspectRatio
                AspectRatio(
                  aspectRatio: 16 / 9, // Setting aspect ratio
                  child: Image.network(
                    'https://media.istockphoto.com/id/1871948873/photo/group-of-businesswomen-meeting-in-the-office.webp?b=1&s=170667a&w=0&k=20&c=UVJ8wuJLyk4kxVLv8WthRiS4eJrbRETCdUtaNlZv1x0=',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Empowering Women, One Step at a Time',
                  style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                // Adjust Image Widgets with AspectRatio
                AspectRatio(
                  aspectRatio: 16 / 9, // Set aspect ratio
                  child: Image.network(
                    'https://media.istockphoto.com/id/1950525700/photo/multiracial-women-posing-in-the-office-while-looking-into-the-camera.jpg?s=612x612&w=0&k=20&c=2fkz8aIl3CHC09cB2Q8ruSGgjTrI7OQgrxirS7Q5Yg0=',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Join us in our journey to uplift and support women in all spheres of life.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GetInvolvedPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                  child: Text('Get Involved'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
