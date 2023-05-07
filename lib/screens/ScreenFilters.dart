import 'package:flutter/material.dart';

import 'package:flutter_meals_app/widgets/WidgetMainDrawer.dart';

class ScreenFilters extends StatefulWidget {
  const ScreenFilters(
      {super.key, required this.currenFilters, required this.saveFilters});

  final Function saveFilters;
  final Map<String, bool> currenFilters;

  static const routeName = '/filters';

  @override
  State<ScreenFilters> createState() => _ScreenFiltersState();
}

class _ScreenFiltersState extends State<ScreenFilters> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currenFilters['gluten']!;
    _lactoseFree = widget.currenFilters['lactose']!;
    _vegetarian = widget.currenFilters['vegetarian']!;
    _lactoseFree = widget.currenFilters['vegan']!;
    super.initState();
  }

  SwitchListTile _buildToggle(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: (newValue) => updateValue(newValue),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      drawer: const WidgetMainDrawer(),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.save),
          onPressed: () {
            final Map<String, bool> selectedFilters = {
              'gluten': _glutenFree,
              'lactose': _lactoseFree,
              'vegetarian': _vegetarian,
              'vegan': _vegan,
            };
            widget.saveFilters(selectedFilters);
          }),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              'Adjust your filters:',
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildToggle(
                  'Gluten_Free',
                  'you know what I mean',
                  _glutenFree,
                  (newValue) {
                    setState(
                      () {
                        _glutenFree = newValue;
                      },
                    );
                  },
                ),
                _buildToggle(
                  'Lactose_Free',
                  'you know what I mean',
                  _lactoseFree,
                  (newValue) {
                    setState(
                      () {
                        _lactoseFree = newValue;
                      },
                    );
                  },
                ),
                _buildToggle(
                  'Vegetarian',
                  'you know what I mean',
                  _vegetarian,
                  (newValue) {
                    setState(
                      () {
                        _vegetarian = newValue;
                      },
                    );
                  },
                ),
                _buildToggle(
                  'Vegan',
                  'you know what I mean',
                  _vegan,
                  (newValue) {
                    setState(
                      () {
                        _vegan = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
