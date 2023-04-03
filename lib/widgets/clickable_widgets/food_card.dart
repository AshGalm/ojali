import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          height: 150.0,
          width: size.width * 0.9,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(0.0),
              boxShadow: const [
                BoxShadow(
                    offset: const Offset(-10, 10),
                    blurRadius: 20.0,
                    spreadRadius: 4.0)
              ]),
          child: Row(
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                fit: BoxFit.cover,
                width: 150,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: const [
                            Text(
                              'Head Title',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'sub Title',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 70,
                          width: 200,
                          child: Row(
                            children: const [
                              Expanded(
                                  child: Text(
                                'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
                                style: TextStyle(fontSize: 10),
                                softWrap: false,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                              ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
