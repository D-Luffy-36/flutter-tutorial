import 'package:flutter/material.dart';

class Post {
  static int _counter = 0;
  final String id;
  final IconData? icon;
  final String avtUrl;
  final String title;

  Post(
      { this.icon,
        required this.title,
        required this.avtUrl
      }) : id = (++_counter).toString() ;
}