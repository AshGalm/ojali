import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ojali/screens/auth_screens/otp_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../helpers/const.dart';
import '../../providers/dark_theme_provider.dart';
import '../../widgets/clickable_widgets/main_button.dart';
import '../../widgets/input_widgets/text_field_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);

    //  Theme provider functions variable

    return Scaffold(
      backgroundColor: themeListener.isDark ? darkColor : Colors.white,
      appBar: AppBar(
        backgroundColor:
            themeListener.isDark ? Colors.transparent : Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: themeListener.isDark
              ? lightColor
              : darkColor, //change your color here
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.125,
            ),
            Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.restpass,
                  style: TextStyle(
                      color: themeListener.isDark ? lightColor : darkColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  AppLocalizations.of(context)!.restemail,
                  style: TextStyle(
                      color: themeListener.isDark ? lightColor : darkColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.100,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFieldWidget(
                controller: emailController,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return AppLocalizations.of(context)!.error_email;
                  }

                  if (!value.contains('.com') || !value.contains('@')) {
                    return AppLocalizations.of(context)!.error_email;
                  }

                  return null;
                },
                hintText: AppLocalizations.of(context)!.emailex,
                label: AppLocalizations.of(context)!.email,
                obSecureText: false,
              ),
            ),
            SizedBox(
              height: size.height * 0.2,
            ),
            Column(
              children: [
                MainButton(
                  text: AppLocalizations.of(context)!.continu,
                  withBorder: false,
                  isloading: false,
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => OtpScreen(
                                  email: emailController.text,
                                )));
                  },
                  widthFromScreen: 0.9,
                ),
                const SizedBox(
                  height: 10,
                ),
                MainButton(
                  text: AppLocalizations.of(context)!.back,
                  withBorder: true,
                  isloading: false,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  widthFromScreen: 0.9,
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
