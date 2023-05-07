import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/meal.dart';
import 'package:flutter_meals_app/screens/ScreenCategories.dart';
import 'package:flutter_meals_app/screens/ScreenFavorites.dart';

import 'package:flutter_meals_app/widgets/WidgetMainDrawer.dart';

class ScreenTab extends StatefulWidget {
  ScreenTab({super.key, required this.favoriteMeals});

  static String routeName = '/';
  List<Meal> favoriteMeals;

  @override
  State<ScreenTab> createState() => _ScreenTabState();
}

class _ScreenTabState extends State<ScreenTab> {
  int _chosenTabIndex = 0;
  late List<Widget> _tabs = [];

  void _selectTab(int i) {
    setState(() {
      _chosenTabIndex = i;
    });
  }

  @override
  void initState() {
    _tabs = [
      const ScreenCategories(),
      ScreenFavorites(favoriteMeals: widget.favoriteMeals),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: const Text('Meals'),
    //       bottom: const TabBar(tabs: [
    //         Tab(
    //           icon: Icon(Icons.category),
    //           text: 'Categories',
    //         ),
    //         Tab(
    //           icon: Icon(Icons.star),
    //           text: 'Favorites',
    //         ),
    //       ]),
    //     ),
    //     body: const TabBarView(
    //       children: [ScreenCategories(), ScreenFavorites()],
    //     ),
    //   ),
    // );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals'),
      ),
      drawer: const WidgetMainDrawer(),
      body: _tabs.elementAt(_chosenTabIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.brown,
        currentIndex: _chosenTabIndex,
        // type: BottomNavigationBarType.shifting,
        onTap: _selectTab,
        items: const [
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.red,
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
