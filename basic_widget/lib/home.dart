import 'package:basic_widget/components/color_button.dart';
import 'package:basic_widget/components/post_card.dart';
import 'package:basic_widget/components/restaurant_card.dart';
import 'package:basic_widget/models/restaurant.dart';
import 'package:basic_widget/screens/explore_page.dart';

import 'package:flutter/material.dart';
import 'components/category_card.dart';
import 'components/theme_button.dart';
import 'constants.dart';
import 'models/food_category.dart';
import 'models/post.dart';

class Home extends StatefulWidget {
   const Home({
    super.key,
    required this.changeTheme,
    required this.changeColor,
    required this.colorSelected,
  });

   // thay đổi màu toàn app
  final void Function(bool useLightMode) changeTheme;
  final void Function(int value) changeColor;
  final ColorSelection colorSelected;

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home>{
  // tab property will be used to keep track of the current tab the user is on.
  int tab = 0;
  String postTitle = 'Made this delicious pizza this morning';

  List<NavigationDestination> appBarDestinations = const [
    NavigationDestination(
      icon: Icon(Icons.home),
      label: "Home",
      selectedIcon: Icon(Icons.home),
    ),
    NavigationDestination(
      icon: Icon(Icons.receipt_long),
      label: "Orders",
      selectedIcon: Icon(Icons.receipt_long),
    ),
    NavigationDestination(
      icon: Icon(Icons.person),
      label: "Account",
      selectedIcon: Icon(Icons.person),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final pages = [
      Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300),
          child: CategoryCard(
            category:   FoodCategory(name: 'Category 1', icon: Icons.category, imageUrl: 'assets/categories/category1.svg'),
          ),
        ),
      ),
      Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300),
          child: PostCard(
            post:   Post(title: postTitle, avtUrl: 'assets/posts/post.svg', icon: Icons.image),
          ),
        ),
      ),
      Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300),
          child: RestaurantCard(
             restaurant: Restaurant(name: 'An Restaurant', icon: Icons.restaurant,
                 imageUrl: 'assets/restaurants/restaurant_1.jpg', address: "123 Đường Lê Duẩn, Phường Bến Thành, Quận 1, TP.HCM, Việt Nam"
             ),
          ),
        ),
      ),
    ];

    final pages_2 = [
      ExplorePage(),
      Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300),
          child: PostCard(
            post:   Post(title: postTitle, avtUrl: 'assets/profie_pics/minimalist-anime-girl-sky-blue-desktop-wallpaper-4k.jpg', icon: Icons.image),
          ),
        ),
      ),
      Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300),
          child: RestaurantCard(
            restaurant: Restaurant(name: 'An Restaurant', icon: Icons.restaurant,
                imageUrl: 'assets/restaurants/restaurant_1.jpg', address: "123 Đường Lê Duẩn, Phường Bến Thành, Quận 1, TP.HCM, Việt Nam"
            ),
          ),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Yummy"),
        actions: [
          ThemeButton(
            changeThemeMode: widget.changeTheme,
          ),
          ColorButton(
            changeColor: widget.changeColor,
            colorSelected: widget.colorSelected,
          ),
        ],
        // chứa các nút hoặc icon ở phía bên phải của AppBar
        backgroundColor: widget.colorSelected.color,
      ),

      body: IndexedStack(
        index: tab,
        children: pages_2,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        // là một callback function xủ lí khi được chuyển hướng
        //  Flutter sẽ tự động truyền index của mục đó vào callback.
        onDestinationSelected: (index){
          setState(() {
            tab = index;
          });
        },
        destinations: appBarDestinations,
      ),

    );
  }
}

