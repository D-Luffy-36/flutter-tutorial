
import 'dart:async';
import 'dart:convert';
import 'package:basic_widget/models/food_category.dart';
import 'package:basic_widget/models/post.dart';
import 'package:flutter/services.dart';
import 'package:basic_widget/models/explore_data.dart';

import 'package:basic_widget/models/restaurant.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MockYummyService{
  List<String> restaurantImages = [];
  List<String> categoriesImages = [];
  List<String> profieImages = [];

  Future<void> _initImages() async{
      restaurantImages = await getRestaurantImages();
      categoriesImages = await getCategoryImages();
      profieImages = await getProfieImages();
  }

  MockYummyService._(); // Private constructor để sử dụng trong factory

  static Future<MockYummyService> create() async {
    MockYummyService instance = MockYummyService._();
    await instance._initImages();
    return instance;
  }


  Future<List<String>> getRestaurantImages() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    // Lọc các file ảnh trong thư mục `assets/restaurants/`
    final imagePaths = manifestMap.keys
        .where((String key) => key.startsWith('assets/restaurants/'))
        .toList();

    return imagePaths;
  }

  Future<List<String>> getCategoryImages() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    // Lọc các file ảnh trong thư mục `assets/restaurants/`
    final imagePaths = manifestMap.keys
        .where((String key) => key.startsWith('assets/categories/'))
        .toList();

    return imagePaths;
  }

  Future<List<String>> getProfieImages() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    // Lọc các file ảnh trong thư mục `assets/restaurants/`
    final imagePaths = manifestMap.keys
        .where((String key) => key.startsWith('assets/profie_pics/'))
        .toList();

    return imagePaths;
  }


  Future<ExploreData> getExploreData() async {
    await Future.delayed(Duration(seconds: 2));
    return ExploreData(
      restaurants: _generateRestaurants(),
      categories: _generateCategories(),
      friendPosts: _generateFriendPosts(),
    );
  }

  List<Restaurant> _generateRestaurants(){
      return List.generate(10,(index){
        return
          Restaurant(
              name:  "Restaurant $index",
              icon: Icons.restaurant,
              imageUrl: restaurantImages[index],
              description: "Delicious food at Restaurant $index!",
              address: "Street ${index + 1}, City",
              phoneNumber: "0123-456-78$index",
              rating: 3.5 + (index % 5) * 0.5, // Rating từ 3.5 - 5.0
              cuisineType: ["Fast Food", "Italian", "Japanese", "Korean", "Vietnamese"][index % 5],
              categories: ["Category ${index % 3}", "Category ${(index + 1) % 3}"],
          );
      });
  }

  List<FoodCategory> _generateCategories(){
    return List.generate(10, (index){
      return FoodCategory(
        name: "Category $index",
        icon: Icons.category_outlined,
        imageUrl: categoriesImages[index]
      );
    },);
  }
  
  List<Post>  _generateFriendPosts(){
    return List.generate(10, (index){
        return Post(title:"Post $index", avtUrl: profieImages[index]);
    });
  }

}