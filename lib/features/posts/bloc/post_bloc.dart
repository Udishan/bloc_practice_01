import 'dart:async';
import 'dart:convert'; // Added this import for jsonDecode and utf8

import 'package:bloc/bloc.dart';
import 'package:bloc_practice_01/features/posts/bloc/post_event.dart';
import 'package:bloc_practice_01/features/posts/bloc/post_state.dart';
import 'package:bloc_practice_01/features/posts/models/post.dart';
import 'package:bloc_practice_01/features/posts/repositories/post_repository.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class PostBloc extends Bloc<PostEvent, PostState> {

  var logger = Logger(printer: PrettyPrinter());
  
  PostBloc() : super(PostInitial()) {
    on<PostInitialFetchEvent>(postInitialFetchEvent);
  }

  FutureOr<void> postInitialFetchEvent(
      PostInitialFetchEvent event, Emitter<PostState> emit) async {
    emit(PostFetchingLoadingState());
    List<Post> posts = await PostRepository.fetchAllPosts();

    emit(PostFetchingSuccessfulState(posts: posts));
  }
}
