
import 'package:basic_widget/components/restaurant_card.dart';
import 'package:basic_widget/models/restaurant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RestaurantSection extends StatelessWidget{
  final List<Restaurant> restaurants;

  const RestaurantSection({
    super.key,
    required this.restaurants,
  });


  @override
  Widget build(BuildContext context) {
      return Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.0,),
                child:Text("Food near me", style:
                TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 300,
                color: Colors.grey,
                child: ListView.builder(
                  itemCount: restaurants.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 300,
                      child: RestaurantCard(restaurant: restaurants[index]),
                    );
                  },
                ),
              ),
            ],
          ),
      );
  }
}