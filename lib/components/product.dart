import 'package:food_application/assets_factory/product_factoy.dart';

class Product {
  final int id;
  final String name;
  final String category;
  final double price;
  final String sourceImg;
  final String estimatedTime;
  final int noOFSales;
  final String size;
  final double calories;
  final int estimatedCookingTimeInMinutes;
  bool isFavorite;

  Product({
    this.isFavorite = false,
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.sourceImg,
    this.estimatedTime = "30 mins",
    this.noOFSales = 2,
    required this.size,
    required this.calories,
    required this.estimatedCookingTimeInMinutes,
  });

  Product copyWithFunc({bool? isFavorite}) {
    return Product(
        id: id,
        name: name,
        category: category,
        price: price,
        sourceImg: sourceImg,
        size: size,
        calories: calories,
        isFavorite: isFavorite ?? this.isFavorite,
        estimatedCookingTimeInMinutes: estimatedCookingTimeInMinutes);
  }
}

List<Product> listOfProducts = [
  // Burgers
  Product(
      id: 1,
      name: "Bacon Burger",
      category: "Burgers",
      price: 7.5,
      sourceImg: ProductFactory.baconBurger,
      size: "medium",
      calories: 244,
      estimatedCookingTimeInMinutes: 12),
  Product(
      id: 2,
      name: "Chicken Burger",
      category: "Burgers",
      price: 8.5,
      sourceImg: ProductFactory.chickenBurger,
      size: "medium",
      calories: 256,
      estimatedCookingTimeInMinutes: 10),
  Product(
      id: 3,
      name: "Classic Burger",
      category: "Burgers",
      price: 9.5,
      sourceImg: ProductFactory.classicBurger,
      size: "medium",
      calories: 222,
      estimatedCookingTimeInMinutes: 9),
  Product(
      id: 4,
      name: "Onion Burger",
      category: "Burgers",
      price: 10.5,
      sourceImg: ProductFactory.onionBurger,
      size: "medium",
      calories: 280,
      estimatedCookingTimeInMinutes: 13),
  Product(
      id: 5,
      name: "Kids Burger",
      category: "Burgers",
      price: 3.5,
      sourceImg: ProductFactory.kidsBurger,
      size: "small",
      calories: 120,
      estimatedCookingTimeInMinutes: 5),
  Product(
      id: 6,
      name: "Mashrom Burger",
      category: "Burgers",
      price: 8.5,
      sourceImg: ProductFactory.mashromBurger,
      size: "medium",
      calories: 220,
      estimatedCookingTimeInMinutes: 11),
  Product(
      id: 7,
      name: "Vegan Burger",
      category: "Burgers",
      price: 9.5,
      sourceImg: ProductFactory.veganBurger,
      size: "medium",
      calories: 140,
      estimatedCookingTimeInMinutes: 9),

  //Fried Chickens
  Product(
      id: 8,
      name: "Classic",
      category: "Fried Chickens",
      price: 18.5,
      sourceImg: ProductFactory.friedChicken,
      size: "Large",
      calories: 201,
      estimatedCookingTimeInMinutes: 15),
  Product(
      id: 9,
      name: "Hot Wings",
      category: "Fried Chickens",
      price: 12.5,
      sourceImg: ProductFactory.hotWings,
      size: "medium",
      calories: 208,
      estimatedCookingTimeInMinutes: 11),
  Product(
      id: 10,
      name: "Tenders",
      category: "Fried Chickens",
      price: 4.5,
      sourceImg: ProductFactory.tenders,
      size: "small",
      calories: 150,
      estimatedCookingTimeInMinutes: 14),
  Product(
      id: 11,
      name: "Zinger Sandwish",
      category: "Fried Chickens",
      price: 10.5,
      sourceImg: ProductFactory.zingerSandwish,
      size: "medium",
      calories: 230,
      estimatedCookingTimeInMinutes: 9),

  // Fries
  Product(
      id: 12,
      name: "Cheese Fries",
      category: "Fries",
      price: 2.5,
      sourceImg: ProductFactory.cheeseFries,
      size: "small",
      calories: 144,
      estimatedCookingTimeInMinutes: 5),
  Product(
      id: 13,
      name: "Curly Fries",
      category: "Fries",
      price: 3.5,
      sourceImg: ProductFactory.curlyFries,
      size: "small",
      calories: 130,
      estimatedCookingTimeInMinutes: 7),
  Product(
      id: 14,
      name: "mixed Fries",
      category: "Fries",
      price: 4.5,
      sourceImg: ProductFactory.shapedFries,
      size: "small",
      calories: 160,
      estimatedCookingTimeInMinutes: 8),
  Product(
      id: 15,
      name: "widges Fries",
      category: "Fries",
      price: 4.5,
      sourceImg: ProductFactory.wigdesFries,
      size: "small",
      calories: 150,
      estimatedCookingTimeInMinutes: 5),

  // Mexicans
  Product(
      id: 16,
      name: "Elote",
      category: "Mexicans",
      price: 5.5,
      sourceImg: ProductFactory.elote,
      size: "medium",
      calories: 184,
      estimatedCookingTimeInMinutes: 9),
  Product(
      id: 17,
      name: "Pozole",
      category: "Mexicans",
      price: 6.5,
      sourceImg: ProductFactory.pozole,
      size: "small",
      calories: 180,
      estimatedCookingTimeInMinutes: 10),
  Product(
      id: 18,
      name: "Tacos",
      category: "Mexicans",
      price: 7.5,
      sourceImg: ProductFactory.tacos,
      size: "medium",
      calories: 194,
      estimatedCookingTimeInMinutes: 12),
  Product(
      id: 19,
      name: "Torta Ahogada",
      category: "Mexicans",
      price: 8.5,
      sourceImg: ProductFactory.tortaAhogada,
      size: "medium",
      calories: 134,
      estimatedCookingTimeInMinutes: 19),

  //Pizzas
  Product(
      id: 20,
      name: "Breakfast Pizza",
      category: "Pizzas",
      price: 15.5,
      sourceImg: ProductFactory.breakfastPizza,
      size: "Large",
      calories: 403,
      estimatedCookingTimeInMinutes: 20),
  Product(
      id: 21,
      name: "Cheese Pizza",
      category: "Pizzas",
      price: 16.5,
      sourceImg: ProductFactory.cheesPizza,
      size: "Large",
      calories: 420,
      estimatedCookingTimeInMinutes: 18),
  Product(
      id: 22,
      name: "Cherry Pizza",
      category: "Pizzas",
      price: 16.5,
      sourceImg: ProductFactory.cherryTomatoPizza,
      size: "Large",
      calories: 450,
      estimatedCookingTimeInMinutes: 15),
  Product(
      id: 23,
      name: "Pepporoni Pizza",
      category: "Pizzas",
      price: 17.5,
      sourceImg: ProductFactory.pepporoniPizza,
      size: "Large",
      calories: 475,
      estimatedCookingTimeInMinutes: 19),
  Product(
      id: 24,
      name: "Vegan Pizza ",
      category: "Pizzas",
      price: 13.5,
      sourceImg: ProductFactory.veganPizza,
      size: "Large",
      calories: 320,
      estimatedCookingTimeInMinutes: 17),

  // Salads
  Product(
      id: 25,
      name: "Cesar",
      category: "Salads",
      price: 3.5,
      sourceImg: ProductFactory.cesarSalad,
      size: "medium",
      calories: 140,
      estimatedCookingTimeInMinutes: 5),
  Product(
      id: 26,
      name: "Green",
      category: "Salads",
      price: 6.5,
      sourceImg: ProductFactory.greenSalad,
      size: "medium",
      calories: 114,
      estimatedCookingTimeInMinutes: 6),
  Product(
      id: 27,
      name: "Steak",
      category: "Salads",
      price: 4.5,
      sourceImg: ProductFactory.steakSalad,
      size: "medium",
      calories: 132,
      estimatedCookingTimeInMinutes: 8),
  Product(
      id: 28,
      name: "Summer",
      category: "Salads",
      price: 5.5,
      sourceImg: ProductFactory.summerSalad,
      size: "medium",
      calories: 108,
      estimatedCookingTimeInMinutes: 9),

  // Desserts
  Product(
      id: 29,
      name: "Cheese Cake",
      category: "Desserts",
      price: 5.5,
      sourceImg: ProductFactory.cheeseCake,
      size: "small",
      calories: 80,
      estimatedCookingTimeInMinutes: 5),
  Product(
      id: 30,
      name: "Molton Cake",
      category: "Desserts",
      price: 5.5,
      sourceImg: ProductFactory.moltonCake,
      size: "small",
      calories: 85,
      estimatedCookingTimeInMinutes: 4),
  Product(
      id: 31,
      name: "Oreo Cake",
      category: "Desserts",
      price: 4.5,
      sourceImg: ProductFactory.oreoCake,
      size: "small",
      calories: 89,
      estimatedCookingTimeInMinutes: 4),
  Product(
      id: 32,
      name: "Sugar-Free Cake",
      category: "Desserts",
      price: 4.5,
      sourceImg: ProductFactory.sugarFreeCake,
      size: "small",
      calories: 92,
      estimatedCookingTimeInMinutes: 4),
];
