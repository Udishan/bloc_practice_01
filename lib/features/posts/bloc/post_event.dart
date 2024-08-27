import 'package:flutter/material.dart';

@immutable
abstract class PostEvent {}


class PostInitialFetchEvent extends PostEvent{}


class PostAddEvent extends PostEvent{}