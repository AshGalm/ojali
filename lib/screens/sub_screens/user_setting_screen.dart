import 'package:flutter/material.dart';
import 'package:ojali/widgets/clickable_widgets/main_button.dart';
import 'package:ojali/widgets/input_widgets/text_field_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserSetting extends StatefulWidget {
  const UserSetting({super.key});

  @override
  State<UserSetting> createState() => _UserSettingState();
}

class _UserSettingState extends State<UserSetting> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController locationController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                      child: Image.network(
                        'https://www.linkpicture.com/q/Personal-data-bro.png',
                      ),
                    ),
                    TextFieldWidget(
                        label: AppLocalizations.of(context)!.username,
                        controller: nameController,
                        hintText: "aisha",
                        validator: (value) {
                          return null;
                        },
                        obSecureText: false),
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
                    MainButton(
                        text: AppLocalizations.of(context)!.back,
                        withBorder: true,
                        widthFromScreen: 0.9,
                        isloading: false,
                        onPressed: () {},
                        isActive: true),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
