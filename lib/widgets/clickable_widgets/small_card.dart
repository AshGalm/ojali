import 'package:flutter/material.dart';

class SmallCardWidget extends StatelessWidget {
  const SmallCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Container(
              height: size.width * 0.2,
              decoration: const BoxDecoration(boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black, blurRadius: 12.0, offset: Offset(7, 7))
              ]),
              child: Image.network(
                  'https://images.unsplash.com/photo-1539136788836-5699e78bfc75?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
            ),
          )
        ],
      ),
    );
  }
}
