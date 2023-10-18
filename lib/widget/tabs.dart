import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../model/meals.dart';
import '../screens/categories.dart';
import '../screens/filter.dart';
import '../screens/mealsscreen.dart';
import 'maindrawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});



  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedIndex = 0;

  final List<Meal> favoutite = [];

  // void show_message(String message){
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)),);
  // }

  void _setScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
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
    Widget activescreen = CategoryScreen(
      selectfav: selectfav,
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
