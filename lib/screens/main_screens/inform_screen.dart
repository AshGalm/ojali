import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ojali/widgets/clickable_widgets/main_button.dart';

import '../../helpers/const.dart';

class InformScreen extends StatefulWidget {
  const InformScreen({super.key});

  @override
  State<InformScreen> createState() => _InformScreenState();
}

class _InformScreenState extends State<InformScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController infoController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 200,
              ),
              Text(
                AppLocalizations.of(context)!.prob,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                  controller: infoController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 13.0, horizontal: 16),
                    fillColor: mainColor.withOpacity(0.2),
                    filled: true,
                    hintText: '',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                            BorderSide(color: mainColor.withOpacity(0.2))),
                    focusColor: mainColor.withOpacity(0.2),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Colors.red)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                            BorderSide(color: mainColor.withOpacity(0.4))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                            BorderSide(color: mainColor.withOpacity(0.2))),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 4),
              const SizedBox(
                height: 50,
              ),
              MainButton(
                  text: AppLocalizations.of(context)!.send,
                  withBorder: false,
                  widthFromScreen: 0.9,
                  isloading: false,
                  onPressed: () {},
                  isActive: true),
              const SizedBox(
                height: 10,
              ),
              MainButton(
                  text: AppLocalizations.of(context)!.back,
                  withBorder: true,
                  widthFromScreen: 0.9,
                  isloading: false,
                  onPressed: () {},
                  isActive: true),
              const Divider(),
              Text(
                AppLocalizations.of(context)!.issue,
                style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
