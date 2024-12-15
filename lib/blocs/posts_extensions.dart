import 'package:tp_post_5al/data/models/post.dart';
import 'posts_state.dart';

extension PostsStateExtension on PostsState {
  bool get isLoading => this is PostsLoading;

  String? get error => this is PostsError ? (this as PostsError).message : null;

  List<Post> get posts => this is PostsLoaded ? (this as PostsLoaded).posts : [];
}
