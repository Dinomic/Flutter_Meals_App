import 'package:flutter/material.dart';

import 'package:flutter_meals_app/models/meal.dart';
import 'package:flutter_meals_app/models/meal.dart';

import 'package:flutter_meals_app/widgets/WidgetMealItem.dart';

class ScreenFavorites extends StatelessWidget {
  const ScreenFavorites({super.key, required this.favoriteMeals});

  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty
        ? const Center(
            child: Text('No Favorites!'),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              Meal chosenMeal = favoriteMeals.elementAt(index);
              return WidgetMealItem(
                id: chosenMeal.id,
                title: chosenMeal.title,
                imageUrl: chosenMeal.imageUrl,
                duration: chosenMeal.duration,
                complexity: chosenMeal.complexity,
                affordability: chosenMeal.affordability,
              );
            },
            itemCount: favoriteMeals.length,
          );
  }
}
