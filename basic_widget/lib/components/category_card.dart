import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/food_category.dart';

class CategoryCard extends StatelessWidget{
  // 1
  final FoodCategory category;

  const CategoryCard({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Get text theme
    final theme = Theme.of(context);
    final bool isBright = theme.brightness == Brightness.light;

    final Color textColor = isBright ? Colors.black : Colors.white;

    // Áp dụng text theme
    final textTheme = theme.textTheme.apply(displayColor: textColor);

    // TODO: Replace with Card widget
    return Card(
      child: SizedBox(
        height: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
// 1
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(8.0)),
                  child: Image.asset(category.imageUrl),
                ),
// 2
                Positioned(
                  left: 16.0,
                  top: 16.0,
                  child: Text(
                    'Yummy',
                    style: textTheme.headlineLarge,
                  ),
                ),
// 3
                Positioned(
                  bottom: 16.0,
                  right: 16.0,
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: Text(
                      'Smoothies',
                      style: textTheme.headlineLarge,
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              tileColor: Colors.white30,
              title: Text(category.name, style: textTheme.titleSmall,),
              subtitle: Text('12 items', style: textTheme.bodySmall,),
            ),
          ],
        ),
      )
    );
  }
}