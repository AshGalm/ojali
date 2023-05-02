import 'package:flutter/material.dart';
import 'package:ojali/providers/cart_provider.dart';
import 'package:ojali/screens/main_screens/store_screen.dart';
import 'package:ojali/widgets/clickable_widgets/main_button.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../helpers/const.dart';
import '../../providers/dark_theme_provider.dart';
import '../../widgets/cart_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);
    CartProvider cartProvider = Provider.of<CartProvider>(
      context,
    );

    return Scaffold(
        backgroundColor: themeListener.isDark ? darkColor : lightColor,
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.cart,
            style: TextStyle(
                color: themeListener.isDark ? Colors.white : Colors.black),
          ),
          centerTitle: true,
          backgroundColor:
              themeListener.isDark ? Colors.transparent : Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: themeListener.isDark
                ? lightColor
                : darkColor, //change your color here
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Let's order fresh items for you
            // list view of cart
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: cartProvider.getCartProductList.isEmpty
                    ? Center(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/nofood.png',
                            ),
                            Text(
                              AppLocalizations.of(context)!.nofood,
                              style: TextStyle(
                                  color: themeListener.isDark
                                      ? appColor
                                      : darkColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              AppLocalizations.of(context)!.choose,
                              style: TextStyle(
                                  color: themeListener.isDark
                                      ? lightColor
                                      : appColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: cartProvider.getCartProductList.length,
                        padding: const EdgeInsets.all(12),
                        itemBuilder: (context, index) {
                          return CartWidget(
                              productModel:
                                  cartProvider.getCartProductList[index]);
                        },
                      ),
              ),
            ),

            // total amount + pay now
            cartProvider.getCartProductList.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MainButton(
                          text: AppLocalizations.of(context)!.store,
                          withBorder: false,
                          widthFromScreen: 0.9,
                          isloading: false,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const StoreScreen()));
                          }),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: themeListener.isDark ? subColor : Colors.green,
                      ),
                      padding: const EdgeInsets.all(24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.caut,
                                style: TextStyle(
                                    color: themeListener.isDark
                                        ? lightColor.withOpacity(0.4)
                                        : Colors.grey),
                              ),

                              const SizedBox(height: 8),
                              // total price
                              const Text(
                                'calculateTotal',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),

                          // pay now
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.red.shade200),
                              borderRadius: BorderRadius.circular(28),
                            ),
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.next,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
          ],
        ));
  }
}
