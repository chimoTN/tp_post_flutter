import 'package:tp_post_5al/data/models/post.dart';

// Événements
abstract class PostsEvent {}

class FetchPosts extends PostsEvent {}

class CreatePost extends PostsEvent {
  final Post post;
  CreatePost(this.post);
}

class UpdatePost extends PostsEvent {
  final String postId;
  final String newTitle;
  final String newDescription;

  UpdatePost({
    required this.postId,
    required this.newTitle,
    required this.newDescription,
  });
}

class DeletePost extends PostsEvent {
  final String postId;
  DeletePost(this.postId);
}
