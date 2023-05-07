import 'package:flutter/material.dart';
import 'package:ojali/providers/user_provider.dart';
import 'package:ojali/widgets/clickable_widgets/main_button.dart';
import 'package:ojali/widgets/input_widgets/text_field_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../helpers/const.dart';
import '../../providers/dark_theme_provider.dart';
import '../../widgets/input_widgets/addres_field_widget.dart';

class UserSetting extends StatefulWidget {
  const UserSetting({super.key});

  @override
  State<UserSetting> createState() => _UserSettingState();
}

class _UserSettingState extends State<UserSetting> {
  @override
  void initState() {
    Provider.of<UserProvider>(context, listen: false).initUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userFunctions = Provider.of<UserProvider>(context, listen: false);
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController locationController = TextEditingController();

    // FirebaseAuth auth = FirebaseAuth.instance;

    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);

    //  Theme provider functions variable

    return Consumer<UserProvider>(builder: (context, userProvider, child) {
      return Scaffold(
        backgroundColor: themeListener.isDark ? darkColor : Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: themeListener.isDark
                ? lightColor
                : darkColor, //change your color here
          ),
          backgroundColor:
              themeListener.isDark ? Colors.transparent : Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child:
              Consumer<UserProvider>(builder: (context, userProvider, child) {
            return Column(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        // SizedBox(
                        //   height: 200,
                        //   child: Image.network(
                        //     'https://www.linkpicture.com/q/Personal-data-bro.png',
                        //   ),
                        // ),
                        // TextFieldWidget(
                        //     label: AppLocalizations.of(context)!.username,
                        //     controller: nameController,
                        //     hintText: '',
                        //     validator: (value) {
                        //       return null;
                        //     },
                        //     obSecureText: false),
                        Text(userProvider.userModel?.name.toString() ??
                            'no data'),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFieldWidget(
                            label: AppLocalizations.of(context)!.email,
                            controller: emailController,
                            hintText: "Exmaple@mail.com",
                            validator: (value) {
                              return null;
                            },
                            obSecureText: false),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFieldWidget(
                            label: AppLocalizations.of(context)!.phonenumber,
                            controller: phoneController,
                            hintText: "092",
                            validator: (value) {
                              return null;
                            },
                            obSecureText: false),
                        const SizedBox(
                          height: 20,
                        ),
                        AddresFieldWidget(
                            label: AppLocalizations.of(context)!.location,
                            controller: locationController,
                            hintText: "سلماني الفربي",
                            validator: (value) {
                              return null;
                            },
                            obSecureText: false),
                        const SizedBox(
                          height: 20,
                        ),
                        MainButton(
                            text: AppLocalizations.of(context)!.save,
                            withBorder: false,
                            widthFromScreen: 0.9,
                            isloading: false,
                            onPressed: () {},
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
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
        ),
      );
    });
  }
}
