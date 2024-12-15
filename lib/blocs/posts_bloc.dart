import 'package:bloc/bloc.dart';
import 'package:tp_post_5al/data/models/post.dart';
import 'package:tp_post_5al/data/repositories/posts_repository.dart';
import 'posts_event.dart';
import 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostsRepository repository;

  PostsBloc(this.repository) : super(PostsInitial()) {
    on<FetchPosts>((event, emit) async {
      emit(PostsLoading());
      try {
        final posts = await repository.fetchPosts();
        emit(PostsLoaded(posts));
      } catch (_) {
        emit(PostsError("Failed to fetch posts"));
      }
    });

    on<CreatePost>((event, emit) async {
      emit(PostsLoading());
      try {
        await repository.addPost(event.post);
        final posts = await repository.fetchPosts();
        emit(PostsLoaded(posts));
      } catch (_) {
        emit(PostsError("Failed to create post"));
      }
    });

    on<UpdatePost>((event, emit) async {
      emit(PostsLoading());
      try {
        await repository.editPost(Post(
          id: event.postId,
          title: event.newTitle,
          description: event.newDescription,
        ));
        final posts = await repository.fetchPosts();
        emit(PostsLoaded(posts));
      } catch (_) {
        emit(PostsError("Failed to update post"));
      }
    });

    on<DeletePost>((event, emit) async {
      emit(PostsLoading());
      try {
        await repository.deletePost(event.postId);
        final posts = await repository.fetchPosts();
        emit(PostsLoaded(posts));
      } catch (_) {
        emit(PostsError("Failed to delete post"));
      }
    });
  }
}
