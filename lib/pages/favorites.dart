import 'package:flutter/material.dart';
import 'package:food_application/components/product.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<Product> favoriteList =
      listOfProducts.where((element) => element.isFavorite == true).toList();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return favoriteList.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  "there is no Favorites here",
                  style: TextStyle(fontSize: 26, fontFamily: 'Mooli'),
                ),
              ),
              TextButton(
                  onPressed: () {
                    debugPrint("We need State management here !!!");
                  },
                  child: const Text(
                    "return to Home Page",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Mooli'),
                  )),
            ],
          )
        : ListView.builder(
            itemCount: favoriteList.length,
            itemBuilder: (context, index) => Card(
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Image.asset(
                        favoriteList[index].sourceImg,
                        width: 70,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                      title: Text(
                        favoriteList[index].name,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          "${favoriteList[index].category} - \$ ${favoriteList[index].price} ",
                          style: TextStyle(fontSize: 14)),
                      trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              final selectedItem = listOfProducts.firstWhere(
                                  (element) =>
                                      element.id == favoriteList[index].id);

                              final selectedItemIndex =
                                  listOfProducts.indexOf(selectedItem);

                              listOfProducts[selectedItemIndex].isFavorite =
                                  false;

                              favoriteList = listOfProducts
                                  .where(
                                      (element) => element.isFavorite == true)
                                  .toList();
                            });
                          },
                          icon: Icon(
                            favoriteList[index].isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.deepOrange,
                          )),
                    ),
                  ),
                ));
  }
}
