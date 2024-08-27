import 'dart:async';
import 'dart:convert'; // Added this import for jsonDecode and utf8

import 'package:bloc/bloc.dart';
import 'package:bloc_practice_01/features/posts/bloc/post_event.dart';
import 'package:bloc_practice_01/features/posts/bloc/post_state.dart';
import 'package:bloc_practice_01/features/posts/models/post.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class PostBloc extends Bloc<PostEvent, PostState> {

  var logger = Logger(printer: PrettyPrinter());
  
  PostBloc() : super(PostInitial()) {
    on<PostInitialFetchEvent>(postInitialFetchEvent);
  }

  FutureOr<void> postInitialFetchEvent(
      PostInitialFetchEvent event, Emitter<PostState> emit) async { 
    var client = http.Client();
    List<Post> posts = [];
    try {
      var response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      var result = jsonDecode(response.body);
      for(int i = 0; i < result.length; i++){
        Post post = Post.fromJson(result[i] as Map<String, dynamic>);
        posts.add(post);
        logger.d("post", post);
      }
      emit(PostFetchingSuccessfulState(posts: posts));
    }
    catch(e){
      logger.e(e);
    }
     finally {
      client.close();
    }
  }
}
