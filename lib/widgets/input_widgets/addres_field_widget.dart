import 'package:flutter/material.dart';
import 'package:ojali/helpers/const.dart';
import 'package:provider/provider.dart';

import '../../providers/dark_theme_provider.dart';

class AddresFieldWidget extends StatefulWidget {
  const AddresFieldWidget(
      {super.key,
      required this.controller,
      this.label,
      required this.hintText,
      required this.obSecureText,
      this.perfix,
      required this.validator});
  final TextEditingController controller;
  final String? label;
  final String hintText;
  final bool obSecureText;
  final Widget? perfix;
  final FormFieldValidator<String?> validator;

  @override
  State<AddresFieldWidget> createState() => _AddresFieldWidgetState();
}

class _AddresFieldWidgetState extends State<AddresFieldWidget> {
  @override
  Widget build(BuildContext context) {
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
            ),
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
            ),
            keyboardType: TextInputType.multiline,
            maxLines: 4)
      ],
    );
  }
}
