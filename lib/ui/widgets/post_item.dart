import 'package:flutter/material.dart';
import 'package:tp_post_5al/data/models/post.dart';

class PostItem extends StatelessWidget {
  final Post post;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final VoidCallback onTap;

  const PostItem({
    Key? key,
    required this.post,
    required this.onDelete,
    required this.onEdit,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: InkWell( // Permet de capturer le clic sur la carte
        onTap: onTap, // Navigation vers PostDetailPage
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(post.description),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: onEdit,
                    child: Text('Edit'),
                  ),
                  SizedBox(width: 8.0),
                  TextButton(
                    onPressed: onDelete,
                    child: Text('Delete'),
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
