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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final orientation = MediaQuery.of(context).orientation;
    //debugPrint(orientation.toString());

    bool isMobileView = true;

    screenWidth > 800 ? isMobileView = false : true;

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
            SizedBox(
              height: screenHeight / 27.106875,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                MainImageFactory.homeImage1,
                height:
                    // using KisWeb  , Platform.isIOS || Platform.isAndroid
                    isMobileView ? screenHeight / 4.337 : screenHeight * 0.45,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: screenHeight / 27.106875,
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
            SizedBox(
              height: screenHeight / 27.106875,
            ),
            SizedBox(
                height: orientation == Orientation.landscape
                    ? screenHeight * 0.3
                    : screenHeight / 7.2285,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) => Padding(
                    padding:
                        EdgeInsetsDirectional.only(end: screenWidth / 34.285),
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
                                height: screenHeight / 17.348,
                                width: screenWidth / 8.228,
                                color: selectedCategoryIndex == index
                                    ? Colors.white
                                    : null,
                              ),
                              SizedBox(
                                height: screenHeight / 108.427,
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
            SizedBox(
              height: screenHeight / 27.106875,
            ),
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.75,
                    crossAxisCount: isMobileView
                        ? 2
                        : screenWidth > 1200
                            ? 5
                            : 4,
                    mainAxisSpacing: screenHeight / 20,
                    crossAxisSpacing: screenWidth / 38),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) =>
                    LayoutBuilder(builder: (context, Constraints) {
                      debugPrint(Constraints.maxWidth.toString());

                      return InkWell(
                        onTap: () async {
                          // trying to use Named Push {main page routes}
                          //Navigator.of(context).pushNamed('/detailed-product');
                          final backValue = await Navigator.of(context)
                              .push(MaterialPageRoute(
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
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height: isMobileView
                                          ? screenHeight / 86.742
                                          : orientation == Orientation.landscape
                                              ? 0
                                              : Constraints.maxHeight * 0.5,
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(14),
                                      child: Image.asset(
                                        filteredProducts[index].sourceImg,
                                        height: Constraints.maxHeight / 2,
                                        width: screenWidth / 3.74,
                                      ),
                                    ),
                                    Text(
                                      filteredProducts[index].name,
                                      style: TextStyle(
                                          fontSize:
                                              Constraints.maxHeight * 0.09,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      filteredProducts[index].category,
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize:
                                              Constraints.maxHeight * 0.065),
                                    ),
                                    SizedBox(
                                      height: screenHeight / 289.14,
                                    ),
                                    Text(
                                      "\$ ${filteredProducts[index].price.toString()}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepOrange,
                                          fontSize:
                                              Constraints.maxHeight * 0.07),
                                    ),
                                  ],
                                ),
                                PositionedDirectional(
                                  top: 0,
                                  end: 0,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        filteredProducts[index] =
                                            filteredProducts[index]
                                                .copyWithFunc(
                                                    isFavorite:
                                                        !filteredProducts[index]
                                                            .isFavorite);

                                        //debugPrint(filteredProducts[index].isFavorite.toString());

                                        final selectedItem = listOfProducts
                                            .firstWhere((element) =>
                                                element.id ==
                                                filteredProducts[index].id);

                                        final selectedItemIndex = listOfProducts
                                            .indexOf(selectedItem);

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
                                    iconSize: isMobileView &&
                                            orientation != Orientation.landscape
                                        ? 25
                                        : 40,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    ));
  }
}
