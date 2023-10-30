import 'package:flutter/foundation.dart' as flutter;
import 'package:flutter/material.dart';
import 'package:mealsapp/data/dummy_data.dart';
import 'package:mealsapp/screens/mealsscreen.dart';
import 'package:mealsapp/model/categoryy.dart';

import '../model/meals.dart';
import '../widget/category_gridItems.dart';



class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.availabemeals});

  final List<Meal> availabemeals;


//Build Context Store the Location of Widegt in Widegt Tree.
//Here we are passing Build context Explictedly since our function is not inside the build function

  void _selectedCategory(BuildContext context, Category category) {
    final filtermeals=availabemeals.where((meal) => meal.categories.contains(category.id)).toList();
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => mealsscreen(title: category.title, meals: filtermeals,)));
  } //In this we are just changing the Screen

  @override
  Widget build(BuildContext context) {
    var category;
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
      ),
      body: GridView(                    // Displaying our Category in a GridView
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(    //Set properties to our Grid 
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (category in availableCategories)     //Loop will Form Define Each category Grid based on the Data
            CategoryGrid(category: category, onselect: () => _selectedCategory(context, category)),  //This widegt comes with a function
        ],  // This function is responsible fro making chnage in screen.
      ),
    );
  }
}
