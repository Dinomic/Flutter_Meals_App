import 'package:flutter/material.dart';

import 'package:flutter_meals_app/data/data.dart';

import 'package:flutter_meals_app/models/meal.dart';

import 'package:flutter_meals_app/widgets/WidgetMealItem.dart';

class ScreenMeals extends StatefulWidget {
  static const String routeName = '/categories/meals';

  final List<Meal> mealsData;

  ScreenMeals({super.key, required this.mealsData});

  @override
  State<ScreenMeals> createState() => _ScreenMealsState();
}

class _ScreenMealsState extends State<ScreenMeals> {
  // int id;
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    final id = int.parse(routeArgs['id'].toString());
    final title = routeArgs['title'].toString();
    final meals = widget.mealsData
        .where((element) => element.categories.contains(id))
        .toList();

    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            Meal chosenMeal = meals.elementAt(index);
            return WidgetMealItem(
              id: chosenMeal.id,
              title: chosenMeal.title,
              imageUrl: chosenMeal.imageUrl,
              duration: chosenMeal.duration,
              complexity: chosenMeal.complexity,
              affordability: chosenMeal.affordability,
            );
          },
          itemCount: meals.length,
        ));
  }
}
