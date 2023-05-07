import 'package:flutter/material.dart';

import 'package:flutter_meals_app/widgets/WidgetCategoryItem.dart';

import 'package:flutter_meals_app/data/data.dart';

class ScreenCategories extends StatelessWidget {
  const ScreenCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: DUMMY_CATEGORIES
          .map((e) => WidgetCategoryItem(
                id: e.id,
                title: e.title,
                color: e.color,
              ))
          .toList(),
    );
  }
}
