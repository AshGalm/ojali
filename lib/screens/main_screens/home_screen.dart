import 'package:flutter/material.dart';

import '../../widgets/input_widgets/text_field_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.ojali,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        leading: const Icon(Icons.shopping_cart),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFieldWidget(
                  controller: searchController,
                  hintText: AppLocalizations.of(context)!.search,
                  obSecureText: false,
                  perfix: const Icon(Icons.search),
                  validator: (String? value) {
                    return null;
                  }),
            )
          ],
        ),
      ),
    );
  }
}
