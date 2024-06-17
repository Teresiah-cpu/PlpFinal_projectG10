import 'package:flutter/material.dart';

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
              title: article['title'],
              content: article['content'],
              imageUrl: article['imageUrl'],
              articleData: article['articleData'],
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
  final Map<String, dynamic> articleData;

  ArticleCard({
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.articleData,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetail(article: articleData),
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
                child: Image.asset(imageUrl, fit: BoxFit.cover),
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
              Image.asset(article['imageUrl'], fit: BoxFit.cover),
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
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Article bookmarked!')),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.comment),
                    onPressed: () {
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

final List<Map<String, dynamic>> articleList = [
  {
    'title': 'Understanding Women\'s Rights',
    'content': 'An in-depth look at the history and importance of women\'s rights...',
    'imageUrl': 'assets/images/Let_it_Go.jpeg',
    'articleData': womensRightsArticle,
  },
  {
    'title': 'Empowerment Strategies',
    'content': 'Learn about various strategies to empower women in different communities...',
    'imageUrl': 'assets/images/mental_health_3.jpeg',
    'articleData': empowermentStrategiesArticle,
  },
  {
    'title': 'Mental Health Awareness',
    'content': 'Mental health is a critical aspect of overall well-being...',
    'imageUrl': 'assets/images/mental_health2.jpeg',
    'articleData': mentalHealthAwarenessArticle,
  },
  {
    'title': 'Health and Wellness',
    'content': 'Health and wellness are crucial for a fulfilling life...',
    'imageUrl': 'assets/images/health.jpeg',
    'articleData': healthAndWellnessArticle,
  },
  {
    'title': 'Community Support',
    'content': 'Community support plays a key role in women\'s empowerment...',
    'imageUrl': 'assets/images/POSTER_1.jpeg',
    'articleData': communitySupportArticle,
  },
  {
    'title': 'Stress Management',
    'content': 'Effective stress management techniques can improve quality of life...',
    'imageUrl': 'assets/images/mental_health1.jpeg',
    'articleData': stressManagementArticle,
  },
];

final Map<String, dynamic> womensRightsArticle = {
  'title': 'Understanding Women\'s Rights',
  'imageUrl': 'assets/images/Let_it_Go.jpeg',
  'sections': [
    {
      'heading': 'Introduction',
      'content': 'Women\'s rights are the fundamental human rights that were enshrined by the United Nations for every human being on the planet nearly 70 years ago. These rights include the right to live free from violence and discrimination; to enjoy the highest attainable standard of physical and mental health; to be educated; to own property; to vote; and to earn an equal wage.'
    },
    {
      'heading': 'Historical Background',
      'content': 'The struggle for women\'s rights has been ongoing for centuries. The movement can be traced back to the late 19th and early 20th centuries when women began to organize and demand equal rights. Key milestones include the women\'s suffrage movement, which led to women gaining the right to vote in many countries.'
    },
    {
      'heading': 'Key Issues',
      'content': 'Despite significant progress, many issues remain. These include gender-based violence, unequal pay, lack of access to education and healthcare, and underrepresentation in political and economic spheres. Addressing these issues is crucial for achieving gender equality.'
    },
    {
      'heading': 'Global Perspective',
      'content': 'Women\'s rights vary significantly around the world. In some regions, women enjoy almost equal rights with men, while in others, they face severe discrimination and oppression. International organizations like the UN Women and various NGOs are working tirelessly to promote women\'s rights globally.'
    },
    {
      'heading': 'Conclusion',
      'content': 'Understanding and advocating for women\'s rights is essential for building a more just and equitable world. Continued efforts are needed to address the ongoing challenges and to ensure that all women can enjoy their fundamental human rights.'
    },
  ],
};

final Map<String, dynamic> empowermentStrategiesArticle = {
  'title': 'Empowerment Strategies',
  'imageUrl': 'assets/images/mental_health_3.jpeg',
  'sections': [
    {
      'heading': 'Introduction',
      'content': 'Empowerment strategies are vital for enhancing the social, economic, and political status of women worldwide. These strategies can help women gain the skills, resources, and confidence they need to achieve their goals and contribute to their communities.'
    },
    {
      'heading': 'Community Empowerment',
      'content': 'Community empowerment involves organizing local resources to address issues affecting women. This can include education programs, health services, and advocacy for legal rights.'
    },
    {
      'heading': 'Economic Empowerment',
      'content': 'Economic empowerment focuses on providing women with opportunities to improve their financial status. This can be achieved through access to education, job training, and financial services like microloans.'
    },
    {
      'heading': 'Political Empowerment',
      'content': 'Political empowerment involves encouraging and supporting women to participate in political processes and leadership roles. This includes voting, running for office, and engaging in policy-making processes.'
    },
    {
      'heading': 'Personal Empowerment',
      'content': 'Personal empowerment includes building self-esteem and confidence, setting personal goals, and developing the skills needed to achieve them. This can involve mentorship, counseling, and self-help resources.'
    },
        {
      'heading': 'Conclusion',
      'content': 'Empowerment strategies play a crucial role in advancing gender equality and promoting sustainable development. By empowering women, societies can unlock their full potential and achieve inclusive growth and prosperity.'
    },
  ],
};

final Map<String, dynamic> mentalHealthAwarenessArticle = {
  'title': 'Mental Health Awareness',
  'imageUrl': 'assets/images/mental_health2.jpeg',
  'sections': [
    {
      'heading': 'Introduction',
      'content': 'Mental health awareness involves recognizing the importance of mental health and promoting strategies to improve it. It is essential to understand that mental health is just as important as physical health.'
    },
    {
      'heading': 'Common Mental Health Issues',
      'content': 'Some common mental health issues include depression, anxiety, bipolar disorder, and schizophrenia. These conditions can affect a person\'s thinking, feeling, mood, and behavior.'
    },
    {
      'heading': 'Stigma and Misconceptions',
      'content': 'Stigma and misconceptions about mental health can prevent people from seeking help. It is important to educate the public to reduce stigma and encourage individuals to seek the care they need.'
    },
    {
      'heading': 'Resources and Support',
      'content': 'There are many resources available for those struggling with mental health issues, including counseling, therapy, support groups, and medication. Reaching out for help is a sign of strength, not weakness.'
    },
    {
      'heading': 'Promoting Mental Health',
      'content': 'Promoting mental health involves creating supportive environments, fostering open conversations about mental health, and encouraging healthy lifestyle choices like exercise, nutrition, and sleep.'
    },
    {
      'heading': 'Conclusion',
      'content': 'Mental health awareness is crucial for building resilient communities and supporting individuals in achieving their full potential. By promoting mental well-being, societies can thrive and grow.'
    },
  ],
};

final Map<String, dynamic> healthAndWellnessArticle = {
  'title': 'Health and Wellness',
  'imageUrl': 'assets/images/health.jpeg',
  'sections': [
    {
      'heading': 'Introduction',
      'content': 'Health and wellness encompass a range of factors that contribute to a balanced and healthy lifestyle. This includes physical, mental, and social well-being.'
    },
    {
      'heading': 'Physical Health',
      'content': 'Maintaining physical health involves regular exercise, a balanced diet, adequate sleep, and preventive healthcare. It is important to listen to your body and address any health issues promptly.'
    },
    {
      'heading': 'Mental Health',
      'content': 'Mental health is an integral part of overall wellness. Practices such as mindfulness, stress management, and seeking professional help when needed can significantly improve mental well-being.'
    },
    {
      'heading': 'Social Well-being',
      'content': 'Social well-being involves having strong, supportive relationships and a sense of community. Engaging in social activities and maintaining connections with friends and family can enhance overall wellness.'
    },
    {
      'heading': 'Healthy Lifestyle Choices',
      'content': 'Making healthy lifestyle choices, such as avoiding tobacco, limiting alcohol, and managing stress, can contribute to long-term health and wellness. It is important to make informed decisions about your health.'
    },
    {
      'heading': 'Conclusion',
      'content': 'Health and wellness are essential for leading a fulfilling life and achieving personal happiness. By prioritizing both physical and mental well-being, individuals can thrive in all aspects of their lives.'
    },
  ],
};

final Map<String, dynamic> communitySupportArticle = {
  'title': 'Community Support',
  'imageUrl': 'assets/images/POSTER_1.jpeg',
  'sections': [
    {
      'heading': 'Introduction',
      'content': 'Community support networks provide essential resources and assistance to women in need. These networks can include family, friends, local organizations, and online communities.'
    },
    {
      'heading': 'Types of Support',
      'content': 'Support can come in many forms, including emotional support, financial assistance, and access to resources like healthcare and education. It is important to build a strong support network.'
    },
    {
      'heading': 'Building Community',
      'content': 'Building a supportive community involves fostering connections and creating safe spaces for women to share their experiences and seek help. Community events, support groups, and online forums can facilitate this.'
    },
    {
      'heading': 'Accessing Resources',
      'content': 'There are many resources available for women seeking support. These can include local shelters, counseling services, legal assistance, and educational programs. Knowing where to find help is crucial.'
    },
    {
      'heading': 'Role of Organizations',
      'content': 'Nonprofit organizations, government agencies, and advocacy groups play a vital role in providing support to women. They work to address systemic issues and provide direct assistance to those in need.'
    },
    {
      'heading': 'Conclusion',
      'content': 'Community support is essential for empowering women and fostering resilience in communities. By working together and offering support, we can create positive change and improve lives.'
    },
  ],
};

final Map<String, dynamic> stressManagementArticle = {
  'title': 'Stress Management',
  'imageUrl': 'assets/images/mental_health1.jpeg',
  'sections': [
    {
      'heading': 'Introduction',
      'content': 'Managing stress is crucial for maintaining mental and physical health. Effective stress management techniques can improve quality of life and overall well-being.'
    },
    {
      'heading': 'Identifying Stressors',
      'content': 'Identifying the sources of stress in your life is the first step towards managing it. Common stressors include work, relationships, financial issues, and health concerns.'
    },
    {
      'heading': 'Stress Management Techniques',
      'content': 'There are many techniques to manage stress, including deep breathing exercises, meditation, physical activity, and time management. Finding the right technique for you is essential.'
    },
    {
      'heading': 'Healthy Lifestyle Choices',
      'content': 'Maintaining a healthy lifestyle can help reduce stress. This includes regular exercise, a balanced diet, adequate sleep, and avoiding excessive caffeine and alcohol.'
    },
    {
      'heading': 'Seeking Professional Help',
      'content': 'If stress becomes overwhelming, seeking professional help is important. Therapists, counselors, and support groups can provide strategies and support for managing stress effectively.'
    },
    {
      'heading': 'Conclusion',
      'content': 'Stress management is key to living a balanced life and maintaining overall well-being. By learning to manage stress effectively, individuals can enhance their resilience and improve their quality of life.'
    },
  ],
};

 
