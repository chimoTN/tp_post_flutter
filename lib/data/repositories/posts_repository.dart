// lib/data/repositories/posts_repository.dart
import 'package:tp_post_5al/data/data_sources/posts_data_source.dart';
import 'package:tp_post_5al/data/models/post.dart';

class PostsRepository {
  final PostsDataSource dataSource;

  PostsRepository(this.dataSource);

  Future<List<Post>> fetchPosts() {
    return dataSource.getAllPosts();
  }

  Future<Post> addPost(Post post) {
    return dataSource.createPost(post);
  }

  Future<Post> editPost(Post post) {
    return dataSource.updatePost(post);
  }

  Future<void> deletePost(String idPost) async {
    return dataSource.deletePost(idPost);
  }

}