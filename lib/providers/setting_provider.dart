// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// import '../models/report_model.dart';

// class SettingProvider with ChangeNotifier {
//   bool isloading = false;
//   bool isFailed = false;

//   List<ReportModel> report = [];

// // Firebase Request here
//   FirebaseFirestore firestore = FirebaseFirestore.instance;

//   sendIsussApp(String title, String des) async {
//     isloading = true;
//     notifyListeners();
//     await firestore.collection('reportApp').add({
//       'title': title,
//       'des': des,
//     }).then((value) {
//       isloading = false;
//       notifyListeners();
//     });
//   }
// }
