import 'package:bloc_practice_01/features/posts/bloc/post_bloc.dart';
import 'package:bloc_practice_01/features/posts/bloc/post_event.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

@override
State<PostsScreen> createState() => _PostsScreenState();

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text("Posts"),
  //     ),
  //   );
  // }
}

class _PostsScreenState extends State<PostsScreen>{

  final PostBloc postBloc = PostBloc();

  @override
  void initState() {
    // TODO: implement initState
    postBloc.add(PostInitialFetchEvent());
    super.initState(); 
  }

@override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: const Center(
        child: Text("sdad"),
      ),
    );
  }

}