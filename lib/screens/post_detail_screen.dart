import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/post.dart';

class PostDetailScreen extends StatelessWidget {
  final int postId;
  const PostDetailScreen({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    final ApiService apiService = ApiService();
    
    return Scaffold(
      appBar: AppBar(title: const Text('Post Details')),
      body: FutureBuilder<Post>(
        future: apiService.fetchPostDetail(postId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final post = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(post.body),
          );
        },
      ),
    );
  }
}
