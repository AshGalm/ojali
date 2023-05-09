import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/order_model.dart';

class OrdersProvider with ChangeNotifier {
  bool isloading = false;
  bool isFailed = false;
  // Firebase Request here
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  // List of Data
  List<OrderModel> orderList = [];

  initOrders() {
    getOrderByUid();
  }

  getOrderByUid() async {
    isloading = true;
    notifyListeners();
    await firestore
        .collection('orders')
        .where('uid', isEqualTo: auth.currentUser!.uid)
        .get()
        .then((value) {
      orderList.clear();
      for (var item in value.docs) {
        orderList.add(OrderModel.fromJson(item.data()));
      }
      isloading = false;
      notifyListeners();
    });
  }
}
