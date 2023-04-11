import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ojali/main.dart';
import 'package:ojali/screens/auth_screens/sing_up_screen.dart';
import 'package:ojali/widgets/clickable_widgets/main_button.dart';

import '../../helpers/const.dart';
import '../../widgets/input_widgets/text_field_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../main_screens/reset_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool enableLoginBtn = false;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;

  // static const snackBar =
  //     SnackBar(content: Text('wrong  password please enter the correct one'));

  @override
  Widget build(BuildContext context) {
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
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFieldWidget(
                      label: AppLocalizations.of(context)!.email,
                      controller: emailController,
                      hintText: AppLocalizations.of(context)!.email,
                      obSecureText: false,
                      // perfix: const Icon(Icons.phone),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return AppLocalizations.of(context)!.error_phone;
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.forget,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: ((context) =>
                                        const ResetPasswordScreen())));
                          },
                          child: Text(
                            AppLocalizations.of(context)!.reset,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: mainColor,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
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
                            text: AppLocalizations.of(context)!.login,
                            withBorder: false,
                            widthFromScreen: 0.9,
                            isloading: false,
                            onPressed: () async {
                              auth
                                  .signInWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text)
                                  .then((value) async {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => const MyApp()),
                                    (route) => false);
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
                            text: AppLocalizations.of(context)!.signup,
                            withBorder: true,
                            widthFromScreen: 0.9,
                            isloading: false,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: ((context) =>
                                          const SingUpScreen())));
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
