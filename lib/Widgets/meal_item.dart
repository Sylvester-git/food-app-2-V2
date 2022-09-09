import 'package:flutter/material.dart';
import 'package:food_choice_app/Screens/meal_detail.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageurl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    required this.id,
    required this.title,
    required this.imageurl,
    required this.affordability,
    required this.complexity,
    required this.duration,
  });

  //For our complexity which is an enum, we will use a getter to change to human readable words

  String get complexitytext {
    if (complexity == Complexity.simple) {
      return 'Simple';
    } else if (complexity == Complexity.challenging) {
      return 'Challenging';
    } else {
      return 'Hard';
    }
  }

//For our affordability which is an enum, we will use a getter to change to human readable words
  String get affordabilitytext {
    if (affordability == Affordability.affordable) {
      return 'Affordable';
    } else if (affordability == Affordability.pricey) {
      return 'Expensive';
    } else {
      return 'Very Expensive';
    }
  }

  void selectmeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    );
    //This function executes after the screen has been poped.
  }

  @override
  Widget build(BuildContext context) {
    final maxhigth = MediaQuery.of(context).size.height; //737.4545454545455
    final maxwidth = MediaQuery.of(context).size.width; //392.72727272727275

    return InkWell(
      onTap: () => selectmeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageurl,
                    height: MediaQuery.of(context).size.height * 0.339,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.027,
                  right: MediaQuery.of(context).size.width * 0.0255,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.051,
                      vertical: MediaQuery.of(context).size.height * 0.0038,
                    ),
                    width: MediaQuery.of(context).size.width * 0.734,
                    color: Colors.black45,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      textAlign: TextAlign.right,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.schedule,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text('$duration min'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.work,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(complexitytext),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.attach_money_rounded,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(affordabilitytext),
                      ],
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
