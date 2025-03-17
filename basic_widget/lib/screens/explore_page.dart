

import 'package:basic_widget/components/restaurant_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../api/mock_yummy_service.dart';
import '../models/explore_data.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MockYummyService>(
      future: MockYummyService.create(), // Gọi hàm async để tạo service
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CupertinoActivityIndicator()); // Hiển thị loading
        }
        if (snapshot.hasError) {
          return Center(child: Text('Lỗi: ${snapshot.error}')); // Hiển thị lỗi
        }
        final mockService = snapshot.data!;

        return FutureBuilder<ExploreData>(
          future: mockService.getExploreData(), // Gọi hàm async lấy dữ liệu
          builder: (context, exploreSnapshot) {
            if (exploreSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CupertinoActivityIndicator());
            }
            if (exploreSnapshot.hasError) {
              return Center(child: Text('Lỗi khi tải dữ liệu: ${exploreSnapshot.error}'));
            }
            final exploreData = exploreSnapshot.data!;
            final restaurants = exploreData.restaurants;
            return RestaurantSection(restaurants: restaurants);
          },
        );
      },
    );
  }
}
