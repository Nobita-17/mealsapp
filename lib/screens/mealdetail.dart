import 'package:flutter/material.dart';

import '../model/meals.dart';

class MealDetail extends StatelessWidget {
  final Meal meal;



  MealDetail({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: selectfav(meal), icon: Icon(Icons.star))
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
            SizedBox(height: 20,),
            Text(
              'Ingredients',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            SizedBox(height: 20,),
            for(final ingredeint in meal.ingredients)
              Text(ingredeint,textAlign: TextAlign.center,style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground,),),
            SizedBox(height: 20,),
            Text(
              'Steps',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.secondary),
            ),
            for(final steps in meal.steps)
              Text(steps,textAlign: TextAlign.center,style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground,),)
          ],
        ),
      ),
    );
  }
}
