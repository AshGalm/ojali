import 'package:flutter/material.dart';
import 'package:ojali/providers/branches_provider.dart';
import 'package:ojali/providers/dark_theme_provider.dart';
import 'package:ojali/screens/main_screens/cart_screen.dart';
import 'package:provider/provider.dart';

import '../../helpers/const.dart';
import '../../providers/prodcut_provider.dart';
import '../../widgets/clickable_widgets/branches_card.dart';
import '../../widgets/clickable_widgets/small_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../widgets/static_widgets/carousel_widget.dart';
import '../../widgets/static_widgets/welcome_card_widget.dart';
import '../sub_screens/food_details_screen.dart';
import 'our_branches_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    Provider.of<ProductProvider>(context, listen: false).initProducts();
    Provider.of<BranchesProvider>(context, listen: false).initBranches();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    // Listening to the theme provider
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);
    // final productsFunctions =
    // Provider.of<ProductProvider>(context, listen: false);
    //  Theme provider functions variable

    return Scaffold(
      backgroundColor: themeListener.isDark ? darkColor : lightColor,
      appBar: AppBar(
        backgroundColor:
            themeListener.isDark ? Colors.transparent : Colors.transparent,
        elevation: 0,
        title: Text(
          AppLocalizations.of(context)!.ojali,
          style: TextStyle(
              color: themeListener.isDark ? lightColor : darkColor,
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(12.0),
        //     child: GestureDetector(
        //       onTap: () {
        //         themeFunction.switchMode();
        //         Provider.of<DarkThemeProvider>(context, listen: true)
        //             .switchMode();
        //       },
        //       child: Icon(
        //         themeListener.isDark
        //             ? CupertinoIcons.slowmo
        //             : CupertinoIcons.moon_stars,
        //         color: themeListener.isDark ? Colors.white : Colors.black,
        //         size: 30,
        //       ),
        //     ),
        //   ),
        // ],
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CartScreen()));
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(
              Icons.shopping_cart,
              size: 40,
              color: themeListener.isDark ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer2<ProductProvider, BranchesProvider>(
            builder: (context, productsProvider, branchProvider, child) {
          return Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: TextFieldWidget(
              //       controller: searchController,
              //       hintText: AppLocalizations.of(context)!.search,
              //       obSecureText: false,
              //       perfix: const Icon(Icons.search),
              //       validator: (String? value) {
              //         return null;
              //       }),
              // ),
              const SizedBox(
                height: 20,
              ),
              const CarouselWidget(),
              const WelcomeUser(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Text(
                        AppLocalizations.of(context)!.newoj,
                        style: TextStyle(
                            color:
                                themeListener.isDark ? lightColor : darkColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                    SizedBox(
                      height: 100,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: productsProvider.prdouctList.length,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return SmallCardWidget(
                                productModel:
                                    productsProvider.prdouctList[index],
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => FoodDetails(
                                            productModel: productsProvider
                                                .prdouctList[index],
                                          )));
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Text(
                        AppLocalizations.of(context)!.famsoj,
                        style: TextStyle(
                            color:
                                themeListener.isDark ? lightColor : darkColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                    SizedBox(
                      height: 100,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 1,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return SmallCardWidget(
                                productModel:
                                    productsProvider.prdouctList[index],
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => FoodDetails(
                                            productModel: productsProvider
                                                .prdouctList[index],
                                          )));
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Text(
                        AppLocalizations.of(context)!.branche,
                        style: TextStyle(
                            color:
                                themeListener.isDark ? lightColor : darkColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                    SizedBox(
                      width: 600,
                      height: 100,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: branchProvider.branche.length,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return BranchCard(
                            branch: branchProvider.branche[index],
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => BranchesScreen(
                                        branch: branchProvider.branche[index],
                                      )));
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
