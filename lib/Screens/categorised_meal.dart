import 'package:flutter/material.dart';
import 'package:food_choice_app/Widgets/meal_item.dart';
import '../models/meal.dart';
import '../Dummy_data.dart';

class CategoryDetailscreen extends StatelessWidget {
  //Better practice for namedpush
  static const routname = '/Category_detailpage';

  //final String categoryId;
  //final String categorytitle;

  //CategoryDetailscreen(this.categoryId, this.categorytitle);

  @override
  Widget build(BuildContext context) {
    //Using navigaton.pushnamed
    final routeargument =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categorytitle = routeargument['title'];
    final categoryid = routeargument['id'];
//We use the where method to filter the list which uses a function to create a new list
    final categoriesdmeal = meal_data.where((meal) {
      //using the contain method to check if the meal categoryid matches the general categoryid.
      return meal.categoryId.contains(categoryid);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categorytitle!),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              title: categoriesdmeal[index].title,
              imageurl: categoriesdmeal[index].imageurl,
              affordability: categoriesdmeal[index].affordability,
              complexity: categoriesdmeal[index].complexity,
              duration: categoriesdmeal[index].duration,
            );
          },
          itemCount: categoriesdmeal.length,
        ));
  }
}
