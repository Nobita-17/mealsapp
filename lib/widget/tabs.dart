import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/dummy_data.dart';
import '../model/meals.dart';
import '../screens/categories.dart';
import '../screens/filter.dart';
import '../screens/mealsscreen.dart';
import 'maindrawer.dart';
import 'package:mealsapp/provider/favprovider.dart';
import 'package:mealsapp/provider/filterprovider.dart';    //ProviderFilters.Filter.glutenFreeError clash occured here


const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int selectedIndex = 0;




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
       await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) =>  FiltersScreen(),
        ),
      );

    }
  }


  void _select(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final activefilter=ref.watch(filtermealProvider);
    final availableMeals = dummyMeals.where((meal) {
      if (activefilter[Filter.glutenFree]! && !meal.isGlutenFree) {
        print('gluten free filter');
        return false;

      }
      if (activefilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activefilter[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (activefilter[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    Widget activescreen = CategoryScreen(
      availabemeals: availableMeals,
    );

    if (selectedIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activescreen = mealsscreen(
        meals: favoriteMeals,
        title: '',
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
