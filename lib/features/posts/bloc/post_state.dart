import 'package:bloc_practice_01/features/posts/models/post.dart';
import 'package:flutter/widgets.dart';

@immutable
abstract class PostState {}

abstract class PostsActionState extends PostState {}

class PostInitial extends PostState {}

class PostFetchingLoadingState extends PostState {}

class PostFetchingErrorState extends PostState {}

class PostFetchingSuccessfulState extends PostState {
  final List<Post> posts;
  PostFetchingSuccessfulState({
    required this.posts,
  });
}

class PostAdditionSuccessState extends PostsActionState{}


class PostAdditionErrorState extends PostsActionState{}