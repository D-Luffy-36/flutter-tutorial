import 'package:flutter/material.dart';

class Restaurant {
  static int _counter = 0;
  final String id;
  final String name;
  final IconData? icon;
  final String imageUrl;
  final String description;
  final String address;
  final String phoneNumber;
  final double rating;
  final String cuisineType;
  final List<String> categories; // ["Seafood", "Healthy", "Organic"]

  Restaurant({
    required this.name,
    this.icon,
    this.imageUrl = '',
    this.description = '',
    this.address = '',
    this.phoneNumber = '',
    this.rating = 0.0,
    this.cuisineType = '',
    this.categories = const [
      'Seafood',
      'Healthy',
      'Organic',
    ],
  }) : id = (++_counter).toString();
}