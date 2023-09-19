import 'package:food_application/assets_factory/category_factory.dart';

class Category {
  final int id;
  final String name;
  final String sourceIcon;

  Category({required this.id, required this.name, required this.sourceIcon});
}

List<Category> categories = [
  Category(
      id: 1, name: "Burgers", sourceIcon: CategoryFactory.burgerNonColored),
  Category(
      id: 2,
      name: "Fried Chickens",
      sourceIcon: CategoryFactory.friedChickenNonColored),
  Category(
      id: 3, name: "Mexicans", sourceIcon: CategoryFactory.mexicanNonColored),
  Category(id: 4, name: "Pizzas", sourceIcon: CategoryFactory.pizzaNonColored),
  Category(id: 5, name: "Fries", sourceIcon: CategoryFactory.friesNonColored),
  Category(id: 6, name: "Salads", sourceIcon: CategoryFactory.saladNonColored),
  Category(
      id: 7, name: "Desserts", sourceIcon: CategoryFactory.dessertNonColored),
];
