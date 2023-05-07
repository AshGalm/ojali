import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:ojali/screens/auth_screens/login_screen.dart';

import '../../helpers/const.dart';
import '../../widgets/static_widgets/intro_card.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    List<Widget> listPagesViewModel = [
      IntroCard(
        image: 'assets/introscreen/intro1.png',
        title: AppLocalizations.of(context)!.shope,
      ),
      IntroCard(
        image: 'assets/introscreen/intro2.png',
        title: AppLocalizations.of(context)!.shope2,
      ),
      IntroCard(
        image: 'assets/introscreen/intro3.png',
        title: AppLocalizations.of(context)!.shope3,
      ),
    ];

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 120,
          ),
          Expanded(
            child: IntroductionScreen(
              rawPages: listPagesViewModel,
              done: Container(
                decoration: BoxDecoration(
                    color: appColor, borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                  child: Text(
                    AppLocalizations.of(context)!.entr,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              next: Container(
                decoration: BoxDecoration(
                    color: appColor, borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                  child: Text(
                    AppLocalizations.of(context)!.next,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              skip: Text(
                AppLocalizations.of(context)!.skip,
                style: const TextStyle(
                    color: appColor, fontWeight: FontWeight.bold),
              ),
              showSkipButton: true,
              dotsDecorator: DotsDecorator(
                  size: const Size.square(6.0),
                  activeSize: const Size(30.0, 6.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  color: appColor.withOpacity(0.5),
                  activeColor: appColor),
              onSkip: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              onDone: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
