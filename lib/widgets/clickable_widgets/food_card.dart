import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  const FoodCard(
      {super.key,
      required this.productImage,
      required this.productName,
      required this.onTap,
      required this.productPrice,
      required this.productCat});
  final String productImage;
  final String productName;
  final String productCat;
  final String productPrice;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
          borderRadius: const BorderRadius.only(),
          child: Container(
            margin: const EdgeInsets.only(
                right: 25.0, left: 25.0, top: 5, bottom: 5),
            child: Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: GestureDetector(
                onTap: () {
                  onTap();
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch, // add this
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                      child: Image.network(
                          // 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                          productImage,
                          // width: 300,
                          height: 150,
                          fit: BoxFit.fill),
                    ),
                    ListTile(
                      title: Text(
                        // 'بيتزا اقراص',
                        productName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        // 'معجنات',
                        productCat,
                        style: const TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w500),
                      ),
                      trailing: Text(
                        // 'السعر 1.5 ',
                        productPrice,
                        style: const TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}



// old code 
// Container(
//       margin:
//           const EdgeInsets.only(right: 20.0, left: 20.0, top: 10, bottom: 5),
//       child: Card(
//         shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(Radius.circular(8.0))),
//         child: InkWell(
//           onTap: () {},
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch, // add this
//             children: [
//               ClipRRect(
//                 borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(8.0),
//                   topRight: Radius.circular(8.0),
//                 ),
//                 child: Image.network(
//                     'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',

//                     // width: 300,
//                     height: 150,
//                     fit: BoxFit.fill),
//               ),
//               const ListTile(
//                 title: Text(
//                   'بيتزا اقراص',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 subtitle: Text(
//                   'معجنات',
//                   style: TextStyle(
//                       color: Colors.grey, fontWeight: FontWeight.w500),
//                 ),
//                 trailing: Text(
//                   'السعر 1.5 ',
//                   style: TextStyle(
//                       color: Colors.grey, fontWeight: FontWeight.w500),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );