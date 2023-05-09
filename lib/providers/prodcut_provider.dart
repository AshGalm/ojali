import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ojali/models/category_model.dart';
import 'package:ojali/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  bool isloading = false;
  bool isFailed = false;

// Firebase Request here
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // List of Data
  List<ProductModel> prdouctList = [];
  List<CategoryModel> categories = [];

  // Finction Add
  addNewProduct() {}

// intit Code
  initProducts() {
    getCats();
    getAllProducts();
    latesProduct();
  }

  // Get all Categories Data
  getCats() {
    categories.clear();
    firestore.collection('Categories').get().then((value) {
      for (var item in value.docs) {
        categories.add(CategoryModel.fromJson(item.data()));
      }

      notifyListeners();
    });
  }

// Function Get all Products
  getAllProducts() async {
    isloading = true;
    notifyListeners();
    await firestore.collection('products').get().then((value) {
      prdouctList.clear();
      for (var item in value.docs) {
        prdouctList.add(ProductModel.fromJson(item.data()));
      }
      isloading = false;
      notifyListeners();
    });
  }

// Get the latest product
  latesProduct() async {
    isloading = true;
    notifyListeners();
    await firestore
        .collection('products')
        // .orderBy('createdAt', descending: true)
        .get()
        .then((value) {
      prdouctList.clear();
      for (var item in value.docs) {
        prdouctList.add(ProductModel.fromJson(item.data()));
      }
      isloading = false;
      notifyListeners();
    });
  }

  //

//
  getProcuctByCateUID(String catUID) async {
    isloading = true;
    notifyListeners();
    await firestore
        .collection('products')
        .where('category_uid', isEqualTo: catUID)
        .get()
        .then((value) {
      prdouctList.clear();
      for (var item in value.docs) {
        prdouctList.add(ProductModel.fromJson(item.data()));
      }
      isloading = false;
      notifyListeners();
    });
  }

  //
}
