import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  bool isloading = false;
  bool isFailed = false;
// Firebase Request here
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  // List of Data
  UserModel? userModel;

  initUser() {
    getInfo();
  }

  Future<void> getInfo() async {
    try {
      isloading = true;
      notifyListeners();
      var value = await firestore
          .collection('users')
          .doc(auth.currentUser?.uid)
          // .where('uid', isEqualTo: auth.currentUser!.uid)
          .get();

      if (value.data()!.isNotEmpty) {
        userModel = UserModel.fromJson(value.data()!);
      } else {}

      // userModel = UserModel.fromJson(value.docs.first.data());
    } catch (e) {
      isFailed = true;
      if (kDebugMode) {
        print('Error fetching user data: $e');
      }
    } finally {
      isloading = false;
      notifyListeners();
    }
  }
}
