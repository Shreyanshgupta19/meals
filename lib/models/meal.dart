
  enum Complexity {  // enum class which shows category of food
  simple,
  challenging,
  hard,
  }

  enum Affordability {  // enum class which shows price ranges pf food
  affordable,
  pricey,
  luxurious,
  }

  class Meal {   // class

         // constructor
  Meal({
  required this.id,
  required this.categories,
  required this.title,
  required this.imageUrl,
  required this.ingredients,
  required this.steps,
  required this.duration,
  required this.complexity,
  required this.affordability,
  required this.isGlutenFree,
  required this.isLactoseFree,
  required this.isVegan,
  required this.isVegetarian,
  });

          // properties
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;     // it calls Complexity enum class
  final Affordability affordability;  // it calls Affordability enum class
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  }
