import 'package:flutter/material.dart';
import '../Widgets/category_card.dart';
import '../Dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        childAspectRatio: 1.3,
        maxCrossAxisExtent: 200,
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
      ),
      children: category_data.map((catdata) {
        return CategoryCard(catdata.title, catdata.colors, catdata.Id);
      }).toList(),
    );
  }
}
