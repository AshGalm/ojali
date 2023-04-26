import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ojali/providers/prodcut_provider.dart';
import 'package:ojali/screens/sub_screens/food_details_screen.dart';
import 'package:ojali/widgets/clickable_widgets/filter_button.dart';
import 'package:ojali/widgets/input_widgets/text_field_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../helpers/const.dart';
import '../../providers/dark_theme_provider.dart';
import '../../widgets/clickable_widgets/food_card.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  int seletedTabIndex = 0;

  TextEditingController searchController = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  int filterIndex = 0;
  List filtersList = [];

  String? selectedCatUid;

  // List filters = [
  //   'الكل',
  //   'معجنات',
  //   'سلاطات',
  //   'نواشف',
  // ];
  // getCats() {
  //   firestore.collection('Categories').get().then((value) {
  //     for (var element in value.docs) {
  //       filtersList.add(element.data());
  //     }
  //     setState(() {});
  //   });
  // }

  // @override
  // void initState() {
  //   getCats();
  //   super.initState();
  // }
  @override
  void initState() {
    Provider.of<ProductProvider>(context, listen: false).initProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);
    final productsFunctions =
        Provider.of<ProductProvider>(context, listen: false);
    //  Theme provider functions variable

    return Scaffold(
      backgroundColor: themeListener.isDark ? darkColor : lightColor,
      appBar: AppBar(
        backgroundColor:
            themeListener.isDark ? Colors.transparent : Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Consumer<ProductProvider>(
            builder: (context, productsProvider, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFieldWidget(
                    controller: searchController,
                    hintText: AppLocalizations.of(context)!.search,
                    perfix: const Icon(Icons.search),
                    validator: (String? value) {
                      return null;
                    },
                    obSecureText: false),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      AppLocalizations.of(context)!.foodtypes,
                      style: TextStyle(
                          color: themeListener.isDark ? lightColor : darkColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 60,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: productsProvider.categories.length,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return FilterButton(
                      isSelected: index == filterIndex,
                      onClick: () async {
                        filterIndex = index;
                        selectedCatUid =
                            productsProvider.categories[index].nameEn;
                        await firestore
                            .collection('Categories')
                            .where('name_en',
                                isEqualTo:
                                    productsProvider.categories[index].nameEn)
                            .get()
                            .then((value) {
                          selectedCatUid = value.docs[0].id;
                        });
                        if (kDebugMode) {
                          print(selectedCatUid);
                        }
                        setState(() {});
                        productsFunctions.getProcuctByCateUID(selectedCatUid!);
                      },
                      btnTitle: AppLocalizations.of(context)!.localeName == "ar"
                          ? productsProvider.categories[index].nameAr
                          : productsProvider.categories[index].nameEn,
                    );
                    // FilterButton(
                    // btnTitle:
                    //     AppLocalizations.of(context)!.localeName == "ar"
                    //         ? filtersList[index]["name_ar"]
                    //         : filtersList[index]["name_en"],
                    // isSelected: index == filterIndex,
                    // onClick: () {
                    //   setState(() {
                    //     filterIndex = index;
                    //   });
                    // });
                  },
                ),
              ),
              SizedBox(
                child: productsProvider.prdouctList.isEmpty
                    ? const Center(
                        child: Text('No DATA'),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: productsProvider.prdouctList.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return FoodCard(
                            productModel: productsProvider.prdouctList[index],
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => FoodDetails(
                                        productModel:
                                            productsProvider.prdouctList[index],
                                      )));
                            },
                            // productCat: 'معجنات',
                          );
                        }),
              )
            ],
          );
        }),
      ),
    );
  }
}



// GridView.builder(
//                 shrinkWrap: true,
//                 itemCount: 2,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemBuilder: (context, index) {
//                   return const FoodCard();
//                 },
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     childAspectRatio: 1,
//                     crossAxisSpacing: 8,
//                     mainAxisSpacing: 8),
//               ),