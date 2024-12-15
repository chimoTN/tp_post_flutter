import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_post_5al/blocs/posts_bloc.dart';
import 'package:tp_post_5al/blocs/posts_event.dart';
import 'package:tp_post_5al/blocs/posts_state.dart';
import 'package:tp_post_5al/data/data_sources/posts_data_source.dart';
import 'package:tp_post_5al/ui/pages/post_detail_page.dart';
import 'package:tp_post_5al/ui/widgets/post_item.dart';
import 'package:tp_post_5al/data/repositories/posts_repository.dart';
import 'package:tp_post_5al/ui/pages/edit_post_page.dart';
import 'package:tp_post_5al/ui/pages/create_post_page.dart';


class PostsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsBloc(PostsRepository(FakePostsDataSource()))..add(FetchPosts()),
      child: Scaffold(
        appBar: AppBar(title: Text('Posts')),
        body: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            if (state is PostsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is PostsLoaded) {
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  final post = state.posts[index];
                  return PostItem(
                    post: post,
                    onEdit: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EditPostPage(post: state.posts[index]),
                        ),
                      );
                    },
                    onDelete: () {
                      context.read<PostsBloc>().add(DeletePost(post.id));
                    },
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PostDetailPage(post: state.posts[index]),
                      ));
                    },
                  );
                },
              );
            } else if (state is PostsError) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CreatePostPage(),
              ),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}