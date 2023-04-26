import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ojali/widgets/clickable_widgets/main_button.dart';
import 'package:ojali/widgets/input_widgets/text_field_widget.dart';
import 'package:provider/provider.dart';

import '../../helpers/const.dart';
import '../../providers/dark_theme_provider.dart';
import '../../widgets/input_widgets/addres_field_widget.dart';
import '../handling_screens/send_data_screen.dart';

class InformScreen extends StatefulWidget {
  const InformScreen({super.key});

  @override
  State<InformScreen> createState() => _InformScreenState();
}

class _InformScreenState extends State<InformScreen> {
  @override
  Widget build(BuildContext context) {
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);
    FirebaseAuth auth = FirebaseAuth.instance;

    //  Theme provider functions variable

    TextEditingController titleController = TextEditingController();
    TextEditingController infoController = TextEditingController();

    return Scaffold(
      backgroundColor: themeListener.isDark ? darkColor : Colors.white,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.rep,
          style: TextStyle(
            color: themeListener.isDark ? lightColor : darkColor,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: FaIcon(
              FontAwesomeIcons.bug,
              color: themeListener.isDark ? Colors.red : appColor,
            ),
          )
        ],
        backgroundColor:
            themeListener.isDark ? Colors.transparent : Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: themeListener.isDark
              ? lightColor
              : darkColor, //change your color here
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    AppLocalizations.of(context)!.prob,
                    style: TextStyle(
                        color: themeListener.isDark ? lightColor : darkColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                  label: AppLocalizations.of(context)!.title,
                  controller: titleController,
                  hintText: '',
                  validator: (String? value) {
                    return null;
                  },
                  obSecureText: false),

              const SizedBox(
                height: 20,
              ),

              AddresFieldWidget(
                label: AppLocalizations.of(context)!.issus_detils,
                controller: infoController,
                hintText: '',
                obSecureText: false,
                validator: (String? value) {
                  return null;
                },
              ),
              const SizedBox(
                height: 50,
              ),
              MainButton(
                  text: AppLocalizations.of(context)!.send,
                  withBorder: false,
                  widthFromScreen: 0.9,
                  isloading: false,
                  onPressed: () async {
                    FirebaseFirestore firestore = FirebaseFirestore.instance;
                    await firestore.collection('reportApp').add({
                      "title": titleController.text,
                      "des": infoController.text,
                      // "user": auth.currentUser
                    }).then((value) {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const SendDataScreen()),
                      );
                    });
                  },
                  isActive: true),
              const SizedBox(
                height: 10,
              ),
              // MainButton(
              //     text: AppLocalizations.of(context)!.back,
              //     withBorder: true,
              //     widthFromScreen: 0.9,
              //     isloading: false,
              //     onPressed: () {},
              //     isActive: true),
              Divider(
                color: themeListener.isDark
                    ? lightColor.withOpacity(0.2)
                    : darkColor.withOpacity(0.2),
              ),
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
