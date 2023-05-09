import 'package:flutter/material.dart';
import 'package:ojali/models/product_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FoodCard extends StatefulWidget {
  const FoodCard({super.key, required this.onTap, required this.productModel});
  final ProductModel productModel;
  final Function onTap;

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
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
                  widget.onTap();
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch, // add this
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                      child: Image.network(widget.productModel.imageUrl,
                          height: 150, fit: BoxFit.fill),
                    ),
                    ListTile(
                      title: Text(
                        AppLocalizations.of(context)!.localeName == 'ar'
                            ? widget.productModel.nameAr
                            : widget.productModel.nameEn,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        AppLocalizations.of(context)!.localeName == 'ar'
                            ? "${widget.productModel.price} دينار"
                            : "${widget.productModel.price} LYD",
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
