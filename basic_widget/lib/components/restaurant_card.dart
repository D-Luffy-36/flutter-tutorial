
import 'package:flutter/material.dart';

import '../models/restaurant.dart';

class RestaurantCard extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantCard({super.key, required this.restaurant});

  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  bool _isFavorited = false;
  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
}
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isBright = theme.brightness == Brightness.light;
    final Color textColor = isBright ? Colors.black : Colors.white;
    // Áp dụng text theme
    final textTheme = theme.textTheme.apply(displayColor: textColor);

    return Card(
      child: SizedBox(
        height: double.infinity,
        child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Stack(
            children: [
              SizedBox( // ✅ Giới hạn chiều cao ảnh
                width: double.infinity,
                height: 200, // Điều chỉnh chiều cao ảnh
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  child: Image.asset(widget.restaurant.imageUrl, fit: BoxFit.cover),
                ),
              ),
              Positioned( // ✅ Loại bỏ Expanded
                top: 10,
                right: 10,
                child: IconButton(
                  color: Colors.pink,
                  icon: Icon(_isFavorited ? Icons.favorite : Icons.favorite_border),
                  onPressed: () { _toggleFavorite(); },
                ),
              ),
            ],
          ),
          Expanded(
            child: ListTile(
            leading: Icon(Icons.restaurant, color: textColor),
            tileColor: Colors.white30,
            title: Text(widget.restaurant.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.restaurant.categories.join(', '),
                  style: textTheme.bodySmall,
                  maxLines: 1,
                ),
                const SizedBox(height: 4), // Khoảng cách giữa danh mục và sao
                Row(
                  children: List.generate(
                    5,
                        (index) => const Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Address: ${widget.restaurant.address}')),
              );
            },
          ),)
        ],
      ),
      )
    );

  }
}