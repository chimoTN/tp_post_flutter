// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_post_5al/blocs/posts_bloc.dart';
import 'package:tp_post_5al/data/data_sources/posts_data_source.dart';
import 'package:tp_post_5al/data/repositories/posts_repository.dart';
import 'package:tp_post_5al/ui/pages/posts_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsBloc(PostsRepository(FakePostsDataSource())),
      child: MaterialApp(
        title: 'TP Flutter 5AL',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PostsListPage(),
      ),
    );
  }
}