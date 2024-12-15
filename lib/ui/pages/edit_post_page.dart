import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_post_5al/blocs/posts_bloc.dart';
import 'package:tp_post_5al/blocs/posts_event.dart';
import 'package:tp_post_5al/data/models/post.dart';

class EditPostPage extends StatelessWidget {

  final Post post;

  EditPostPage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: post.title);
    final contentController = TextEditingController(text: post.description);

    return Scaffold(
      appBar: AppBar(title: Text('Edit Post')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: contentController,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              minLines: 1,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final updatedTitle = titleController.text;
                final updatedContent = contentController.text;

                if (updatedTitle.isEmpty || updatedContent.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Title and Content cannot be empty')),
                  );
                  return;
                }

                context.read<PostsBloc>().add(UpdatePost(
                  postId: post.id,
                  newTitle: updatedTitle,
                  newDescription: updatedContent,
                ));

                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}