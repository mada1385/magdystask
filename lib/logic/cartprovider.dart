import 'package:flutter/cupertino.dart';
import 'package:task/logic/Product.dart';
// import 'package:provider/provider.dart';

class Cartprovider extends ChangeNotifier {
  List<Product> drinks = [
    Product(
        name: "Coca-Cola",
        image: "images/6.png",
        price: "\$45.12",
        userLiked: false,
        discount: 2),
    Product(
        name: "Lemonade",
        image: "images/7.png",
        price: "\$28.00",
        userLiked: false,
        discount: 5.2),
  ];

  List<Product> foods = [
    Product(
        cost: 25.0,
        name: "Hamburger",
        image: "images/3.png",
        price: "\$25.00",
        userLiked: false,
        discount: 10),
    Product(
        cost: 150.0,
        name: "Pasta",
        image: "images/5.png",
        price: "\$150.00",
        userLiked: false,
        discount: 7.8),
    Product(
      cost: 10.99,
      name: "Falafel",
      image: 'images/2.png',
      price: '\$10.99',
      userLiked: false,
    ),
    Product(
        cost: 50.0,
        name: "Strawberry",
        image: "images/1.png",
        price: '\$50.00',
        userLiked: false,
        discount: 14)
  ];
}
