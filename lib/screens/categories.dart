import 'package:flutter/foundation.dart' as flutter;
import 'package:flutter/material.dart';
import 'package:mealsapp/data/dummy_data.dart';
import 'package:mealsapp/screens/mealsscreen.dart';
import 'package:mealsapp/model/categoryy.dart';

import '../widget/category_gridItems.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  void _selectedCategory(BuildContext context, Category category) {
    final filtermeals= dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => mealsscreen(title: category.title, meals: filtermeals)));
  }

  @override
  Widget build(BuildContext context) {
    var category;
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (category in availableCategories)
            CategoryGrid(category: category, onselect: () => _selectedCategory(context, category)),
        ],
      ),
    );
  }
}
