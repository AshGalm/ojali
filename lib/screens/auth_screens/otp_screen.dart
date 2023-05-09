// import 'package:flutter/material.dart';
// import 'package:ojali/widgets/clickable_widgets/main_button.dart';
// import 'package:ojali/widgets/input_widgets/text_field_widget.dart';

// class OtpScreen extends StatefulWidget {
//   const OtpScreen({super.key, required String email});

//   @override
//   State<OtpScreen> createState() => _OtpScreenState();
// }

// class _OtpScreenState extends State<OtpScreen> {
//   TextEditingController restPhoneController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'اعادة تعيين كلمة السر',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const Text(
//               'قم بادخال رقم الهاتف  لاستلام رمز التأكيد',
//               style: TextStyle(
//                 fontSize: 13,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: TextFieldWidget(
//                   label: 'رقم الهاتف',
//                   controller: restPhoneController,
//                   hintText: '',
//                   validator: (String? value) {
//                     return null;
//                   },
//                   obSecureText: false),
//             ),
//             const SizedBox(height: 150),
//             MainButton(
//                 text: 'rest',
//                 withBorder: false,
//                 widthFromScreen: 0.9,
//                 isloading: false,
//                 onPressed: () {},
//                 isActive: true),
//             const SizedBox(height: 20),
//             MainButton(
//                 text: 'rest',
//                 withBorder: true,
//                 widthFromScreen: 0.9,
//                 isloading: false,
//                 onPressed: () {},
//                 isActive: true)
//           ],
//         ),
//       ),
//     );
//   }
// }
