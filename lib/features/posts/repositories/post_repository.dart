import 'package:bloc_practice_01/features/posts/models/post.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'dart:async';
import 'dart:convert'; 

class PostRepository{
  static Future<List<Post>> fetchAllPosts() async{
    var client = http.Client();
    List<Post> posts = [];
    var logger = Logger(printer: PrettyPrinter());
    try{
      
      var response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      var result = jsonDecode(response.body);
      for(int i = 0; i < result.length; i++){
        Post post = Post.fromJson(result[i] as Map<String, dynamic>);
        posts.add(post);
        logger.d("post", post);
    }
    }catch(e){
        logger.e(e);
    }finally{
      client.close();
    }

    return posts;
  }
}
