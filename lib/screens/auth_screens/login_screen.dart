import 'package:flutter/material.dart';
// import 'package:ojali/widgets/clickable_widgets/main_button.dart';

// import '../../widgets/input_widgets/text_field_widget.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool enableLoginBtn = false;

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
