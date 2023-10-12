import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../screens/categories.dart';
import '../screens/mealsscreen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});



  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
 int selectedIndex = 0;

 void _select(int index) {
   setState(() {
     selectedIndex = index;
   });
 }

  @override


  Widget build(BuildContext context) {
    Widget activescreen = CategoryScreen();


    if(selectedIndex==1){
      activescreen= const mealsscreen(meals: [], title: '',);

    }

    return Scaffold(
      body: activescreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _select,
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.fastfood_sharp),label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favourites'),
      ],

      ),
    );
  }
}
