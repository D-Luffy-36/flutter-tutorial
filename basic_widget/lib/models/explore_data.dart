import 'package:basic_widget/models/post.dart';
import 'package:basic_widget/models/restaurant.dart';
import 'food_category.dart';

class ExploreData{
  final List<Restaurant> restaurants;
  final List<FoodCategory> categories;
  final List<Post> friendPosts;

  ExploreData({
    required this.restaurants,
    required this.categories,
    required this.friendPosts,
  });

}
