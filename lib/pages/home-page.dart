// ignore_for_file: file_names

import 'package:flutter/material.dart';

import "package:food_application/assets_factory/main_images_factory.dart";
import "package:food_application/components/category.dart";
import "package:food_application/components/product.dart";
import "package:food_application/pages/detailed_product.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? selectedCategoryIndex;
  List<Product> filteredProducts = listOfProducts;

  @override
  void initState() {
    super.initState();
    filteredProducts = listOfProducts;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(Icons.menu),
                    ),
                  ),
                ),
                const Column(
                  children: [
                    Text(
                      "Current Location",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 20,
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          "Ramallah, Palestine",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )
                      ],
                    )
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.notifications),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 32.0,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                MainImageFactory.homeImage1,
                height: 200,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 32.0,
            ),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search_rounded,
                    color: Colors.grey,
                  ),
                  hintText: "Find your food here",
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: BorderSide.none,
                  )),
            ),
            const SizedBox(
              height: 32.0,
            ),
            SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsetsDirectional.only(end: 12.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (selectedCategoryIndex == null ||
                              selectedCategoryIndex != index) {
                            selectedCategoryIndex = index;
                          } else {
                            selectedCategoryIndex = null;
                            filteredProducts = listOfProducts;
                          }
                        });

                        if (selectedCategoryIndex != null) {
                          final selectedCategory =
                              categories[selectedCategoryIndex!];
                          filteredProducts = listOfProducts
                              .where((e) => e.category == selectedCategory.name)
                              .toList();
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: index == selectedCategoryIndex
                              ? Colors.deepOrange
                              : Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                categories[index].sourceIcon,
                                height: 50,
                                width: 50,
                                color: selectedCategoryIndex == index
                                    ? Colors.white
                                    : null,
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                categories[index].name,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: selectedCategoryIndex == index
                                        ? Colors.white
                                        : Colors.black54),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
            const SizedBox(
              height: 32.0,
            ),
            GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.9,
                    crossAxisCount: 2,
                    mainAxisSpacing: 18,
                    crossAxisSpacing: 18),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) => InkWell(
                      onTap: () async {
                        final backValue =
                            await Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailedProductPage(
                            productItem: filteredProducts[index],
                          ),
                        ));

                        debugPrint(backValue.toString());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)),
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(14),
                                  child: Image.asset(
                                    filteredProducts[index].sourceImg,
                                    height: 100,
                                    width: 110,
                                  ),
                                ),
                                Text(
                                  filteredProducts[index].name,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  filteredProducts[index].category,
                                  style: const TextStyle(color: Colors.grey),
                                ),
                                const SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  "\$ ${filteredProducts[index].price.toString()}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepOrange,
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 4,
                                )
                              ],
                            ),
                            PositionedDirectional(
                              top: 0,
                              end: 0,
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    filteredProducts[index] =
                                        filteredProducts[index].copyWithFunc(
                                            isFavorite: !filteredProducts[index]
                                                .isFavorite);

                                    //debugPrint(filteredProducts[index].isFavorite.toString());

                                    final selectedItem =
                                        listOfProducts.firstWhere((element) =>
                                            element.id ==
                                            filteredProducts[index].id);

                                    final selectedItemIndex =
                                        listOfProducts.indexOf(selectedItem);

                                    //debugPrint(selectedItemIndex.toString());

                                    listOfProducts[selectedItemIndex] =
                                        filteredProducts[index];

                                    // debugPrint(filteredProducts[index]
                                    //     .isFavorite
                                    //     .toString());

                                    // debugPrint(listOfProducts[selectedItemIndex]
                                    //     .isFavorite
                                    //     .toString());
                                  });
                                },
                                icon: filteredProducts[index].isFavorite
                                    ? const Icon(Icons.favorite)
                                    : const Icon(
                                        Icons.favorite_border,
                                      ),
                                color: Colors.deepOrange,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
          ],
        ),
      ),
    ));
  }
}
