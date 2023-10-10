import 'package:flutter/material.dart';

import '../model/meals.dart';

class mealsscreen extends StatelessWidget {
  const mealsscreen({super.key,required this.title,required this.meals});

  final String title;
  final List<Meal> meals;


  @override
  Widget build(BuildContext context) {
    Widget content= Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
       children: [
         Text('Uh oh ... nothing here!',
           style: Theme.of(context).textTheme.headlineLarge!.copyWith(
             color: Theme.of(context).colorScheme.onBackground,
           ),
         ),
         Text('Try Choosing Diffrent Category!',
           style: Theme.of(context).textTheme.bodyMedium!.copyWith(
             color: Theme.of(context).colorScheme.secondary,
           ),
         ),
       ],
    ),
    );

    if(meals.isNotEmpty)
      {
        content=ListView.builder(
          itemCount: meals.length,
          itemBuilder:(ctx, index)=>Text(meals[index].title),);
      }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
