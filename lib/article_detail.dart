import 'package:flutter/material.dart';

class ArticleDetail extends StatelessWidget {
  final String title;
  final String content;
  final String imageUrl;
  final bool isAssetImage; // Add this parameter

  ArticleDetail({
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.isAssetImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isAssetImage
                ? Image.asset(imageUrl)
                : Image.network(imageUrl),
            SizedBox(height: 16.0),
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(content),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.bookmark_border),
                  onPressed: () {
                    // Implement bookmark action
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Article bookmarked'),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {
                    // Implement share action
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Article shared'),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.comment),
                  onPressed: () {
                    // Implement comment action
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Comment feature coming soon'),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
