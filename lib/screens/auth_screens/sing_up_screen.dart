import 'package:flutter/material.dart';
import 'package:ojali/widgets/clickable_widgets/main_button.dart';

import '../../widgets/input_widgets/text_field_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool enableLoginBtn = false;

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SingleChildScrollView(
          child: Form(
            key: loginFormKey,
            onChanged: () {
              setState(() {
                enableLoginBtn = loginFormKey.currentState!.validate();
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/logo.png',
                    width: size.width,
                    height: size.width * 0.4,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFieldWidget(
                    label: AppLocalizations.of(context)!.username,
                    controller: nameController,
                    hintText: AppLocalizations.of(context)!.name,
                    obSecureText: false,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return AppLocalizations.of(context)!.error_name;
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFieldWidget(
                    label: AppLocalizations.of(context)!.phonenumber,
                    controller: phoneController,
                    hintText: AppLocalizations.of(context)!.phone,
                    obSecureText: false,
                    perfix: const Icon(Icons.phone),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return AppLocalizations.of(context)!.error_phone;
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFieldWidget(
                    label: AppLocalizations.of(context)!.password,
                    controller: passwordController,
                    hintText: AppLocalizations.of(context)!.pass,
                    obSecureText: false,
                    perfix: const Icon(Icons.remove_red_eye_outlined),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return AppLocalizations.of(context)!.error_password;
                      }
                      if (value.length < 8) {
                        return AppLocalizations.of(context)!.error_pass1;
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MainButton(
                          text: AppLocalizations.of(context)!.signup,
                          withBorder: false,
                          widthFromScreen: 0.9,
                          isloading: false,
                          onPressed: () {},
                          isActive: enableLoginBtn),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        AppLocalizations.of(context)!.ac_sing,
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MainButton(
                          text: AppLocalizations.of(context)!.login,
                          withBorder: true,
                          widthFromScreen: 0.9,
                          isloading: false,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          isActive: true),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
