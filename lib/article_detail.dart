import 'package:flutter/material.dart';

class ArticleDetail extends StatelessWidget {
  final Map<String, dynamic> article;

  ArticleDetail({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article['title']),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(article['imageUrl'], fit: BoxFit.cover),
              ),
              SizedBox(height: 16.0),
              Text(
                article['title'],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              ...article['sections'].map<Widget>((section) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      section['heading'],
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    Text(section['content']),
                    SizedBox(height: 16.0),
                  ],
                );
              }).toList(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.bookmark_border),
                    onPressed: () {
                      // Implement bookmark functionality
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Article bookmarked!')),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.comment),
                    onPressed: () {
                      // Implement commenting functionality
                      // Navigate to a new page or show a dialog for commenting
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Add a Comment'),
                          content: TextField(
                            decoration: InputDecoration(hintText: 'Enter your comment'),
                          ),
                          actions: [
                            TextButton(
                              child: Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text('Submit'),
                              onPressed: () {
                                // Handle comment submission
                                Navigator.of(context).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Comment submitted!')),
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {
                      // Implement share functionality
                      // Use a package like share_plus to share content
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Share functionality not implemented')),
                      );
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
