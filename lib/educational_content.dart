import 'package:flutter/material.dart';
import 'article_detail.dart'; // Import the new screen

class EducationalContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Educational Content'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns in the grid
            crossAxisSpacing: 16.0, // Space between columns
            mainAxisSpacing: 16.0, // Space between rows
            childAspectRatio: 0.7, // Aspect ratio of each grid item
          ),
          itemCount: articleList.length,
          itemBuilder: (context, index) {
            final article = articleList[index];
            return ArticleCard(
              title: article['title']!,
              content: article['content']!,
              imageUrl: article['imageUrl']!,
              isAssetImage: true, // Add this parameter to indicate it's an asset image
            );
          },
        ),
      ),
    );
  }
}

class ArticleCard extends StatelessWidget {
  final String title;
  final String content;
  final String imageUrl;
  final bool isAssetImage; // Add this parameter

  ArticleCard({
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.isAssetImage,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetail(
              title: title,
              content: content,
              imageUrl: imageUrl,
              isAssetImage: isAssetImage, // Pass this to the detail page
            ),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: isAssetImage
                    ? Image.asset(imageUrl, fit: BoxFit.cover)
                    : Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Center(
                            child: Icon(
                              Icons.broken_image,
                              size: 50,
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),
              ),
              SizedBox(height: 8.0),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                content,
                maxLines: 2, // Limit the number of lines to show
                overflow: TextOverflow.ellipsis, // Add ellipsis if the text is too long
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final List<Map<String, String>> articleList = [
  {
    'title': 'Understanding Women\'s Rights',
    'content': 'An in-depth look at the history and importance of women\'s rights...',
    'imageUrl': 'Poster_1.jpeg', // Use the local asset path
  },
  {
    'title': 'Empowerment Strategies',
    'content': 'Learn about various strategies to empower women in different communities...',
    'imageUrl': 'mental_health1.jpeg', // Use the local asset path
  },
  {
    'title': 'Mental Health Awareness',
    'content': 'Mental health is a critical aspect of overall well-being...',
    'imageUrl': 'mental_health2.jpeg', // Use the local asset path
  },
  // Add more articles here
];
