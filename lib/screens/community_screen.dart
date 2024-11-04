import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildPostCard(
            'SUNNY',
            'Check out my tomato plants!',
            'assets/images/tomato.jpg',
            '2 hours ago',
            124,
            45,
          ),
          _buildPostCard(
            'SUNNY 2',
            'Need help identifying this plant disease',
            'assets/images/plant_disease.jpg',
            '5 hours ago',
            89,
            67,
          ),
          _buildPostCard(
            'SUNNY 3',
            'My first successful harvest!',
            'assets/images/harvest.jpg',
            '1 day ago',
            256,
            98,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new post functionality
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildPostCard(
    String username,
    String content,
    String imagePath,
    String timeAgo,
    int likes,
    int comments,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(username),
            subtitle: Text(timeAgo),
            trailing: IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(content),
          ),
          const SizedBox(height: 8.0),
          Container(
            height: 200,
            color: Colors.grey[300],
            child: const Center(
              child: Icon(Icons.image, size: 50),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.favorite_border),
                    const SizedBox(width: 8.0),
                    Text('$likes'),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.comment_outlined),
                    const SizedBox(width: 8.0),
                    Text('$comments'),
                  ],
                ),
                const Icon(Icons.share),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
