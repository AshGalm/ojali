import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ojali/screens/main_screens/inform_screen.dart';
import 'package:ojali/screens/sub_screens/user_setting_screen.dart';

import '../../widgets/clickable_widgets/switch_mode.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Setting',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          leading: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Icon(Icons.language),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.width * 0.5,
                  width: size.width * 0.5,
                  child: Image.network(
                    'https://www.linkpicture.com/q/Usability-testing-bro_1.png',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            AppLocalizations.of(context)!.usermode,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      const SwitchMode(),
                    ],
                  ),
                ),
                //

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.person_rounded,
                        size: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const UserSetting()));
                          },
                          child: Text(
                            AppLocalizations.of(context)!.account,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.lock_rounded,
                        size: 40,
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            AppLocalizations.of(context)!.changepass,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.warning_rounded,
                        size: 40,
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const InformScreen()));
                          },
                          child: Text(
                            AppLocalizations.of(context)!.tellisu,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.output_rounded,
                        size: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            AppLocalizations.of(context)!.logout,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: MainButton(
                //       text: AppLocalizations.of(context)!.logout,
                //       withBorder: true,
                //       widthFromScreen: 0.5,
                //       isloading: false,
                //       onPressed: () {},
                //       isActive: true),
                // )
              ],
            ),
          ),
        ));
  }
}




// Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children: [
//                   const Icon(
//                     Icons.person_rounded,
//                     size: 50,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: GestureDetector(
//                       onTap: () {},
//                       child: const Text(
//                         'Edit User Data',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.w600),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children: [
//                   const Icon(
//                     Icons.lock_rounded,
//                     size: 50,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: GestureDetector(
//                       onTap: () {},
//                       child: const Text(
//                         'Change User Password',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.w600),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children: [
//                   const Icon(
//                     Icons.warning_rounded,
//                     size: 50,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: GestureDetector(
//                       onTap: () {},
//                       child: const Text(
//                         'Error ',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.w600),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: MainButton(
//                   text: 'Log Out',
//                   withBorder: true,
//                   widthFromScreen: 0.5,
//                   isloading: false,
//                   onPressed: () {},
//                   isActive: true),
//             )
//           ],
//         ),
//       ),