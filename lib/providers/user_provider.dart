import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  bool isloading = false;
  bool isFailed = false;
// Firebase Request here
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  // List of Data
  List<UserModel> user = [];

  initUser() {
    getUsers();
  }

  getUsers() async {
    await firestore.collection('user').get().then((value) {
      for (var item in value.docs) {
        user.add(UserModel.fromJson(item.data()));
      }
      notifyListeners();
    });
  }

  getUserByUid(String userUid) async {
    isloading = true;
    notifyListeners();
    await firestore
        .collection('user')
        .where('uid', isEqualTo: userUid)
        .get()
        .then((value) {
      user.clear();
      for (var item in value.docs) {
        user.add(UserModel.fromJson(item.data()));
      }
      isloading = false;
      notifyListeners();
    });
  }
}
