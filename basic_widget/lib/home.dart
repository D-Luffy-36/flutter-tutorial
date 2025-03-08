import 'package:basic_widget/components/color_button.dart';
import 'package:flutter/material.dart';
import 'components/category_card.dart';
import 'components/theme_button.dart';
import 'constants.dart';
import 'models/food_category.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  List<NavigationDestination> appBarDestinations = const [
    NavigationDestination(
      icon: Icon(Icons.credit_card),
      label: "Category",
      selectedIcon: Icon(Icons.credit_card),
    ),
    NavigationDestination(
      icon: Icon(Icons.credit_card),
      label: "Post",
      selectedIcon: Icon(Icons.credit_card),
    ),
    NavigationDestination(
      icon: Icon(Icons.credit_card),
      label: "Restaurant",
      selectedIcon: Icon(Icons.credit_card),
    ),
  ];

  // lib/home.dart
  final List<FoodCategory> categories = [
    FoodCategory(name: 'Category 1', icon: Icons.category, imageUrl: 'assets/categories/category1.png'),
    FoodCategory(name: 'Category 2', icon: Icons.local_dining, imageUrl: 'assets/categories/post.svg'),
    FoodCategory(name: 'Category 3', icon: Icons.fastfood, imageUrl: 'assets/categories/category3.png'),
  ];


  @override
  Widget build(BuildContext context) {
    final pages = [
      Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300),
          child: CategoryCard(category: categories[1]),
        ),
      ),
      Container(color: Colors.green),
      Container(color: Colors.blue),
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
        children: pages,
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