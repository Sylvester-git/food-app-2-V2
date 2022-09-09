import 'package:flutter/material.dart';
import 'package:food_choice_app/Widgets/meal_item.dart';

import 'package:food_choice_app/models/meal.dart';

class CategoryDetailscreen extends StatefulWidget {
  //Better practice for namedpush
  static const routname = '/Category_detailpage';
  final List<meal> availablemeals;

  CategoryDetailscreen(this.availablemeals);

  @override
  State<CategoryDetailscreen> createState() => _CategoryDetailscreenState();
}

class _CategoryDetailscreenState extends State<CategoryDetailscreen> {
  late String categorytitle;
  late List<meal> displayedmeals;

//We cant use initstate because the function runs before our app context can load
//which is being used by our routearguments
//So therfore, we use another function (didChangeDependencies)
  /*@override
  void initState() {
    //Using navigaton.pushnamed for passing data to this screen
    final routeargument =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    categorytitle = routeargument['title']!;
    final categoryid = routeargument['id'];
    //TODO
    //final categoryappbarcolor = routeargument['appbarcolor'];
//We use the where method to filter the list which uses a function to create a new list
    displayedmeals = meal_data.where((meal) {
      //using the contain method to check if the meal categoryid matches the general categoryid.
      return meal.categoryId.contains(categoryid);
    }).toList();
    super.initState();
  }*/

  @override
  void didChangeDependencies() {
    //Using navigaton.pushnamed for passing data to this screen
    final routeargument =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    categorytitle = routeargument['title']!;
    final categoryid = routeargument['id'];
    //TODO
    //final categoryappbarcolor = routeargument['appbarcolor'];
//We use the where method to filter the list which uses a function to create a new list
    displayedmeals = widget.availablemeals.where((meal) {
      //using the contain method to check if the meal categoryid matches the general categoryid.
      return meal.categoryId.contains(categoryid);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedmeals.removeWhere((item) => item.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categorytitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayedmeals[index].id,
              title: displayedmeals[index].title,
              imageurl: displayedmeals[index].imageurl,
              affordability: displayedmeals[index].affordability,
              complexity: displayedmeals[index].complexity,
              duration: displayedmeals[index].duration,
              removeItem: _removeMeal,
            );
          },
          itemCount: displayedmeals.length,
        ));
  }
}
