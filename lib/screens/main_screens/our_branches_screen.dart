import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ojali/models/branches_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../helpers/const.dart';
import '../../providers/dark_theme_provider.dart';

class BranchesScreen extends StatefulWidget {
  const BranchesScreen({
    super.key,
    required this.branch,
  });
  final BranchesModel branch;

  @override
  State<BranchesScreen> createState() => _BranchesScreenState();
}

class _BranchesScreenState extends State<BranchesScreen> {
  @override
  Widget build(BuildContext context) {
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);

    return Scaffold(
        backgroundColor: themeListener.isDark ? darkColor : Colors.white,
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.branch.imageUrl),
                      fit: BoxFit.cover)),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .6,
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
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.localeName ==
                                          "ar"
                                      ? widget.branch.nameAr
                                      : widget.branch.nameEn,
                                  style: const TextStyle(
                                    fontSize: 26,
                                    color: appColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                FaIcon(
                                  FontAwesomeIcons.locationDot,
                                  size: 30,
                                  color: Colors.red.withOpacity(0.7),
                                ),
                              ],
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
                            AppLocalizations.of(context)!.open_time,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(AppLocalizations.of(context)!.am),
                          Text(widget.branch.openTime),
                          Text(
                            AppLocalizations.of(context)!.pm,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.detl,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            AppLocalizations.of(context)!.localeName == "ar"
                                ? widget.branch.desAr
                                : widget.branch.desEn,
                          ),
                        ],
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
                              child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () async {
                                    // const url =
                                    //     'https://www.facebook.com/alojaly.4.food';
                                    // final uri = Uri.parse(url);
                                    // if (await canLaunchUrl(uri)) {
                                    //   await launchUrl(uri);
                                    // } else {
                                    //   throw 'error in code';
                                    // }

                                    var androidUrl =
                                        "fb://profile/163345204323779";
                                    var iosUrl = "fb://profile/163345204323779";

                                    try {
                                      if (Platform.isIOS) {
                                        await launchUrl(Uri.parse(iosUrl));
                                      } else {
                                        await launchUrl(Uri.parse(androidUrl));
                                      }
                                    } on Exception {
                                      if (kDebugMode) {
                                        print("whatsapp not installed");
                                      }
                                    }
                                  },
                                  child: const FaIcon(
                                    FontAwesomeIcons.facebook,
                                    size: 40,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                    onTap: () async {
                                      // const url =
                                      //     'https://www.instagram.com/alojaly_4_food_/';
                                      // final uri = Uri.parse(url);
                                      // if (await canLaunchUrl(uri)) {
                                      //   await launchUrl(uri);
                                      // } else {
                                      //   throw 'error in code';
                                      // }

                                      var androidUrl =
                                          "instagram://user?username=alojaly_4_food_";
                                      var iosUrl =
                                          "instagram://user?username=alojaly_4_food_";

                                      try {
                                        if (Platform.isIOS) {
                                          await launchUrl(Uri.parse(iosUrl));
                                        } else {
                                          await launchUrl(
                                              Uri.parse(androidUrl));
                                        }
                                      } on Exception {
                                        if (kDebugMode) {
                                          print("instagram not installed");
                                        }
                                      }
                                    },
                                    child: const FaIcon(
                                      FontAwesomeIcons.instagram,
                                      size: 40,
                                      color: instColor,
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 40),
                                child: Text(
                                  AppLocalizations.of(context)!.contect,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          )),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () async {
                                final Uri url = Uri(
                                  scheme: 'sms',
                                  path: widget.branch.phone,
                                );
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url);
                                } else {
                                  if (kDebugMode) {
                                    print('no Phone Number');
                                  }
                                }
                              },
                              child: const Icon(
                                Icons.message,
                                size: 30,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () async {
                                final Uri url = Uri(
                                  scheme: 'tel',
                                  path: widget.branch.phone,
                                );
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url);
                                } else {
                                  if (kDebugMode) {
                                    print('no Phone Number');
                                  }
                                }
                              },
                              child: const Icon(
                                Icons.phone,
                                size: 30,
                              ),
                            ),
                          ),
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
