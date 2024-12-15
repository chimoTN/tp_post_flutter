import 'package:tp_post_5al/data/models/post.dart';

// États
abstract class PostsState {}

class PostsInitial extends PostsState {}

class PostsLoading extends PostsState {}

class PostsLoaded extends PostsState {
  final List<Post> posts;
  PostsLoaded(this.posts);
}

class PostsError extends PostsState {
  final String message;
  PostsError(this.message);
}
