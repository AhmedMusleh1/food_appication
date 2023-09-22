import 'package:flutter/material.dart';
import 'package:food_application/components/product.dart';
import 'package:food_application/pages/detailed_product.dart';
import 'package:food_application/pages/food_app_bottom_nav_bar.dart';
import 'package:food_application/pages/home-page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FoodBottomNavBar(),

      // routes: {
      //   '/': (context) => const FoodBottomNavBar(),
      //   '/detailed-product': (context) =>
      //       DetailedProductPage(productItem: listOfProducts[5]),
      // },
    );
  }
}
