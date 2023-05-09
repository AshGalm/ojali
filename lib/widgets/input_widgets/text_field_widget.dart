import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helpers/const.dart';
import '../../providers/dark_theme_provider.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget(
      {super.key,
      required this.controller,
      this.label,
      required this.hintText,
      required this.validator,
      required this.obSecureText,
      this.onchange,
      this.perfix});
  final TextEditingController controller;
  final String? label;
  final String hintText;
  final bool obSecureText;
  final Widget? perfix;
  final Function? onchange;
  final FormFieldValidator<String?> validator;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    //  Theme provider functions variable
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);

    return Column(
      children: [
        if (widget.label != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.label ?? "",
                style: TextStyle(
                    color: themeListener.isDark ? lightColor : darkColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
            style: TextStyle(
                color: themeListener.isDark ? lightColor : darkColor,
                fontSize: 16),
            onChanged: (value) {
              widget.onchange!();
            },
            controller: widget.controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: widget.validator,
            obscureText: widget.obSecureText,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 13.0, horizontal: 16),
              suffixIcon: widget.perfix,
              fillColor: themeListener.isDark
                  ? lightColor.withOpacity(0.2)
                  : darkColor.withOpacity(0.2),
              filled: true,
              hintText: widget.hintText,
              hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                      color: themeListener.isDark
                          ? lightColor.withOpacity(0.2)
                          : darkColor.withOpacity(0.2))),
              focusColor: themeListener.isDark
                  ? darkColor.withOpacity(0.2)
                  : lightColor.withOpacity(0.2),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: appColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                      color: themeListener.isDark
                          ? lightColor.withOpacity(0.2)
                          : darkColor.withOpacity(0.2))),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                      color: themeListener.isDark
                          ? appColor.withOpacity(0.2)
                          : lightColor.withOpacity(0.2))),
            ))
      ],
    );
  }
}
