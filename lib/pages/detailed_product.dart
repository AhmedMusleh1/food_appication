import 'package:flutter/material.dart';
import 'package:food_application/components/product.dart';
import 'package:food_application/widgets/two-comp-column.dart';

import 'package:readmore/readmore.dart';

class DetailedProductPage extends StatefulWidget {
  final Product productItem;

  const DetailedProductPage({super.key, required this.productItem});

  @override
  State<DetailedProductPage> createState() => _DetailedProductPageState();
}

class _DetailedProductPageState extends State<DetailedProductPage> {
  int quantity = 1;

  void _decreaseQuantity() {
    setState(() {
      quantity--;
    });
  }

  void _increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  @override
  Widget build(BuildContext context) {
    int currentIndex = listOfProducts.indexOf(widget.productItem);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    bool isMobileView = true;

    screenWidth > 800 ? isMobileView = false : true;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop("any data to be returned"),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        title: Text(widget.productItem.name),
        backgroundColor: Colors.grey[100],
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                //debugPrint(widget.productItem.isFavorite.toString());

                debugPrint(listOfProducts[currentIndex].isFavorite.toString());

                listOfProducts[currentIndex].isFavorite =
                    !listOfProducts[currentIndex].isFavorite;

                debugPrint(listOfProducts[currentIndex].isFavorite.toString());

                //debugPrint(currentIndex.toString());

                //debugPrint(widget.productItem.isFavorite.toString());
              });
            },
            icon: Icon(listOfProducts[currentIndex].isFavorite
                ? Icons.favorite
                : Icons.favorite_border),
            color: Colors.deepOrange,
          ),
          SizedBox(
            width: screenWidth / 51.4285,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(color: Colors.grey[100]),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Image.asset(
                          widget.productItem.sourceImg,
                          width: double.infinity,
                          fit: BoxFit.contain,
                          height: screenHeight / 3.46968,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight / 27.106875,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth / 17.14283),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.productItem.name,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    widget.productItem.category,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black45),
                                  ),
                                ],
                              ),
                              DecoratedBox(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24.0),
                                    color: Colors.white),
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: quantity > 1
                                            ? _decreaseQuantity
                                            : null,
                                        icon: const Icon(Icons.remove)),
                                    SizedBox(
                                      width: screenWidth / 102.857,
                                    ),
                                    Text(quantity.toString()),
                                    SizedBox(
                                      width: screenWidth / 102.857,
                                    ),
                                    IconButton(
                                        onPressed: _increaseQuantity,
                                        icon: const Icon(Icons.add)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: screenHeight / 27.106875,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TwoComponentColumn(
                                  title: "Size",
                                  value: widget.productItem.size.toUpperCase()),
                              const SizedBox(
                                  height: 40, child: VerticalDivider()),
                              TwoComponentColumn(
                                  title: "Calories",
                                  value:
                                      " ${widget.productItem.calories} Kcal"),
                              const SizedBox(
                                  height: 40, child: VerticalDivider()),
                              TwoComponentColumn(
                                  title: " prepared in ",
                                  value:
                                      " ${widget.productItem.estimatedCookingTimeInMinutes} Mins"),
                            ],
                          ),
                          SizedBox(height: screenHeight / 27.106875),
                          ReadMoreText(
                            "this is ${widget.productItem.name} from ${widget.productItem.category} from this is ${widget.productItem.name} from this is ${widget.productItem.name} from this is ${widget.productItem.name} from this is ${widget.productItem.name} from this is ${widget.productItem.name} from this is ${widget.productItem.name} from this is ${widget.productItem.name} from this is ${widget.productItem.name} from this is ${widget.productItem.name} from this is ${widget.productItem.name} from this is ${widget.productItem.name} from ",
                            trimLines: 3,
                            lessStyle: const TextStyle(color: Colors.red),
                            moreStyle: const TextStyle(color: Colors.red),
                            trimMode: TrimMode.Line,
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                                fontWeight: FontWeight.w300,
                                fontFamily: "Mooli"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height:
                  isMobileView ? screenHeight * 0.1 : screenHeight / 108.4275,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 24.0, vertical: isMobileView ? 10.0 : 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "\$ ${(widget.productItem.price * quantity).toStringAsFixed(2)} ",
                      style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: screenHeight * 0.05,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0))),
                          onPressed: () {},
                          child: const Text("Checkout")),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
