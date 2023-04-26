import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ojali/models/branches_model.dart';

class BranchesProvider with ChangeNotifier {
  bool isloading = false;
  bool isFailed = false;
// Firebase Request here
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // List of Data
  List<BranchesModel> branche = [];

  initBranches() {
    getBranches();
  }

  getBranches() async {
    isloading = true;
    notifyListeners();
    await firestore.collection('branches').get().then((value) {
      branche.clear();
      for (var item in value.docs) {
        branche.add(BranchesModel.fromJson(item.data()));
      }
      isloading = false;
      notifyListeners();
    });
  }
}
