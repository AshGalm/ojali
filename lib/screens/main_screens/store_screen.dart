import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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

  // List filters = [
  //   'الكل',
  //   'معجنات',
  //   'سلاطات',
  //   'نواشف',
  // ];
  getCats() {
    firestore.collection('Categories').get().then((value) {
      for (var element in value.docs) {
        filtersList.add(element.data());
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    getCats();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);

    //  Theme provider functions variable

    return Scaffold(
      backgroundColor: themeListener.isDark ? darkColor : lightColor,
      appBar: AppBar(
        backgroundColor:
            themeListener.isDark ? Colors.transparent : Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
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
              child: Row(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: filtersList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return FilterButton(
                            btnTitle:
                                AppLocalizations.of(context)!.localeName == "ar"
                                    ? filtersList[index]["name_ar"]
                                    : filtersList[index]["name_en"],
                            isSelected: index == filterIndex,
                            onClick: () {
                              setState(() {
                                filterIndex = index;
                              });
                            });
                      }),
                ],
              ),
            ),
            SizedBox(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 7,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return FoodCard(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const FoodDetails()));
                      },
                      productCat: 'معجنات',
                      productImage:
                          'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                      productName: 'بيتزا اقراص',
                      productPrice: 'السعر 1.4 ',
                    );
                  }),
            )
          ],
        ),
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