import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/post.dart';
import 'post_detail_screen.dart';

class PostsListScreen extends StatefulWidget {
  const PostsListScreen({super.key});

  @override
  State<PostsListScreen> createState() => _PostsListScreenState();
}

class _PostsListScreenState extends State<PostsListScreen> {
  late Future<List<Post>> postsFuture;
  final ApiService apiService = ApiService();
  final Set<int> readPosts = {};

  @override
  void initState() {
    super.initState();
    postsFuture = apiService.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: FutureBuilder<List<Post>>(
        future: postsFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final posts = snapshot.data!;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              final isRead = readPosts.contains(post.id);
              return ListTile(
                tileColor: isRead ? Colors.white : Colors.yellow[100],
                title: Text(post.title),
                onTap: () async {
                  setState(() => readPosts.add(post.id));
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PostDetailScreen(postId: post.id),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
