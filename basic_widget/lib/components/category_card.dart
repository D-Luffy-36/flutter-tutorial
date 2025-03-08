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

    final textColor = isBright ? Colors.black : Colors.white;

    // Áp dụng text theme
    final textTheme = theme.textTheme.apply(displayColor: textColor);

    // TODO: Replace with Card widget
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
      // 💡 Nếu không dùng Stack, bạn sẽ khó có thể đặt văn bản lên trên ảnh.
      Stack(
            children: [
            // 1
            // bo góc ảnh
              ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
                child: SvgPicture.asset(category.imageUrl)
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
                // xoay chữ 90 độ
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
        ],
      ),
    );
  }
}