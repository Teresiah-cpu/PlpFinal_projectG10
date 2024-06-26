import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HelpSettings(),
  ));
}

class HelpSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help and Support'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('FAQs'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FAQsScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Contact Support'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                _contactSupport(context);
              },
            ),
            ListTile(
              title: Text('Documentation'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DocumentationScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Community Forums'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CommunityForumsScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _contactSupport(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Contact Support'),
          content: Text('For support inquiries, please email sheadvocate@gmail.com.'),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
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

class FAQsScreen extends StatelessWidget {
  final List<Map<String, String>> faqs = [
    {
      'question': 'What is She Advocates?',
      'answer': 'She Advocates is a platform dedicated to empowering women through various programs, events, and educational content.',
    },
    {
      'question': 'How can I get involved?',
      'answer': 'You can get involved by participating in our events, joining our community forums, or contributing to our cause through donations.',
    },
    {
      'question': 'Is there a membership fee?',
      'answer': 'No, She Advocates is free to join and participate. We believe in inclusive empowerment for all women.',
    },
    {
      'question': 'How can I contact support?',
      'answer': 'For support inquiries, please email us at sheadvocate@gmail.com.',
    },
    {
      'question': 'What types of events do you organize?',
      'answer': 'We organize a variety of events including workshops, seminars, networking events, and health awareness programs.',
    },
    {
      'question': 'Can I volunteer for She Advocates?',
      'answer': 'Yes, we welcome volunteers! Please contact us at sheadvocate@gmail.com for more information on how you can help.',
    },
    {
      'question': 'How can I stay updated with the latest news and events?',
      'answer': 'You can stay updated by subscribing to our newsletter, following us on social media, or regularly checking our website.',
    },
    {
      'question': 'Do you offer any online resources?',
      'answer': 'Yes, we offer a variety of online resources including articles, videos, and downloadable content to help empower and educate women.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: faqs.length,
          itemBuilder: (context, index) {
            return ExpansionTile(
              title: Text(
                faqs[index]['question']!,
                style: GoogleFonts.lato(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    faqs[index]['answer']!,
                    style: GoogleFonts.lato(fontSize: 16),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class DocumentationScreen extends StatelessWidget {
  final List<Map<String, String>> sections = [
    {
      'title': 'Getting Started',
      'content': 'Welcome to She Advocates! Here you will find information on how to navigate the platform and get involved in our initiatives.',
    },
    {
      'title': 'Events and Programs',
      'content': 'Learn about upcoming events, programs, and educational content that empower and support women in various fields.',
    },
    {
      'title': 'Community Forums',
      'content': 'Join our community forums to engage with like-minded individuals, share experiences, and discuss women empowerment topics.',
    },
    {
      'title': 'Contact Support',
      'content': 'For any technical support or general inquiries, please email us at sheadvocate@gmail.com.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Documentation'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: sections.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text(
                  sections[index]['title']!,
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    sections[index]['content']!,
                    style: GoogleFonts.lato(fontSize: 16),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CommunityForumsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Forums'),
        backgroundColor: Colors.purple,
      ),
      body: CommunityForumsBody(),
    );
  }
}

class CommunityForumsBody extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {
      'title': 'General Discussions',
      'description': 'Talk about anything related to women empowerment and support.',
    },
    {
      'title': 'Support and Advice',
      'description': 'Ask for advice and support from the community.',
    },
    {
      'title': 'Success Stories',
      'description': 'Share your success stories and inspire others.',
    },
    {
      'title': 'Events and Meetups',
      'description': 'Discuss upcoming events and meetups.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text(
                categories[index]['title']!,
                style: GoogleFonts.lato(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              subtitle: Text(
                categories[index]['description']!,
                style: GoogleFonts.lato(fontSize: 16),
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ThreadsScreen(categoryTitle: categories[index]['title']!),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ThreadsScreen extends StatelessWidget {
  final String categoryTitle;

  ThreadsScreen({required this.categoryTitle});

  final List<Map<String, String>> threads = [
    {
      'title': 'Welcome to the General Discussions',
      'creator': 'Admin',
      'createdAt': '2024-01-01',
    },
    {
      'title': 'How to Get Involved?',
      'creator': 'User1',
      'createdAt': '2024-01-02',
    },
    {
      'title': 'Share Your Success Story',
      'creator': 'User2',
      'createdAt': '2024-01-03',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: threads.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text(
                  threads[index]['title']!,
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                subtitle: Text(
                  'Created by ${threads[index]['creator']} on ${threads[index]['createdAt']}',
                  style: GoogleFonts.lato(fontSize: 16),
                ),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostsScreen(threadTitle: threads[index]['title']!),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class PostsScreen extends StatelessWidget {
  final String threadTitle;

  PostsScreen({required this.threadTitle});

  final List<Map<String, String>> posts = [
    {
      'content': 'Welcome to the community! Feel free to introduce yourself.',
      'creator': 'Admin',
      'createdAt': '2024-01-01',
    },
    {
      'content': 'Hi everyone! I am excited to be here and support the cause.',
      'creator': 'User1',
      'createdAt': '2024-01-02',
    },
    {
      'content': 'Looking forward to connecting with like-minded individuals.',
      'creator': 'User2',
      'createdAt': '2024-01-03',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(threadTitle),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(
                        posts[index]['content']!,
                        style: GoogleFonts.lato(fontSize: 16),
                      ),
                      subtitle: Text(
                        'Posted by ${posts[index]['creator']} on ${posts[index]['createdAt']}',
                        style: GoogleFonts.lato(fontSize: 14),
                      ),
                    ),
                  );
                },
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Write a reply...',
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Add post to Firestore
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
