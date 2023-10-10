//Category grid screen is a widget that has a kayout or the structure iof how a widget should look in screen.
//Screen widgets are simple screen that is shown to user while widgets are the componets that will be displayed in screen
import 'package:flutter/material.dart';
import 'package:mealsapp/main.dart';
import 'package:mealsapp/model/categoryy.dart';
import 'package:mealsapp/screens/categories.dart';

class CategoryGrid extends StatelessWidget {
   CategoryGrid({super.key, required this.category,required this.onselect});

  final Category category;
  final void Function() onselect;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onselect,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),

      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.55),
                category.color.withOpacity(0.9),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              category.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
        ),
      ),
    );
  }
}
