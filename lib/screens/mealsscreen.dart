import 'dart:js';

import 'package:flutter/material.dart';

import '../model/meals.dart';
import '../widget/meal_item.dart';
import 'mealdetail.dart';

class mealsscreen extends StatelessWidget {
  const mealsscreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  void myselect(BuildContext context, Meal meal) {       //chnage mealscreen to mealdetailscreen
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetail(   //shift from mealiemscreen to meal detail screen
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh ... nothing here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          Text(
            'Try Choosing Diffrent Category!',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(   //displaying List of Widegt . Data type of meal is list
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealsItemss(
          meal: meals[index],
          onselect: myselect,   //This widget takes this function as an argument
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
