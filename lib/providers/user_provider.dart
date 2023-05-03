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
  List<UserModel> userList = [];

  initUser() {
    getInfo();
  }

  Future<void> getInfo() async {
    try {
      isloading = true;
      notifyListeners();
      final value =
          await firestore.collection('users').doc(auth.currentUser?.uid).get();
      userList.clear();
      userList.add(UserModel.fromJson(value.data()!));
    } catch (e) {
      isFailed = true;
      print('Error fetching user data: $e');
    } finally {
      isloading = false;
      notifyListeners();
    }
  }
}
