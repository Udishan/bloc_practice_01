import 'package:bloc_practice_01/features/posts/bloc/post_bloc.dart';
import 'package:bloc_practice_01/features/posts/bloc/post_event.dart';
import 'package:bloc_practice_01/features/posts/bloc/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

class _PostsScreenState extends State<PostsScreen> {
  final PostBloc postBloc = PostBloc();

  @override
  void initState() {
    postBloc.add(PostInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: BlocConsumer<PostBloc, PostState>(
        bloc: postBloc,
        listenWhen: (previous, current) => current is PostsActionState,
        buildWhen: (previous, current) => current is !PostsActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch(state.runtimeType){
            case PostFetchingLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case PostFetchingSuccessfulState:
            final successState = state as PostFetchingSuccessfulState;

            return Container(
              child: ListView.builder(
              itemCount: successState.posts.length,
              itemBuilder: (context, index){
                return  Container(
                  child: Text(successState.posts[index].title),
                );
              }),
            );
                      default:
              return const SizedBox();
          
          }
        },
      ),
    );
  }
}
 