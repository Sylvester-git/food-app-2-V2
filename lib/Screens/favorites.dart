import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../Widgets/meal_item.dart';

class Favoritescreen extends StatelessWidget {
  final List<meal> favoritemeal;
  Favoritescreen(this.favoritemeal);

  @override
  Widget build(BuildContext context) {
    if (favoritemeal.isEmpty) {
      return Center(
          child: Text('You have no Favorite meals, while not add some'));
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoritemeal[index].id,
            title: favoritemeal[index].title,
            imageurl: favoritemeal[index].imageurl,
            affordability: favoritemeal[index].affordability,
            complexity: favoritemeal[index].complexity,
            duration: favoritemeal[index].duration,
          );
        },
        itemCount: favoritemeal.length,
      );
    }
  }
}
