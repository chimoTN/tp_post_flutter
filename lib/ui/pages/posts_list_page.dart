// lib/ui/pages/posts_list_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_post_5al/blocs/posts_bloc.dart';
import 'package:tp_post_5al/blocs/posts_event.dart';
import 'package:tp_post_5al/blocs/posts_extensions.dart';
import 'package:tp_post_5al/blocs/posts_state.dart';
import 'package:tp_post_5al/ui/pages/create_post_page.dart';
import 'package:tp_post_5al/ui/pages/post_detail_page.dart';
import 'package:tp_post_5al/ui/widgets/post_item.dart';
import 'package:tp_post_5al/ui/pages/edit_post_page.dart';

class PostsListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    context.read<PostsBloc>().add(FetchPosts());
    
    return Scaffold(
      appBar: AppBar(title: Text('Liste des Posts')),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {

          if (state.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state.error != null) {
            return Center(child: Text('Erreur: ${state.error}'));
          }

          return ListView.builder(
            itemCount: state.posts.length,
            itemBuilder: (context, index) {
              return PostItem(
                post: state.posts[index],
                onEdit: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditPostPage(post: state.posts[index]),
                  ));
                },
                onDelete: () {
                  context.read<PostsBloc>().add(DeletePost(state.posts[index].id));
                },
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PostDetailPage(post: state.posts[index]),
                  ));
                },

              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CreatePostPage(),
          ));
        },
        child: Icon(Icons.add),
      ),

    );
  }
}