import 'package:flutter/material.dart';

import '../../helpers/const.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget(
      {super.key,
      required this.controller,
      this.label,
      required this.hintText,
      required this.validator,
      required this.obSecureText,
      this.perfix});
  final TextEditingController controller;
  final String? label;
  final String hintText;
  final bool obSecureText;
  final Widget? perfix;
  final FormFieldValidator<String?> validator;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.label != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.label ?? "",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
            controller: widget.controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: widget.validator,
            obscureText: widget.obSecureText,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 13.0, horizontal: 16),
              suffixIcon: widget.perfix,
              fillColor: mainColor.withOpacity(0.2),
              filled: true,
              hintText: widget.hintText,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: mainColor.withOpacity(0.2))),
              focusColor: mainColor.withOpacity(0.2),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.red)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: mainColor.withOpacity(0.4))),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: mainColor.withOpacity(0.2))),
            ))
      ],
    );
  }
}
