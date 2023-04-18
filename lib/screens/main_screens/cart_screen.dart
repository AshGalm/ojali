import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../helpers/const.dart';
import '../../providers/dark_theme_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);

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
                child: ListView.builder(
                  itemCount: 2,
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8)),
                          child: ListTile(
                            leading: Image.network(
                              'https://images.unsplash.com/photo-1539136788836-5699e78bfc75?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                              height: 36,
                            ),
                            title: const Text(
                              'title',
                              style: TextStyle(fontSize: 18),
                            ),
                            subtitle: const Text(
                              'Categories',
                              style: TextStyle(fontSize: 12),
                            ),
                            trailing: IconButton(
                                icon: const Icon(Icons.cancel),
                                onPressed: () {}),
                          ),
                        ));
                  },
                ),
              ),
            ),

            // total amount + pay now

            Padding(
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
