import 'package:flutter/material.dart';

import 'package:flutter_meals_app/screens/ScreenTab.dart';
import 'package:flutter_meals_app/screens/ScreenFilters.dart';

class WidgetMainDrawer extends StatelessWidget {
  const WidgetMainDrawer({super.key});

  ListTile _buildListTile(String title, IconData icon, Function onTapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () => onTapHandler(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).primaryColorDark,
            alignment: Alignment.centerLeft,
            child: const Text(
              'Cook this!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _buildListTile(
            'Meals',
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed(ScreenTab.routeName);
            },
          ),
          _buildListTile(
            'Filters',
            Icons.settings,
            () {
              Navigator.of(context)
                  .pushReplacementNamed(ScreenFilters.routeName);
            },
          ),
        ],
      ),
    );
  }
}
