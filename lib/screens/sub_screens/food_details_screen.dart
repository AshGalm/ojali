import 'package:flutter/material.dart';

// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:ojali/providers/prodcut_provider.dart';
// import 'package:provider/provider.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails({
    super.key,
  });
  // final int productID;

  // @override
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('product details'),
      ),
      body: const Text('here'),
    );
  }
}

// code 2
//  DefaultTabController(
//       length: 3,
//       child: Scaffold(
//           appBar: AppBar(
//             flexibleSpace:
//                 Column(mainAxisAlignment: MainAxisAlignment.end, children: [
//               TabBar(tabs: [
//                 Tab(
//                   text: AppLocalizations.of(context)!.det1,
//                 ),
//                 Tab(
//                   text: AppLocalizations.of(context)!.det2,
//                 ),
//                 Tab(
//                   text: AppLocalizations.of(context)!.det3,
//                 ),
//               ]),
//             ]),
//           ),
//           body: const TabBarView(children: [
//             Icon(Icons.directions_car),
//             Icon(Icons.abc),
//             Icon(Icons.bike_scooter),
//           ])),
//     );
// code 2


// details tab

          // const SizedBox(
          //   child: Text(
          //     'بسكويت الوردة بالنوتيل',
          //     style: TextStyle(
          //         fontSize: 16,
          //         fontWeight: FontWeight.bold),
          //   ),
          // ),
          // SizedBox(
          //   child: Row(
          //     children: const [
          //       Text(
          //         'الصنف: ',
          //         style: TextStyle(
          //             fontSize: 13,
          //             fontWeight: FontWeight.w500),
          //       ),
          //       Text(
          //         'نواشف',
          //         style: TextStyle(
          //             fontSize: 13,
          //             fontWeight: FontWeight.w700),
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: SizedBox(
          //       height: size.width * 0.4,
          //       child: const Text(
          //         'Text largeeeeeeedksjfojkjfkjfrjfksdjlkfjlidsjfiljeoifjojfioejfoijseiofjejfoisjfeiojeiofjoejfiejfijeifjoejfeijfijeifoeeeeeeeeeeeeeeee',
          //         // overflow: TextOverflow.ellipsis,
          //         style: TextStyle(
          //           fontSize: 13,
          //           fontWeight: FontWeight.w500,
          //         ),
          //       ),
          //     ),
          //   ),
          // )