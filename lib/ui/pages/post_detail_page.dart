// lib/ui/pages/post_detail_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_post_5al/blocs/posts_bloc.dart';
import 'package:tp_post_5al/data/models/post.dart';

class PostDetailPage extends StatelessWidget {
  final Post post;

  PostDetailPage({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(post.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.description, style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logique pour modifier le post
              },
              child: Text('Modifier le Post'),
            ),
          ],
        ),
      ),
    );
  }
}