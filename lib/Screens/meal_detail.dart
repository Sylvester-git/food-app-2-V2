import 'package:flutter/material.dart';
import '../Dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = './meal_detail';

  final Function togglefavorite;
  final Function isfavorite;
  MealDetailScreen(this.togglefavorite, this.isfavorite);

  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context)!.settings.arguments as String;
//Using the .firstwhere to check if the individual meal id is the same as the general meal id to
//filter the outputs.
    final selectedmeal = meal_data.firstWhere((meal) {
      return meal.id == mealid;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedmeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.407,
              width: double.infinity,
              child: Image.network(
                selectedmeal.imageurl,
                fit: BoxFit.cover,
              ),
            ),
            //Ingredient title
            _buildtitlesection(context, 'Ingredients'),
            //Ingredient list.
            _buildlistSection(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).splashColor,
                    child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(selectedmeal.ingredient[index])),
                  );
                },
                itemCount: selectedmeal.ingredient.length,
              ),
              context,
            ),
            //Steps title.
            _buildtitlesection(context, 'Steps'),
            //Steps list.
            _buildlistSection(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('#${index + 1}'),
                        ),
                        title: Text(
                          selectedmeal.steps[index],
                        ),
                      ),
                      const Divider(
                        color: Colors.black54,
                      ),
                    ],
                  );
                },
                itemCount: selectedmeal.steps.length,
              ),
              context,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isfavorite(mealid)
              ? Icons.favorite_rounded
              : Icons.favorite_outline_rounded,
        ),
        onPressed: () => togglefavorite(mealid),
      ),
    );
  }

  Widget _buildtitlesection(BuildContext ctx, String title) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(ctx).size.height * 0.0136,
      ),
      child: Text(
        title,
        style: Theme.of(ctx).textTheme.headline5,
      ),
    );
  }

  Widget _buildlistSection(Widget child, BuildContext ctx) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(2),
      height: MediaQuery.of(ctx).size.height * 0.203,
      width: MediaQuery.of(ctx).size.width * 0.891,
      child: child,
    );
  }
}
