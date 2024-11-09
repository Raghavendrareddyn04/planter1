import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  CommunityScreenState createState() => CommunityScreenState();
}

class CommunityScreenState extends State<CommunityScreen> {
  final List<Post> _posts = [];
  final String _currentUser = 'CurrentUser'; // Simulating logged-in user

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          final post = _posts[index];
          return _buildPostCard(post);
        },
      ),
      floatingActionButton: Tooltip(
        message: 'Add new post',
        child: FloatingActionButton(
          onPressed: () => _showPostDialog(context),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildPostCard(Post post) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(post.username),
            subtitle: Text(post.timeAgo),
            trailing: post.username == _currentUser
                ? PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'edit') {
                        _showPostDialog(context, post: post);
                      } else if (value == 'delete') {
                        _deletePost(post);
                      }
                    },
                    itemBuilder: (BuildContext context) => [
                      const PopupMenuItem(
                        value: 'edit',
                        child: Text('Edit'),
                      ),
                      const PopupMenuItem(
                        value: 'delete',
                        child: Text('Delete'),
                      ),
                    ],
                  )
                : null,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(post.content),
          ),
          if (post.imagePath != null) ...[
            const SizedBox(height: 8.0),
            Image.file(
              File(post.imagePath!),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.image, size: 50),
                  ),
                );
              },
            ),
          ],
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        post.isLiked ? Icons.favorite : Icons.favorite_border,
                        color: post.isLiked ? Colors.red : null,
                      ),
                      onPressed: () => _toggleLike(post),
                    ),
                    Text('${post.likes}'),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.comment_outlined),
                      onPressed: () => _showComments(context, post),
                    ),
                    Text('${post.comments}'),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () {
                    // Implement share functionality
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showPostDialog(BuildContext context, {Post? post}) async {
    final isEditing = post != null;
    final contentController = TextEditingController(text: post?.content ?? '');
    XFile? selectedImage;

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isEditing ? 'Edit Post' : 'Create Post'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: contentController,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: 'What\'s on your mind?',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              StatefulBuilder(
                builder: (context, setState) => Column(
                  children: [
                    if (selectedImage != null || post?.imagePath != null)
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Image.file(
                            File(selectedImage?.path ?? post!.imagePath!),
                            height: 100,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          IconButton(
                            icon: const Icon(Icons.close, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                selectedImage = null;
                                if (post != null) {
                                  post = post!.copyWith(imagePath: null);
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ElevatedButton.icon(
                      onPressed: () async {
                        final ImagePicker picker = ImagePicker();
                        final XFile? image = await picker.pickImage(
                          source: ImageSource.gallery,
                        );
                        if (image != null) {
                          setState(() {
                            selectedImage = image;
                          });
                        }
                      },
                      icon: const Icon(Icons.image),
                      label: const Text('Add Image'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (contentController.text.isNotEmpty) {
                if (isEditing) {
                  _updatePost(
                    post!.copyWith(
                      content: contentController.text,
                      imagePath: selectedImage?.path ?? post?.imagePath,
                    ),
                  );
                } else {
                  _createPost(
                    content: contentController.text,
                    imagePath: selectedImage?.path,
                  );
                }
                Navigator.pop(context);
              }
            },
            child: Text(isEditing ? 'Update' : 'Post'),
          ),
        ],
      ),
    );
  }

  void _createPost({required String content, String? imagePath}) {
    setState(() {
      _posts.insert(
        0,
        Post(
          id: DateTime.now().toString(),
          username: _currentUser,
          content: content,
          imagePath: imagePath,
          timeAgo: 'Just now',
          likes: 0,
          comments: 0,
        ),
      );
    });
  }

  void _updatePost(Post updatedPost) {
    setState(() {
      final index = _posts.indexWhere((post) => post.id == updatedPost.id);
      if (index != -1) {
        _posts[index] = updatedPost;
      }
    });
  }

  void _deletePost(Post post) {
    setState(() {
      _posts.removeWhere((p) => p.id == post.id);
    });
  }

  void _toggleLike(Post post) {
    setState(() {
      final index = _posts.indexWhere((p) => p.id == post.id);
      if (index != -1) {
        _posts[index] = post.copyWith(
          isLiked: !post.isLiked,
          likes: post.likes + (post.isLiked ? -1 : 1),
        );
      }
    });
  }

  void _showComments(BuildContext context, Post post) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Comments',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text('No comments yet'),
            ),
          ],
        ),
      ),
    );
  }
}

class Post {
  final String id;
  final String username;
  final String content;
  final String? imagePath;
  final String timeAgo;
  final int likes;
  final int comments;
  final bool isLiked;

  Post({
    required this.id,
    required this.username,
    required this.content,
    this.imagePath,
    required this.timeAgo,
    required this.likes,
    required this.comments,
    this.isLiked = false,
  });

  Post copyWith({
    String? content,
    String? imagePath,
    int? likes,
    int? comments,
    bool? isLiked,
  }) {
    return Post(
      id: id,
      username: username,
      content: content ?? this.content,
      imagePath: imagePath,
      timeAgo: timeAgo,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}
