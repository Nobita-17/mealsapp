import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../model/meals.dart';
import '../screens/categories.dart';
import '../screens/filter.dart';
import '../screens/mealsscreen.dart';
import 'maindrawer.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedIndex = 0;

  final List<Meal> favoutite = [];
  Map<Filter, bool> _selectedFilters = kInitialFilters;

  // void show_message(String message){
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)),);
  // }

  // void _setScreen(String identifier) {
  //   Navigator.of(context).pop();
  //   if (identifier == 'filters') {
  //     Navigator.of(context).push(
  //       MaterialPageRoute(
  //         builder: (ctx) => const FiltersScreen(),
  //       ),
  //     );
  //   }
  // }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) =>  FiltersScreen(currentFilters: _selectedFilters),
        ),
      );
      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    }
  }


  void selectfav(Meal meal) {
    final iscontain = favoutite.contains(meal);
    if (iscontain) {
      favoutite.remove(meal);
    } else {
      favoutite.add(meal);
    }
  }

  void _select(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    Widget activescreen = CategoryScreen(
      selectfav: selectfav,
      availabemeals: availableMeals,
    );

    if (selectedIndex == 1) {
      activescreen = mealsscreen(
        meals: favoutite,
        title: '',
        selectfav: selectfav,
      );
    }

    return Scaffold(
      appBar: AppBar(),
      drawer:  MainDrawer(myidentifier: _setScreen),
      body: activescreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _select,
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.fastfood_sharp), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favourites'),
        ],
      ),
    );
  }
}
