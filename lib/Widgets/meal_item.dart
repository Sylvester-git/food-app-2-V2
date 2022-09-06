import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageurl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
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

  void selectmeal() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectmeal,
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
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    width: 300,
                    color: Colors.black45,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
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
                          width: 6,
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
                          width: 6,
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
                          width: 6,
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
