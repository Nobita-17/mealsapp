import 'package:flutter/material.dart';
import 'package:mealsapp/model/meals.dart';
import 'package:mealsapp/widget/mealitemtrain..dart';
import 'package:transparent_image/transparent_image.dart';


class MealsItemss extends StatelessWidget {
  final Meal meal;

   void Function (BuildContext context,Meal meal) onselect;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }
  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  MealsItemss({Key? key, required this.meal, required this.onselect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          onselect(context,meal);     //This function will change using tap &send the meal whcih is selcted
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: Container(
                color: Colors.black45,
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 18),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10, width: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        mealitemtrait(
                            icon: Icons.schedule, label: '${meal.duration} min'),
                        SizedBox(width: 10,),
                        mealitemtrait(
                            icon: Icons.work, label: complexityText),
                        SizedBox(width: 10,),
                        mealitemtrait(
                            icon: Icons.monetization_on, label: affordabilityText),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
