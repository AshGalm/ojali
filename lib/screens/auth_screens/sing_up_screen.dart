import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ojali/widgets/clickable_widgets/main_button.dart';
import 'package:flutter/cupertino.dart';

import '../../widgets/input_widgets/text_field_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../main_screens/home_screen.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool enableLoginBtn = false;

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    'assets/logo2.png',
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFieldWidget(
                      label: AppLocalizations.of(context)!.email,
                      controller: emailController,
                      hintText: AppLocalizations.of(context)!.email,
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
                    padding: const EdgeInsets.all(8.0),
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
                            onPressed: () async {
                              await auth
                                  .createUserWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text)
                                  .then((value) async {
                                firestore.collection('useers').add({
                                  "uid": value.user!.uid,
                                  "email": value.user!.uid,
                                }).then((value) async {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) =>
                                              const HomeScreen()),
                                      (route) => false);
                                });
                              });
                            },
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
      ),
    );
  }
}
