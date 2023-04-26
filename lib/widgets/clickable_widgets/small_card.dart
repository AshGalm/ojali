import 'package:flutter/material.dart';

import '../../models/product_model.dart';

class SmallCardWidget extends StatefulWidget {
  const SmallCardWidget(
      {super.key, required this.productModel, required this.onTap});
  final ProductModel productModel;
  final Function onTap;

  @override
  State<SmallCardWidget> createState() => _SmallCardWidgetState();
}

class _SmallCardWidgetState extends State<SmallCardWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              widget.onTap();
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                height: size.width * 0.3,
                decoration: const BoxDecoration(boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black,
                      blurRadius: 12.0,
                      offset: Offset(7, 7))
                ]),
                child: Image.network(widget.productModel.imageUrl),
              ),
            ),
          )
        ],
      ),
    );
  }
}
