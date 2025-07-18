import 'package:flutter/material.dart';
import 'package:minimal_shop/models/product_model.dart';

class ShopModel extends ChangeNotifier {
  // Product for sale
  final List<ProductModel> _shop = [
    // product 1
    ProductModel(
      productName: "Goodnight PUNPUN",
      productPrice: 330.00,
      description:
          "Goodnight Punpun: Inio Asano’s dark coming-of-age seinen manga follows Punpun, a bird-like boy, navigating trauma, love, and depression through experimental art.",
      imagePath: "assets/images/Goodnight Punpun.jpg",
    ),
    // product 2
    ProductModel(
      productName: "Houseki no Kuni",
      productPrice: 340.00,
      description:
          "Houseki no Kuni: Haruko Ichikawa’s fantasy seinen manga tracks Phosphophyllite, a gem-like being, exploring identity and loss in a tragic, beautifully drawn world.",
      imagePath: "assets/images/Houseki no Kuni.jpg",
    ),
    // product 3
    ProductModel(
      productName: "20th Century Boys",
      productPrice: 320.00,
      description:
          "20th Century Boys: Naoki Urasawa’s mystery seinen manga follows Kenji uncovering a cult’s apocalyptic plot tied to childhood games, blending sci-fi and nostalgia.",
      imagePath: "assets/images/20th Century Boys.jpg",
    ),
    // product 4
    ProductModel(
      productName: "Homunculus",
      productPrice: 310.00,
      description:
          "Homunculus: Hideo Yamamoto’s psychological seinen manga follows Susumu, who sees inner distortions after trepanation, exploring identity with surreal, unsettling art.",
      imagePath: "assets/images/Homunculus.jpg",
    ),
  ];

  // User cart
  List<ProductModel> _cart = [];

  // get product list
  List<ProductModel> get shop => _shop;

  // get user cart
  List<ProductModel> get cart => _cart;

  // add item to cart
  void addToCart(ProductModel item) {
    _cart.add(item);
    notifyListeners();
  }

  // remove item from cart
  void removeFromCart(ProductModel item) {
    _cart.remove(item);
    notifyListeners();
  }
}
