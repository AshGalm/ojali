// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import '../../helpers/const.dart';
// import '../../widgets/clickable_widgets/main_button.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';

// import 'login_screen.dart';

// class VerificationScreen extends StatefulWidget {
//   const VerificationScreen({super.key});

//   @override
//   State<VerificationScreen> createState() => _VerificationScreenState();
// }

// class _VerificationScreenState extends State<VerificationScreen> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: size.height * 0.2,
//             ),
//             Container(
//               width: size.width,
//               alignment: Alignment.center,
//               child: Column(children: const [
//                 Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(
//                     'رمز التأكيد',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(
//                     'قم بإدخال رمز التأكيد الذي تم ارساله للبريد',
//                     style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(
//                     'example@mail.com',
//                     style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
//                   ),
//                 ),
//               ]),
//             ),
//             SizedBox(
//                 width: size.width,
//                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: PinCodeTextField(
//                     appContext: context,
//                     length: 6,
//                     inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                     animationType: AnimationType.fade,
//                     animationDuration: const Duration(milliseconds: 300),
//                     onChanged: (value) {},
//                     pinTheme: PinTheme(
//                         shape: PinCodeFieldShape.box,
//                         borderRadius: BorderRadius.circular(5),
//                         fieldHeight: 55,
//                         fieldWidth: 50,
//                         inactiveColor: mainColor.withOpacity(0.2),
//                         activeColor: mainColor),
//                   ),
//                 )),
//             SizedBox(height: size.height * 0.3),
//             SizedBox(
//               width: size.width,
//               child: Column(children: [
//                 MainButton(
//                   text: 'متابعة ',
//                   withBorder: false,
//                   isloading: false,
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         CupertinoPageRoute(
//                             builder: ((context) => const LoginScreen())));
//                   },
//                   widthFromScreen: 0.9,
//                 ),
//                 MainButton(
//                   text: 'رجوع',
//                   withBorder: true,
//                   isloading: false,
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   widthFromScreen: 0.9,
//                 )
//               ]),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
