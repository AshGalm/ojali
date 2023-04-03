import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class Sallah extends StatefulWidget {
  const Sallah({super.key});

  @override
  State<Sallah> createState() => _SallahState();
}

class _SallahState extends State<Sallah> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text('السلة ')),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: size.width * 0.3,
                color: Colors.grey.withOpacity(0.1),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80',
                        width: 110,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: const [
                          Text(
                            "dsdsndjnsdjs",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "dsdsndjnsdjs",
                            style: TextStyle(fontSize: 13),
                          ),
                          Text(
                            "dsdsndjnsdjs",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: const [
                          Text(
                            "dsdsndjnsdjs",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "dsdsndjnsdjs",
                            style: TextStyle(fontSize: 13),
                          ),
                          Text(
                            "dsdsndjnsdjs",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

// Row(
//   children: [
//     // Image.asset(null ),
//     Text('بسكويت الوردة بالشوكلاطة '),
//      Text(' الصنف : طلية خاصة   '),
//      Text('  :     رقم الهاتف : 091123456789'),
//   ],
// ),
