import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_post_5al/blocs/posts_bloc.dart';
import 'package:tp_post_5al/blocs/posts_event.dart';
import 'package:tp_post_5al/data/models/post.dart';

class CreatePostPage extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Créer un Nouveau Post')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Titre'),
            ),
            SizedBox(height: 16),
            SizedBox(height: 20),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              minLines: 1,
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {

                  final createTitle = titleController.text;
                  final createContent = descriptionController.text;

                  if (createTitle.isEmpty || createContent.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Le titre et / ou la description ne peux etre vide')),
                    );
                    return;
                  }

                  final newPost = Post(
                    id: DateTime.now().toString(),
                    title: titleController.text,
                    description: descriptionController.text,
                  );


                  BlocProvider.of<PostsBloc>(context).add(CreatePost(newPost));
                  Navigator.of(context).pop();
                },
                child: Text('Créer le Post'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
