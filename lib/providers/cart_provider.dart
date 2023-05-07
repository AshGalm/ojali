import 'package:flutter/material.dart';
import 'package:ojali/models/product_model.dart';

class CartProvider with ChangeNotifier {
  final List<ProductModel> _cartProductList = [];

// add to cart
  void addCartProduct(ProductModel productModel) {
    _cartProductList.add(productModel);
    notifyListeners();
  }

// remove form cart
  void removeCartProduct(ProductModel productModel) {
    _cartProductList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> get getCartProductList => _cartProductList;
}
