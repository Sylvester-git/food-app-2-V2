import 'package:flutter/material.dart';
import '../Screens/categorised_meal.dart';

class CategoryCard extends StatelessWidget {
  final String Id;
  final String title;
  final Color color;
  CategoryCard(this.title, this.color, this.Id);

  void selectcategory(BuildContext ctx) {
    Navigator.pushNamed(ctx, CategoryDetailscreen.routname, arguments: {
      'id': Id,
      'title': title, /*'appbarcolor': color*/
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectcategory(context),
      splashColor: Theme.of(context).primaryColorLight,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
