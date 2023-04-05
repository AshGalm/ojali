import 'package:flutter/material.dart';
import 'package:ojali/widgets/clickable_widgets/filter_button.dart';
import 'package:ojali/widgets/clickable_widgets/food_card.dart';
import 'package:ojali/widgets/input_widgets/text_field_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  TextEditingController searchController = TextEditingController();
  int seletedTabIndex = 0;

  List filters = [
    'الكل',
    'معجنات',
    'سلاطات',
    'نواشف',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: filters.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return FilterButton(
                            btnTitle: filters[index],
                            isSelected: seletedTabIndex == index,
                            onClick: () {
                              setState(() {
                                seletedTabIndex = index;
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
                    return const FoodCard();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
