import 'package:flutter/material.dart';
import 'package:ojali/helpers/const.dart';
import 'package:ojali/models/product_model.dart';
import 'package:ojali/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(
      context,
    );

    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(8)),
          child: ListTile(
            leading: Image.network(
              widget.productModel.imageUrl,
              height: 36,
            ),
            title: Text(
              AppLocalizations.of(context)!.localeName == "ar"
                  ? widget.productModel.nameAr
                  : widget.productModel.nameEn,
              style: const TextStyle(fontSize: 18),
            ),
            subtitle: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.price,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.productModel.price,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
            trailing: IconButton(
                icon: const Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                onPressed: () {
                  cartProvider.removeCartProduct(widget.productModel);
                  showMessage(AppLocalizations.of(context)!.remove, Colors.red);
                }),
          ),
        ));
  }
}
