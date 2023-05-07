import 'package:flutter/material.dart';
import 'package:ojali/providers/cart_provider.dart';
import 'package:ojali/widgets/clickable_widgets/main_button.dart';

import '../../helpers/const.dart';
import '../../models/product_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// import 'package:ojali/providers/prodcut_provider.dart';
import 'package:provider/provider.dart';

import '../../providers/dark_theme_provider.dart';

class FoodDetails extends StatefulWidget {
  const FoodDetails({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  // final int productID;
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);
    // final productsFunctions =
    // Provider.of<ProductProvider>(context, listen: false);
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    // final cartFunctions = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
        backgroundColor: themeListener.isDark ? darkColor : Colors.white,
        // appBar: AppBar(
        //   backgroundColor:
        //       themeListener.isDark ? Colors.transparent : Colors.transparent,
        //   elevation: 0,
        //   centerTitle: true,
        //   title: Text(
        //     AppLocalizations.of(context)!.localeName == "ar"
        //         ? widget.productModel.nameAr
        //         : widget.productModel.nameEn,
        //     style:
        //         TextStyle(color: themeListener.isDark ? lightColor : appColor),
        //   ),
        //   iconTheme: IconThemeData(
        //     color: themeListener.isDark
        //         ? lightColor
        //         : darkColor, //change your color here
        //   ),
        // ),
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .6,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.productModel.imageUrl),
                      fit: BoxFit.cover)),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.2),
                          offset: const Offset(0, -4),
                          blurRadius: 8)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              AppLocalizations.of(context)!.localeName == "ar"
                                  ? widget.productModel.nameAr
                                  : widget.productModel.nameEn,
                              style: const TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 30,
                        right: 30,
                      ),
                      child: Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.price,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.productModel.price,
                          ),
                          Text(
                            AppLocalizations.of(context)!.ly,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 30,
                        right: 30,
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.localeName == "ar"
                            ? widget.productModel.desAr
                            : widget.productModel.desEn,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 30),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.07),
                                offset: const Offset(0, -3),
                                blurRadius: 12),
                          ]),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.caut,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                widget.productModel.price,
                                style: const TextStyle(fontSize: 13),
                              ),
                            ],
                          )),
                          MainButton(
                              text: AppLocalizations.of(context)!.add_cart,
                              withBorder: false,
                              widthFromScreen: 0.5,
                              isloading: false,
                              onPressed: () {
                                ProductModel productModel = widget.productModel;
                                cartProvider.addCartProduct(productModel);
                                showMessage(AppLocalizations.of(context)!.add,
                                    Colors.green);
                              })
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
