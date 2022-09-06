//The enum assignes numerical values to the data inside it
//ie, simple = 0, challenging  = 1 and so on.
enum Complexity {
  simple,
  challenging,
  hard,
}

enum Affordability {
  affordable,
  pricey,
  veryPricy,
}

class meal {
  final String id;
  final List<String> categoryId;
  final String title;
  final String imageurl;
  final List<String> ingredient;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenfree;
  final bool islactosefree;
  final bool isvegetarian;
  final bool isVegan;

  const meal({
    required this.title,
    required this.id,
    required this.categoryId,
    required this.imageurl,
    required this.ingredient,
    required this.steps,
    required this.complexity,
    required this.duration,
    required this.affordability,
    required this.isGlutenfree,
    required this.isVegan,
    required this.islactosefree,
    required this.isvegetarian,
  });
}
