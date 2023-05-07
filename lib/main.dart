import 'package:flutter/material.dart';
import 'package:flutter_meals_app/data/data.dart';
import 'package:flutter_meals_app/models/meal.dart';

import 'package:flutter_meals_app/screens/ScreenMeals.dart';
import 'package:flutter_meals_app/screens/ScreenMealDetails.dart';
import 'package:flutter_meals_app/screens/ScreenTab.dart';
import 'package:flutter_meals_app/screens/ScreenFilters.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  List<Meal> _mealData = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> inputFilters) {
    setState(() {
      _filters = inputFilters;
      _mealData = DUMMY_MEALS.where(
        (element) {
          if (_filters['gluten']! && !element.isGlutenFree) {
            return false;
          }
          if (_filters['lactose']! && !element.isLactoseFree) {
            return false;
          }
          if (_filters['vegetarian']! && !element.isVegetarian) {
            return false;
          }
          if (_filters['vegan']! && !element.isVegan) {
            return false;
          }
          return true;
        },
      ).toList();
    });
  }

  void _toggleFavorite(int mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(int id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lime,
        canvasColor: Colors.orange.shade50,
        fontFamily: 'Raleway',
      ),
      // home: const ScreenCategories(),
      // initialRoute: '/', // this is the default route
      routes: {
        '/': (ctx) => ScreenTab(favoriteMeals: _favoriteMeals),
        ScreenMeals.routeName: (ctx) => ScreenMeals(
              mealsData: _mealData,
            ),
        ScreenMealDetails.routeName: (ctx) => ScreenMealDetails(
            isFavorite: _isMealFavorite, toggleFavorite: _toggleFavorite),
        ScreenFilters.routeName: (ctx) =>
            ScreenFilters(currenFilters: _filters, saveFilters: _setFilters),
      },
      // onGenerateRoute: (settings) {
      //   // this can be used to check unexpected route name
      //   // if (settings.name ...) {return someRoute}
      //   return MaterialPageRoute(
      //     builder: (ctx) => const ScreenCategories(),
      //   );
      // },
      // onUnknownRoute: (settings) {
      //   same as onGeneratedRoute but lower priority.
      //   can be used as last-standing route before error.
      //   404 page for example
      // },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
