import 'package:flutter/material.dart';

import 'package:flutter_meals_app/data/data.dart';
import 'package:flutter_meals_app/models/meal.dart';

class ScreenMealDetails extends StatelessWidget {
  static const String routeName = '/categories/meals/meal-details';

  ScreenMealDetails(
      {super.key, required this.toggleFavorite, required this.isFavorite});

  Function toggleFavorite;
  Function isFavorite;
  Widget _buildSectionTitle(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(title),
    );
  }

  Widget _buildListContainer(Widget list) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: list,
    );
  }

  // void _loveMeal(BuildContext context, int mealId) {
  //   Navigator.of(context).pop(mealId);
  // }

  @override
  Widget build(BuildContext context) {
    final int mealId = ModalRoute.of(context)?.settings.arguments as int;
    final Meal chosenMeal = DUMMY_MEALS.firstWhere(
      (element) => element.id == mealId,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(chosenMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              height: 250,
              width: double.infinity,
              child: Image.network(
                chosenMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildSectionTitle('Ingredients'),
            _buildListContainer(ListView.builder(
              itemBuilder: (context, index) => Card(
                color: Theme.of(context).colorScheme.secondary,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    chosenMeal.ingredients.elementAt(index),
                  ),
                ),
              ),
              itemCount: chosenMeal.ingredients.length,
            )),
            _buildSectionTitle('Steps'),
            _buildListContainer(
              ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(
                        chosenMeal.steps.elementAt(index),
                      ),
                    ),
                    const Divider()
                  ],
                ),
                itemCount: chosenMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavorite(mealId),
        child: isFavorite(mealId)
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_border),
      ),
    );
  }
}
