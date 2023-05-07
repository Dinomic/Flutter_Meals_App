import 'package:flutter/material.dart';

import 'package:flutter_meals_app/screens/ScreenMeals.dart';

class WidgetCategoryItem extends StatelessWidget {
  const WidgetCategoryItem(
      {super.key, required this.id, required this.title, required this.color});

  final int id;
  final String title;
  final Color color;

  void selectCategory(BuildContext ctx) {
    // Navigator.of(ctx).push(
    //   MaterialPageRoute(builder: (_) {
    //     return ScreenMeals(
    //       id: id,
    //       title: title,
    //     );
    //   }),
    // );

    Navigator.of(ctx).pushNamed(
      '/categories/meals',
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              color.withOpacity(0.7),
              color,
            ], begin: Alignment.bottomLeft, end: Alignment.topRight),
            borderRadius: BorderRadius.circular(20)),
        child: Text(title),
      ),
    );
  }
}
