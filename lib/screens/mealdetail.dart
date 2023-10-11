import 'package:flutter/material.dart';

import '../model/meals.dart';

class MealDetail extends StatelessWidget {
  final Meal meal;

  MealDetail({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(meal.imageUrl),
        Text(meal.title),
      ],
    );
  }
}
