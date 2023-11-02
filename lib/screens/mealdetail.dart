import 'package:flutter/material.dart';
import 'package:mealsapp/provider/favprovider.dart';

import '../model/meals.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealDetail extends ConsumerWidget {
  final Meal meal;

  MealDetail({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favmeals = ref.watch(favoriteMealsProvider);
    final isfav = favmeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              final addedMeals = ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleMealFavoriteStatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(addedMeals
                      ? 'Meal added as favourite'
                      : 'meals removed from favourite'),
                ),
              );
            },
            icon: Icon(isfav ? Icons.star : Icons.star_border),
          ),
        ],
        title: Text(
          meal.title,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Ingredients',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            SizedBox(
              height: 20,
            ),
            for (final ingredeint in meal.ingredients)
              Text(
                ingredeint,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Steps',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.secondary),
            ),
            for (final steps in meal.steps)
              Text(
                steps,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              )
          ],
        ),
      ),
    );
  }
}
