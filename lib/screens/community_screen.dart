import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';

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
          if (post.imageBytes != null) ...[
            const SizedBox(height: 8.0),
            Image.memory(
              post.imageBytes!,
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
    Uint8List? imageBytes;

    if (!mounted) return;

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isEditing ? 'Edit Post' : 'Create Post'),
        content: SingleChildScrollView(
          child: SizedBox(
            width:
                300, // Set a fixed width for the dialog to avoid infinite width issues
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
                      if (imageBytes != null || post?.imageBytes != null)
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Image.memory(
                              imageBytes ?? post!.imageBytes!,
                              height: 100,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            IconButton(
                              icon: const Icon(Icons.close, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  imageBytes = null;
                                });
                              },
                            ),
                          ],
                        ),
                      ElevatedButton.icon(
                        onPressed: () async {
                          final ImagePicker picker = ImagePicker();
                          selectedImage = await picker.pickImage(
                            source: ImageSource.gallery,
                          );
                          if (selectedImage != null && mounted) {
                            imageBytes = await selectedImage?.readAsBytes();
                            setState(() {});
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
                    post.copyWith(
                      content: contentController.text,
                      imageBytes: imageBytes ?? post.imageBytes,
                    ),
                  );
                } else {
                  _createPost(
                    content: contentController.text,
                    imageBytes: imageBytes,
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
    contentController.dispose();
  }

  void _createPost({required String content, Uint8List? imageBytes}) {
    setState(() {
      _posts.insert(
        0,
        Post(
          id: DateTime.now().toString(),
          username: _currentUser,
          content: content,
          imageBytes: imageBytes,
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
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Comments',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Center(
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
  final Uint8List? imageBytes;
  final String timeAgo;
  final int likes;
  final int comments;
  final bool isLiked;

  Post({
    required this.id,
    required this.username,
    required this.content,
    this.imageBytes,
    required this.timeAgo,
    required this.likes,
    required this.comments,
    this.isLiked = false,
  });

  Post copyWith({
    String? content,
    Uint8List? imageBytes,
    int? likes,
    int? comments,
    bool? isLiked,
  }) {
    return Post(
      id: id,
      username: username,
      content: content ?? this.content,
      imageBytes: imageBytes,
      timeAgo: timeAgo,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}
