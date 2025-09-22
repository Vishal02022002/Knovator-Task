import 'package:flutter/material.dart';
import 'screens/posts_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Knovator Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PostsListScreen(),
    );
  }
}
